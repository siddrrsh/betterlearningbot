//
//  AssessmentViewController.m
//  BetterLearningObjC
//
//  Created by Sharma, Siddharth on 2/11/17.
//

#import <Foundation/Foundation.h>
#import "AssessmentViewController.h"
#import "AssessmentResults.h"
#import <objc/runtime.h>

@implementation AssessmentViewController {
    NSArray *tableData;
    NSArray *tableValues;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AssessmentResults *ar = [[AssessmentResults alloc] init];
    [ar getAssessmentSummaryRecord];
    
    if (ar.currentItem == nil) {
        tableData = [NSArray arrayWithObjects:
                   @"Total Correct",
                   @"Comprehension",
                   @"Linguistic Concepts",
                   @"Sentence Structure",
                   @"Average Score out of 15",
                   //@"Total Number of Tests",
                   nil];
        tableValues = [NSArray arrayWithObjects:
                   self.assessmentScores[@"TotalCorrect"],
                   self.assessmentScores[@"SentenceComprehension"],
                   self.assessmentScores[@"LinguisticConcepts"],
                   self.assessmentScores[@"SentenceStructure"],
                   @("12"),
                   //ar.currentItem._totalscore,
                   nil];
    }
    else {
        tableData = [NSArray arrayWithObjects:
                     @"Total Correct",
                     @"Comprehension",
                     @"Linguistic Concepts",
                     @"Sentence Structure",
                     @"Average Score out of 15",
                     @"Total Number of Tests",
                     nil];
        tableValues = [NSArray arrayWithObjects:
                       self.assessmentScores[@"TotalCorrect"],
                       self.assessmentScores[@"SentenceComprehension"],
                       self.assessmentScores[@"LinguisticConcepts"],
                       self.assessmentScores[@"SentenceStructure"],
                       @("12"),
                       ar.currentItem._totalscore,
                       nil];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *resultsTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resultsTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:resultsTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[tableValues objectAtIndex:indexPath.row]];
    return cell;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
