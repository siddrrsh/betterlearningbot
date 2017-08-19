//
//  ResultsProcessor.m
//  BetterLearning
//
//  Created by Sharma, Siddharth on 2/21/17.
//

#import <Foundation/Foundation.h>
#import "ResultsProcessor.h"

@implementation ResultsProcessor

-(id)init
{
    if (self = [super init])
    {
        NSArray *keys = @[@"TotalCorrect", @"SentenceComprehension", @"LinguisticConcepts", @"SentenceStructure"];
        NSArray *scorevalues = @[[NSNumber numberWithInt:0],
                           [NSNumber numberWithInt:0],
                           [NSNumber numberWithInt:0],
                           [NSNumber numberWithInt:0]];
        
        
        self.scores = [NSMutableDictionary dictionaryWithObjects:scorevalues forKeys:keys];
    }
    return self;
}


- (void)initialize {
    self.scores[@"TotalCorrect"] = @(0);
    self.scores[@"SentenceComprehension"] = @(0);
    self.scores[@"LinguisticConcepts"] = @(0);
    self.scores[@"SentenceStructure"] = @(0);
}



- (void)processResults:(NSDictionary *)slots {
    int slot = 0;
    NSString *slotValue = nil;
    
    NSArray *slotArray = @[@"SentenceTestOne", @"SentenceTestTwo",
                           @"SentenceTestThree",
                           @"SentenceTestFour",@"SentenceTestFive",@"LinguisticTestOne",
                           @"LinguisticTestTwo", @"LinguisticTestThree", @"LinguisticTestFour",
                           @"LinguisticTestFive", @"WordStructureTestOne", @"WordStructureTestTwo",
                           @"WordStructureTestThree", @"WordStructureTestFour", @"WordStructureTestFive"];
  
    if ((slots != nil) && (slots.count == 5)) {
        for (id key in slots) {
            NSLog(@"key: %@, value: %@", key, [slots objectForKey:key]);
            slotValue = [slots objectForKey:key];
            slot = [slotArray indexOfObject:key];
            
            switch (slot) {
                case 0: //SentenceTestOne
                    if ([[slotValue lowercaseString] containsString:@"black"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceComprehension"] = @([self.scores[@"SentenceComprehension"] intValue] + 1);
                    }
                    break;
                case 1: //SentenceTestTwo
                    if ([[slotValue lowercaseString] containsString:@"book"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceComprehension"] = @([self.scores[@"SentenceComprehension"] intValue] + 1);
                    }
                    break;
                case 2: //SentenceTestThree
                    if ([[slotValue lowercaseString] containsString:@"brown"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceComprehension"] = @([self.scores[@"SentenceComprehension"] intValue] + 1);
                    }
                    break;
                case 3: //SentenceTestFour
                    if ([[slotValue lowercaseString] containsString:@"horse"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceComprehension"] = @([self.scores[@"SentenceComprehension"] intValue] + 1);
                    }
                case 4: //SentenceTestFive
                    if ([[slotValue lowercaseString] containsString:@"football"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceComprehension"] = @([self.scores[@"SentenceComprehension"] intValue] + 1);
                    }
                case 5: //LinguisticTestOne
                    if ([[slotValue lowercaseString] containsString:@"dog"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"LinguisticConcepts"] = @([self.scores[@"LinguisticConcepts"] intValue] + 1);
                    }
                    break;
                case 6: //LinguisticTestTwo
                    if ([[slotValue lowercaseString] containsString:@"chocolate"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"LinguisticConcepts"] = @([self.scores[@"LinguisticConcepts"] intValue] + 1);
                    }
                    break;
                case 7: //LinguisticTestThree
                    if ([[slotValue lowercaseString] containsString:@"morning"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"LinguisticConcepts"] = @([self.scores[@"LinguisticConcepts"] intValue] + 1);
                    }
                    break;
                case 8: //LinguisticTestFour
                    if ([[slotValue lowercaseString] containsString:@"2"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"LinguisticConcepts"] = @([self.scores[@"LinguisticConcepts"] intValue] + 1);
                    }
                    break;
                case 9: //LinguisticTestFive
                    if ([[slotValue lowercaseString] containsString:@"french"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"LinguisticConcepts"] = @([self.scores[@"LinguisticConcepts"] intValue] + 1);
                    }
                case 10: //WordStructureTestOne
                    if ([[slotValue lowercaseString] containsString:@"pilot"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceStructure"] = @([self.scores[@"SentenceStructure"] intValue] + 1);
                    }
                    break;
                case 11: //WordStructureTestTwo
                    if ([[slotValue lowercaseString] containsString:@"elephant"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceStructure"] = @([self.scores[@"SentenceStructure"] intValue] + 1);
                    }
                    break;
                case 12: //WordStructureTestThree
                    if ([[slotValue lowercaseString] containsString:@"charlie"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceStructure"] = @([self.scores[@"SentenceStructure"] intValue] + 1);
                    }
                    break;
                case 13: //WordStructureTestFour
                    if ([[slotValue lowercaseString] containsString:@"juice"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceStructure"] = @([self.scores[@"SentenceStructure"] intValue] + 1);
                    }
                    break;
                case 14: //WordStructureTestFive
                    if ([[slotValue lowercaseString] containsString:@"jack"]) {
                        self.scores[@"TotalCorrect"] = @([self.scores[@"TotalCorrect"] intValue] + 1);
                        self.scores[@"SentenceStructure"] = @([self.scores[@"SentenceStructure"] intValue] + 1);
                    }
                    break;
                default:
                    break;
            }
            
        }
    }
    
}

@end
