# betterlearningbot
Mobile application and Conversational bot using Amazon Lex

BetterLearning is a mobile application and a conversational bot using Amazon Lex. This application is developed for iOS devices (i.e. the iPad and iPhone). This application is targeted towards 5 to 8 years old kids, and enables kids to go through a simple voice-based conversational interface to interact with the application and take assessment tests to detect speech and language related disabilities.

See the blog [add link] for further information about the BetterLearning application and bot.

See http://docs.aws.amazon.com/lex/latest/dg/what-is.html for more information on Amazon Lex.

This repository contains the Objective-C code for iOS application that uses the BetterLearning bot. To setup and build this application, follow these steps:

1. Create a new iOS application project using xCode. Import the .h and .m files from /BetterLearning directory in this repo.

2. Get started with AWS SDK for iOS by following steps here: http://docs.aws.amazon.com/mobile/sdkforios/developerguide/getting-started-ios.html

3. Setup Amazon Lex for iOS application using the steps here: http://docs.aws.amazon.com/mobile/sdkforios/developerguide/lex-natural-language-interface-for-ios.html. You'll need to integrate the SDK for iOS into your app, set the appropriate permissions, and import the necessary libraries.

4. Setup Amazon DynamoDB to store the results of assessment tests. Follow the steps here: http://docs.aws.amazon.com/mobile/sdkforios/developerguide/dynamodb-nosql-database-for-ios.html


This repository also contains the code under /lambda directory for AWS Lambda function that does validation and fulfillment of WelcomeiUserIntent. 
WelcomeUserIntent uses a Lambda function called BetterLearningProcessor (written in node.js) both as initialization and validation hook, and for fulfillment of this intent. See the validate function that checks for whether user responding to this intent is between 5 to 8 years old, and can speak English; the only language supported by this conversational bot as of now. 


