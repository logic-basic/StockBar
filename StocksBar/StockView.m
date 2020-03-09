//
//  StockView.m
//  StocksBar
//
//  Created by dangjiahe on 2020/3/3.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import "StockView.h"
#import "StockData.h"

@interface StockView()
@property (strong) IBOutlet StockView *view;
@property (strong) IBOutlet NSTextField *code;
@property (strong) IBOutlet NSTextField *name;
@property (strong) IBOutlet NSTextField *price;
@property (strong) IBOutlet NSBox *box;

@property (strong) StockData* stock;
@end


@implementation StockView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)LoadNibView {
    [[NSBundle mainBundle]loadNibNamed:@"StockView" owner:self topLevelObjects:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self LoadNibView];
        [self.code setEditable:true];
    }
    return self;
}

- (void)setStockCode:(NSString*)code {
    self.code.stringValue = code;
    if (self.stock == nil) {
        self.stock = [[StockData alloc]initWithStockCode:code];
    } else {
        [self.stock setStockCode:code];
    }
    
}
- (IBAction)onCodeEndEdit:(id)sender {
    [self setStockCode:self.code.stringValue];
    [self update];
    NSLog(@"onEndEdit");
}

- (void)update {
    [self.stock updatePrice];
    self.name.stringValue = self.stock.stockName;
    self.price.stringValue = self.stock.stockPrice;
}

- (void)becomeResponse {
    [self.code becomeFirstResponder];
}


- (void)setBoxFrame:(NSRect)frame {
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext]setDuration:1.0f];
    [self.box.animator setFrame:frame];
    
    [NSAnimationContext endGrouping];
//    [self.box setFrame:frame];
}

@end
