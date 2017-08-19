//
//  ViewController.h
//  BetterLearningObjC
//
//  Created by Sharma, Siddharth on 2/11/17.
//

#import <UIKit/UIKit.h>
#import <AWSLex/AWSLex.h>
#import "ResultsProcessor.h"

@interface ViewController : UIViewController

    @property (weak, nonatomic) IBOutlet AWSLexVoiceButton *voiceButton;
    @property (weak, nonatomic) IBOutlet UILabel *StatusLabel;
    @property (nonatomic) ResultsProcessor *rp;
    @property (weak, nonatomic) IBOutlet UIButton *scoresButton;
    @property (weak, nonatomic) IBOutlet UIButton *resetButton;
    
@end

