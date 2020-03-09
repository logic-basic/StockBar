//
//  StockData.m
//  StocksBar
//
//  Created by dangjiahe on 2020/3/4.
//  Copyright © 2020 dangjiahe. All rights reserved.
//

#import "StockData.h"

@implementation StockData

- (NSString *)stringFromGB2313:(NSData *)data {
    NSStringEncoding encoding;
    encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [[NSString alloc] initWithData:data encoding:encoding];
}

- (void) updatePrice {
    NSURL* url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://hq.sinajs.cn/list=%@",_stockCode]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    NSString *html = [self stringFromGB2313:result];
    NSArray* array = [html componentsSeparatedByString:@","];
    
    if (array.count == 1) {
        self.stockPrice = @"未知";
        self.stockName = @"未知";
        return;
    }
    
    if ([_stockCode isEqualToString:@"s_sh000001"] || [_stockCode isEqualToString:@"s_sz399001"]) {
        self.stockPrice = array[1];
        self.stockName = [array[0] substringFromIndex:[array[0] rangeOfString:@"\""].location+1];
    } else {
        self.stockPrice = array[3];
        self.stockName = [array[0] substringFromIndex:[array[0] rangeOfString:@"\""].location+1];
    }
    
}

- (id)initWithStockCode:(NSString*)code {
    self = [super init];
    self.stockCode = code;
    [self updatePrice];
    return self;
}

@end
