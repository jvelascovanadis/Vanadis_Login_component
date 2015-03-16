//
//  RegisterVC.h
//  NearGay
//
//  Created by Javier Galan on 15/10/14.
//  Copyright (c) 2014 Vanadis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIActivityIndicatorView+AFNetworking.h"
#import "UIAlertView+AFNetworking.h"
#import "User.h"

#define OFFSET_KEYBOARD 135.0
#define Appearence_speed_keyBoard 0.75f

@interface RegisterVC : UIViewController<UITextFieldDelegate>
{
    BOOL isChecked;
    NSString *login;
    NSString *password;
    NSString *repeat_password;
    
}
@property (strong, nonatomic) IBOutlet UIButton *checkButton;
@property (strong, nonatomic) IBOutlet UITextField *TF_repeat_password;
@property (strong, nonatomic) IBOutlet UITextField *TF_password;
@property (strong, nonatomic) IBOutlet UITextField *TF_mail;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIView *loadingView;


- (IBAction)checkConditionsButton:(id)sender;
- (IBAction)registerButton:(id)sender;
- (BOOL) validateEmail:(NSString *)checkString;
- (BOOL) checkRegisterFields;
- (void)keyboardWillAppear;
- (void)keyboardWillDisappear;
@end
