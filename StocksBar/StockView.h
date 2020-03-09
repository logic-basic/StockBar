//
//  StockView.h
//  StocksBar
//
//  Created by dangjiahe on 2020/3/3.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface StockView : NSView

- (void)update;
- (void)setStockCode:(NSString*)code;
//- (void)setStockName:(NSString*)name;
//- (void)setStockPrice:(NSString*)price;

- (void)becomeResponse;
- (void)setBoxFrame:(NSRect)frame;

@end

NS_ASSUME_NONNULL_END
