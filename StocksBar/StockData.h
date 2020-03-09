//
//  StockData.h
//  StocksBar
//
//  Created by dangjiahe on 2020/3/4.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StockData : NSObject

- (instancetype)initWithStockCode:(NSString*)code;
- (void) updatePrice;

@property (strong) NSString* stockCode;
@property (strong) NSString* stockPrice;
@property (strong) NSString* stockName;
@end

NS_ASSUME_NONNULL_END
