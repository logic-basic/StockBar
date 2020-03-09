//
//  PopViewController.m
//  StocksBar
//
//  Created by dangjiahe on 2020/2/27.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import "PopViewController.h"
#import "StockView.h"
#import "StockData.h"

@interface PopViewController ()<NSTableViewDataSource,NSTableViewDelegate>
@property (strong) IBOutlet NSTableView *tableView;
@property (strong) NSMutableArray* array;

@end

@implementation PopViewController



- (instancetype)initWithNibName:(NSNibName)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    id tmp = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.array = [[NSMutableArray alloc] init];
    
    StockView* stockShangZhen = [[StockView alloc]initWithFrame:NSMakeRect(0, 0, 300, 40)];
    StockView* stockSheng = [[StockView alloc]initWithFrame:NSMakeRect(0, 0, 300, 40)];
    [stockShangZhen setStockCode:@"s_sh000001"];
    [stockShangZhen update];
    
    [stockSheng setStockCode:@"s_sz399001"];
    [stockSheng update];
    
    
    [_array addObject:stockShangZhen];
    [_array addObject:stockSheng];
    

    return tmp;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
//    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;

    // Do view setup here.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 2;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSView* view = [[NSView alloc]init];
    NSLog(@"row %ld", row);
    StockView* stockView = self.array[row];
    [stockView becomeResponse];
    return stockView;
}

- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return true;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return true;
}

- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row {
    
}

//- (void)tableViewSelectionDidChange:(NSNotification *)notification {
//    NSLog(@"123");
//}

- (IBAction)onAddStock:(id)sender {
    
    StockView* stockView = [[StockView alloc]initWithFrame:NSMakeRect(0, 0, 300, 40)];
    [_array addObject:stockView];
    
    [self.tableView beginUpdates];
    NSIndexSet* theIndexSet = [NSIndexSet indexSetWithIndex:self.array.count-1];
    [self.tableView insertRowsAtIndexes:theIndexSet withAnimation:NSTableViewAnimationEffectFade];
    [self.tableView endUpdates];
}

- (IBAction)onDelStock:(id)sender {
    NSInteger row = [self.tableView selectedRow];
    if (row < 0) {
        return;
    }
    [self.array removeObjectAtIndex:row];
    
    [self.tableView beginUpdates];
    NSIndexSet* theIndexSet = [NSIndexSet indexSetWithIndex:row];
    [self.tableView removeRowsAtIndexes:theIndexSet withAnimation:NSTableViewAnimationEffectFade];
    [self.tableView endUpdates];
}

- (IBAction)exit:(id)sender {
    [[NSApplication sharedApplication]terminate:sender];
}

- (IBAction)test:(id)sender {
    NSLog(@"123");
    [_array[0] setBoxFrame:NSMakeRect(0, 0, 250, 40)];
}

@end
