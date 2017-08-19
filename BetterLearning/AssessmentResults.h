//
//  AssessmentResults.h
//  BetterLearning
//
//  Created by Sharma, Siddharth on 2/12/17.
//

#import "AsssmentTestSummary.h"

@interface AssessmentResults : NSObject

@property (nonatomic) AsssmentTestSummary *currentItem;

- (void)getAssessmentSummaryRecord;
- (void)insertAssessmentSummaryRecord;
- (void)updateAssessmentSummaryRecord;
- (void)removeAssessmentSummaryRecord;
    
@end
