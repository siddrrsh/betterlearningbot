//
//  AssessmentResults.m
//  BetterLearning
//
//  Created by Sharma, Siddharth on 2/12/17.
//

#import <Foundation/Foundation.h>

#import "AssessmentResults.h"
#import "AsssmentTestSummary.h"
@import AWSDynamoDB;
#import <AWSMobileHubHelper/AWSMobileHubHelper.h>

@implementation AssessmentResults : NSObject 
    
- (void)insertAssessmentSummaryRecord {
    AWSDynamoDBObjectMapper *objectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AsssmentTestSummary *itemToCreate = [AsssmentTestSummary new];
    
    NSNumber *addedTest = [NSNumber numberWithInteger:1];
    
    if (self.currentItem != nil) {
        itemToCreate._testid = self.currentItem._testid;
        itemToCreate._testtype = self.currentItem._testtype;
        itemToCreate._totalscore = self.currentItem._totalscore;
        itemToCreate._averagescore = self.currentItem._averagescore;
        itemToCreate._modescore = self.currentItem._modescore;
        itemToCreate._totaltests = @([self.currentItem._totaltests integerValue] + [addedTest integerValue]);
        itemToCreate._stddevscore = self.currentItem._stddevscore;
    }
    else {
        itemToCreate._testid = @"BetterLearning-1";
        itemToCreate._testtype = @"BetterLearning";
        itemToCreate._totalscore = [NSNumber numberWithInteger:0];
        itemToCreate._averagescore = [NSNumber numberWithInteger:0];
        itemToCreate._modescore = [NSNumber numberWithInteger:0];
        itemToCreate._totaltests = [NSNumber numberWithInteger:0];
        itemToCreate._stddevscore = [NSNumber numberWithInteger:0];
    
    }
    
    [objectMapper save:itemToCreate
     completionHandler:^(NSError * _Nullable error) {
         if (error) {
             NSLog(@"Amazon DynamoDB Save Error: %@", error);
             return;
         }
         NSLog(@"DynamoDB Save Successful.");
         self.currentItem = itemToCreate;
     }];
}

- (void)updateAssessmentSummaryRecord {
    AWSDynamoDBObjectMapper *objectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AsssmentTestSummary *itemToUpdate = [AsssmentTestSummary new];
    
    NSNumber *addedTest = [NSNumber numberWithInteger:1];
    
    if (self.currentItem != nil) {
        itemToUpdate._testid = self.currentItem._testid;
        itemToUpdate._testtype = self.currentItem._testtype;
        itemToUpdate._totalscore = self.currentItem._totalscore;
        itemToUpdate._averagescore = self.currentItem._averagescore;
        itemToUpdate._modescore = self.currentItem._modescore;
        itemToUpdate._totaltests = @([self.currentItem._totaltests integerValue] + [addedTest integerValue]);
        itemToUpdate._stddevscore = self.currentItem._stddevscore;
    }
    else {
        itemToUpdate._testid = @"BetterLearning-1";
        itemToUpdate._testtype = @"BetterLearning";
        itemToUpdate._totalscore = [NSNumber numberWithInteger:0];
        itemToUpdate._averagescore = [NSNumber numberWithInteger:0];
        itemToUpdate._modescore = [NSNumber numberWithInteger:0];
        itemToUpdate._totaltests = [NSNumber numberWithInteger:0];
        itemToUpdate._stddevscore = [NSNumber numberWithInteger:0];
        
    }
    
    [[objectMapper save:itemToUpdate]
    continueWithExecutor:[AWSExecutor mainThreadExecutor] withBlock:^id(AWSTask *task) {
        if (!task.error) {
            NSLog(@"DynamoDB Save Successful.");
            self.currentItem = itemToUpdate;

        } else {
            NSLog(@"Amazon DynamoDB Save Error: %@", task.error);
        }
        return nil;
    }];
}
     
    
- (void)getAssessmentSummaryRecord {
    
    AWSDynamoDBObjectMapper *objectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

    [[objectMapper load:AsssmentTestSummary.class hashKey:@"BetterLearning" rangeKey:@"BetterLearning-1"]
    continueWithExecutor:[AWSExecutor mainThreadExecutor] withBlock:^id(AWSTask *task) {
    if (!task.error) {
        self.currentItem = (AsssmentTestSummary *)task.result;
        NSLog(@"TestType: [%@]", self.currentItem._testid);
        if (self.currentItem._testid == nil) {
            self.currentItem = nil;
        }
        else {
            [self updateAssessmentSummaryRecord];
        }
    } else {
        NSLog(@"Error: [%@]", task.error);
        self.currentItem = nil;
    }
    return nil;
    }];
}
    
- (void)removeAssessmentSummaryRecord {
    
    if (self.currentItem == nil) {
        [self insertAssessmentSummaryRecord];
        return;
    }
    
    AWSDynamoDBObjectMapper *objectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AsssmentTestSummary *itemToRemove = [AsssmentTestSummary new];
    
    itemToRemove._testid = self.currentItem._testid;
    itemToRemove._testtype = self.currentItem._testtype;
    itemToRemove._totalscore = self.currentItem._totalscore;
    itemToRemove._averagescore = self.currentItem._averagescore;
    itemToRemove._modescore = self.currentItem._modescore;
    itemToRemove._totaltests = self.currentItem._totaltests;
    itemToRemove._stddevscore = self.currentItem._stddevscore;
    
    [objectMapper remove:itemToRemove
     completionHandler:^(NSError * _Nullable error) {
         if (error) {
             NSLog(@"Amazon DynamoDB Remove Error: %@", error);
             return;
         }
         NSLog(@"DynamoDB Remove Successful.");
          [self insertAssessmentSummaryRecord];
     }];
}
    
@end
