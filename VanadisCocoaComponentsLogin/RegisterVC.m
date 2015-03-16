//
//  RegisterVC.m
//  NearGay
//
//  Created by Javier Galan on 15/10/14.
//  Copyright (c) 2014 Vanadis. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()
{
    BOOL isViewMovedUp;
}

@end

@implementation RegisterVC
@synthesize checkButton,TF_mail,TF_password,TF_repeat_password,activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // [self.navigationController setNavigationBarHidden:FALSE];
    [self.navigationItem setRightBarButtonItems:[self createNavRightBarButtons] animated:YES];

    isChecked = FALSE;
    /* Opciones de teclado */
    // observe keyboard hide and show notifications to resize the text view appropriately
    // register keyboard notifications to appear / disappear the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillAppear)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillDisappear)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWasResumed) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *) createNavRightBarButtons
{
    
    NSMutableArray * arrayButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite]];
    [arrayButtons addObject:barButtonItem];
    
    return arrayButtons;
}


#pragma mark - Auxiliar methods

- (IBAction)checkConditionsButton:(id)sender {
    
    if (!isChecked ){
        isChecked = TRUE;
        [self.checkButton setImage:[UIImage imageNamed:@"Checkbox_1"] forState:UIControlStateNormal];
    }else{
        isChecked = FALSE;
        [self.checkButton setImage:[UIImage imageNamed:@"Checkbox_0"] forState:UIControlStateNormal];
    }
}

- (IBAction)registerButton:(id)sender
{
//    if([self checkRegisterFields])
//    {
//        _loadingView.hidden = NO;
//   
//          NSURLSessionTask *task = [User post_register:login psw:password repeatPsw:repeat_password completion:^(User *infoRegister, NSError * error) {
//            if (!error) {
//                    self.TF_mail.text = @"";
//                    self.TF_password.text = @"";
//                    self.TF_repeat_password.text = @"";
//                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
//                                    message:[NSString stringWithFormat:NSLocalizedString(@"REGISTER_SUCCESS",nil)] delegate:nil
//                                    cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
//                    [av show];
//                
//                    [self.navigationController popViewControllerAnimated:TRUE];
//            } else{
////                if ([[error.userInfo objectForKey:@"NSLocalizedDescription"]isEqualToString:BAD_REQUEST_DESCRIPTION] || [[error.userInfo objectForKey:@"NSLocalizedDescription"]isEqualToString:BAD_REQUEST_DESCRIPTION_ES])
////                {
////                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
////                                message:[NSString stringWithFormat:NSLocalizedString(@"DUPLICATE_EMAILS",nil)] delegate:nil
////                                cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
////                                    
////                    [av show];
////                }
////                else
////                {
////             
////            
////                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
////                                message:[NSString stringWithFormat:NSLocalizedString(@"REGISTER_ERROR",nil)] delegate:nil
////                                cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
////                                    [av show];
////                }
//            }
//        
//              _loadingView.hidden = YES;
//        }];
//    //    [activityIndicator setAnimatingWithStateOfTask:task];
//        UIActivityIndicatorView *act = [self getUIActivityViewInNavigationBar];
//        if (act!=nil)
//        {
//            [act setAnimatingWithStateOfTask:task];
//        }
//
//    }
}

- (BOOL) checkRegisterFields
{
    if (!isChecked ){
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
                                                     message:[NSString stringWithFormat:NSLocalizedString(@"CONDITIONS_REGISTER_ERROR",nil)] delegate:nil
                                           cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
        [av show];
    }
    else
    {
        login = TF_mail.text;
        password = TF_password.text;
        repeat_password = TF_repeat_password.text;
        if ((login == nil)||(password == nil)||(repeat_password == nil)||([login isEqualToString:@""])||([password isEqualToString:@""])||([repeat_password isEqualToString:@""]))
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
                                                         message:[NSString stringWithFormat:NSLocalizedString(@"EMPTY_FIELDS_REGISTER_ERROR",nil)] delegate:nil
                                               cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
            [av show];
            
        }else{
            if(![self validateEmail:login])
            {
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
                                                             message:[NSString stringWithFormat:NSLocalizedString(@"EMAIL_REGISTER_ERROR",nil)] delegate:nil
                                                   cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
                [av show];
            }
            else if(password.length<8)
            {
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
                                                             message:[NSString stringWithFormat:NSLocalizedString(@"PASSWORD_LENGTH_REGISTER_ERROR",nil)] delegate:nil
                                                   cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
                [av show];
            }
            else
            {
                if(![password isEqualToString:repeat_password])
                {
                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"REGISTER_INFO",nil)
                                                                 message:[NSString stringWithFormat:NSLocalizedString(@"PASSWORD_REPEAT_REGISTER_ERROR",nil)] delegate:nil
                                                       cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
                    [av show];
                }
                else
                {
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}

- (BOOL) validateEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark - Metodos delegados UITextFieldDelegate
- (void) animateTextField: (BOOL) up
{
    int movement = (up ? -OFFSET_KEYBOARD : OFFSET_KEYBOARD);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: Appearence_speed_keyBoard];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [TF_mail resignFirstResponder];
    [TF_password resignFirstResponder];
    [TF_repeat_password resignFirstResponder];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)keyboardWillAppear {
    // Move current view up / down with Animation
    if (!isViewMovedUp)
    {
        [self animateTextField: YES];
        isViewMovedUp = YES;
    }
    
}

-(void)keyboardWillDisappear {
    
    [self animateTextField: NO];
    isViewMovedUp = NO;
    
}

-(void) appWasResumed
{
    [TF_mail resignFirstResponder];
    [TF_password resignFirstResponder];
    [TF_repeat_password resignFirstResponder];
}

@end
