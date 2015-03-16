//
//  RememberPasswordVC.m
//  NearGay
//
//  Created by jorge Velasco on 09/01/15.
//  Copyright (c) 2015 Vanadis. All rights reserved.
//

#import "RememberPasswordVC.h"
#import "User.h"

@interface RememberPasswordVC ()

@end

@implementation RememberPasswordVC

@synthesize emailTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavBarButtons];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWasResumed) name:UIApplicationWillEnterForegroundNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavBarButtons
{
    //Ricght button
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"send_btn", nil)
                    style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(sendRememberPassword)];
    self.navigationItem.rightBarButtonItem = sendButton;
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelRememberPassword)];
    
    
}

- (void)sendRememberPassword
{
    [User post_remember_password:emailTextField.text completion:^(NSError *error) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
}

- (void) cancelRememberPassword
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Metodos delegados UITextFieldDelegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // Se pulsa return
    [textField resignFirstResponder];
    return YES;
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 20; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Gets the string AFTER typed
    NSString * newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([newString length]==0)
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    else
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [emailTextField resignFirstResponder];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [emailTextField resignFirstResponder];
}

-(void) appWasResumed
{
    [emailTextField resignFirstResponder];
    //If you are changing positions of items, you might want to do that here too.
}


@end
