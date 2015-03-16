//
//  TermsVC.h
//  Bizzibility
//
//  Created by jorge Velasco on 16/09/14.
//  Copyright (c) 2014 Vanadis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VanadisFrameworkSlideMenu/SlideMenuControl.h>
#import "SlideMenuController.h"

@protocol TermsVCDelegate <NSObject>
- (void)termsDidAccepted;
- (void)termsDidCancelled;
@end

@interface TermsVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *legalTermsTextView;

@property (strong, nonatomic) SlideMenuController *menu;
//For a delegate, use assign. That way, you’ll avoid a “retain cycle”. (A retain cycle is bad.)
@property(nonatomic, assign) id<TermsVCDelegate> delegate;

@end
