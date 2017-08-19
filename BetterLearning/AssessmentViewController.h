//
//  AssessmentViewController.h
//  BetterLearningObjC
//
//  Created by Sharma, Siddharth on 2/11/17.
//

#import <UIKit/UIKit.h>

@interface AssessmentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDictionary *assessmentScores;

@end
