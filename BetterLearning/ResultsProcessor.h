//
//  ResultsProcessor.h
//  BetterLearning
//
//  Created by Sharma, Siddharth on 2/21/17.
//

@interface ResultsProcessor : NSObject

@property (strong) NSMutableDictionary *scores;

- (void)processResults:(NSDictionary *)slots;
- (void)initialize;

@end
