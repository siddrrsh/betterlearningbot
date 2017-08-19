//
//  ViewController.m
//  BetterLearningObjC
//
//  Created by Siddharth, Sharma on 2/11/17.
//

#import "ViewController.h"
#import <AWSMobileHubHelper/AWSMobileHubHelper.h>
#import <AWSLex/AWSLex.h>
#import "AWSConfiguration.h"
#import "AssessmentViewController.h"
#import "ResultsProcessor.h"

@interface ViewController ()<AWSLexVoiceButtonDelegate>
    
    @end

@implementation ViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [AWSIdentityManager defaultIdentityManager].identityId;
    
    // Set the bot configuration details
    // You can use the configuration constants defined in AWSConfiguration.h file
    NSString *botName = BetterLearningBotName;
    NSString *botAlias = BetterLearningBotAlias;
    AWSRegionType botRegion = AWSRegionUSEast1;
    
    // set up the configuration for AWS Voice Button
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:botRegion credentialsProvider: [AWSIdentityManager defaultIdentityManager].credentialsProvider];
    AWSLexInteractionKitConfig *interactionConfig = [AWSLexInteractionKitConfig defaultInteractionKitConfigWithBotName:botName botAlias:botAlias];
    interactionConfig.noSpeechTimeoutInterval = 10; // increase to 10 seconds
    
    // register the interaction kit client for the voice button using the `AWSLexVoiceButtonKey` constant defined in SDK
    [AWSLexInteractionKit registerInteractionKitWithServiceConfiguration:serviceConfiguration interactionKitConfiguration:interactionConfig forKey:AWSLexVoiceButtonKey];
    
    // set the voice button delegate
    self.voiceButton.delegate = self;
    
    // set scores button to be disabled until results are available
    [self.scoresButton setEnabled:true];
        
    // Initialize results Processor
    self.rp = [[ResultsProcessor alloc] init];
    [self.rp initialize];
}
    
- (void)voiceButton:(AWSLexVoiceButton *)button onResponse:(AWSLexVoiceButtonResponse *)response {

    // handle response from the voice button here
    NSLog(@"on text output %@", response.outputText);
    NSLog(@"Dialog State %ld", (long)response.dialogState);

    //AWSLexDialogStateUnknown,
    //AWSLexDialogStateElicitIntent,
    //AWSLexDialogStateConfirmIntent,
    //AWSLexDialogStateElicitSlot,
    //AWSLexDialogStateFulfilled,
    //AWSLexDialogStateReadyForFulfillment,
    //AWSLexDialogStateFailed,
    
    if (response.dialogState == AWSLexInteractionKitErrorCodeDialogFailed) {
    }
    if ((response.dialogState == AWSLexDialogStateFulfilled) && (response.slots.count == 2)) {
        self.StatusLabel.text = @"Thanks. Tap Mic and say Start First Test.";
        [self.view setNeedsDisplay];
    }
    if (response.dialogState == AWSLexDialogStateFailed) {
        //self.StatusLabel.text = @"Please retry";
        //[self.view setNeedsDisplay];
    }
}
    
- (void)voiceButton:(AWSLexVoiceButton *)button onError:(NSError *)error {
    NSLog(@"error %@", error);
    self.StatusLabel.text = @"Retry by tapping mic and saying Start First Test";
    [self.view setNeedsDisplay];
}

- (void)voiceButtononReadyToFullFill:(AWSLexVoiceButton *)button withSlots:(NSDictionary *)slots {
    
    if ((slots != nil) && (slots.count == 2)) {
        //self.StatusLabel.text = @"Thanks. Tap Mic and say Start First Test.";
        //[self.view setNeedsDisplay];

    }
    
    if ((slots != nil) && (slots.count == 5)) {
        for (id key in slots) {
            NSLog(@"key: %@, value: %@", key, [slots objectForKey:key]);
            if ([key isEqualToString: @"SentenceTestFive"]) {
                //self.StatusLabel.text = @"Thanks. Tap Mic and say Start Second Test.";
            } else
            if ([key isEqualToString: @"LinguisticTestFive"]) {
                //self.StatusLabel.text = @"Thanks. Tap Mic and say Start Third Test.";
            }
            else
            if ([key isEqualToString: @"WordStructureTestFive"]) {
                self.StatusLabel.text = @"Thanks. Now you can see your scores.";
            }
        }
    }
    
    [self.rp processResults:slots];
    [self.scoresButton setEnabled:true];
    [self.view setNeedsDisplay];
}

    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AssessmentViewController *destViewController = (AssessmentViewController*)segue.destinationViewController;
    if ([[segue identifier] isEqualToString:@"resetButtonSegue"]) {
        [self.rp initialize];
    }
    destViewController.assessmentScores = self.rp.scores;
}
    
- (IBAction)myUnwindAction:(UIStoryboardSegue*)unwindSegue {
    
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
    
@end
