//
//  AppDelegate.m
//  StocksBar
//
//  Created by dangjiahe on 2020/2/27.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import "AppDelegate.h"
#import "PopViewController.h"

@interface AppDelegate ()
@property (strong) NSStatusItem* bar;
@property (strong) NSPopover* popOver;
@property (strong) PopViewController* VC;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self setUpPopView];
    [self setUpStatusItem];
    [self setUpPopOver];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)setUpStatusItem {
    self.bar = [[NSStatusBar systemStatusBar]statusItemWithLength:-1];
    self.bar.button.image = [NSImage imageNamed:@"status_icon"];
    [self.bar.button setAction:@selector(statusOnClick:)];
}

- (void)setUpPopView {
    self.VC = [[PopViewController alloc]initWithNibName:@"PopViewController" bundle:nil];
    self.VC.view.layer.backgroundColor = [NSColor blackColor].CGColor;
}

- (void)setUpPopOver {
    self.popOver = [[NSPopover alloc]init];
            
    self.popOver.appearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
    self.popOver.contentViewController = self.VC;
//    self.popOver.behavior = NSPopoverBehaviorSemitransient;
    self.popOver.behavior = NSPopoverBehaviorTransient;
}

- (void)statusOnClick:(NSStatusItem *)item{

     NSLog(@"statusOnClick ----- ");
    [self.popOver showRelativeToRect:self.bar.button.bounds ofView:self.bar.button preferredEdge:NSRectEdgeMaxY];
}

@end
