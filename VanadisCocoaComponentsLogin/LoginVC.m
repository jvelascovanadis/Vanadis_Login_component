//
//  LoginVC.m
//  NearGay
//
//  Created by jorge Velasco on 03/08/14.
//  Copyright (c) 2014 Vanadis. All rights reserved.
//

#import "LoginVC.h"
//#import "User.h"

#define UNAUTHORIZED_DESCRIPTION @"Request failed: unauthorized (401)"
#define UNAUTHORIZED_DESCRIPTION_ES @"Request failed: sin autorización (401)"

@interface LoginVC ()
{
    BOOL isChecked;
    BOOL isViewMovedUp;
   // User * myInfo;
}

@end

@implementation LoginVC

@synthesize TF_mail,TF_password,activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //   self.menu =[[SlideMenuController alloc]initWithType:VanadisSlideMenuType_LAUNCH_MANUALLY];
    
     [self.navigationItem setRightBarButtonItems:[self createNavRightBarButtons] animated:YES];
    //self.menu =[[SlideMenuController alloc]initWithType:VanadisSlideMenuType_LAUNCH_ON_START];

    /* Opciones de teclado */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillAppear)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillDisappear)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWasResumed) name:UIApplicationWillEnterForegroundNotification object:nil];
    /*User *userInfo = (User *)[VanadisDataFileManager getDataFromDocumentsFolder:kUserCredentialsSaved];
    if(userInfo!=NULL)
    {
        [self.menu loadSlideMenu];
    }
    else
    {*/
//        NSDictionary *loginInfo = [VanadisDataFileManager getDictionaryFromDocumentsFolder:[VanadisDataFileManager getDocsFolderPath:kLoginCredentialsSaved]];
//        
//        if(loginInfo != nil)
//        {
//            email = [loginInfo objectForKey:@"email"];
//            self.TF_mail.text = email;
//            password = [loginInfo objectForKey:@"password"];
//            self.TF_password.text = password;
//        }
    //}
    
    
   //1.- Try to retrieve 
//  User * userLogged = [User returnUserLogged];
//    
//    if (userLogged != nil)
//    {
//        self.TF_mail.text = userLogged.user_email;
//        self.TF_password.text = userLogged.user_password;
//        
//        email = self.TF_mail.text;
//        password = self.TF_password.text;
//        
//        [self login];
//        
//    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  //  [self.navigationController setNavigationBarHidden:TRUE];
}

- (void)didReceiveMemoryWarning
{
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

- (IBAction)goLogin:(id)sender
{
  //  [self.menu loadSlideMenu];
    
    if([self checkLoginFields])
    {
      [self login];
    }
}

- (void)login
{
//    
//    NSURLSessionTask *task = [User post_login:email psw:password completion:^(User *infoLogin, NSError *error) {
//        
//        if (!error)
//        {
//            //1.- Search the user in the dataBase to know if we have it on the database
//            User *myInfo =  [User findUser:infoLogin.user_email];
//            
//            
//            if (myInfo == nil)
//            {
//                // First delete other users isLogged field
//                User * userLastLogged = [User returnUserLogged];
//                [userLastLogged updateWithInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:0] forKey:USER_IS_LOGGED_FIELD]];
//
//                //2.- The user is new, save in database
//                [infoLogin save];
//                //2.1 Update 
//                
//            }else
//            {
//                //3. User already created on database. Just update isLogged fieldç
//                User * userLastLogged = [User returnUserLogged];
//                [userLastLogged updateWithInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:0] forKey:USER_IS_LOGGED_FIELD]];
//                
//                [myInfo updateWithInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:1] forKey:USER_IS_LOGGED_FIELD]];
//            }
//            
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            
//            if ([defaults boolForKey:@"alreadyLaunched"] == FALSE){
//                
//                UINavigationController *theInitialViewController = (UINavigationController *)[[UIStoryboard storyboardWithName:@"Tutorial" bundle:nil] instantiateInitialViewController];
//
//                TutorialVC * tutoVC = [[theInitialViewController viewControllers]objectAtIndex:0];
//                tutoVC.delegate = self;
//                [tutoVC setTypeTutorial:TutorialTypeIntro];
//                
//                [self presentViewController:theInitialViewController animated:YES completion:^{
//                    
//                    [defaults setBool:TRUE forKey:@"alreadyLaunched"];
//                    [defaults synchronize];
//                    
//                    
//                }];
//                
//            }else
//            {
//                [self.menu loadSlideMenu];
//            }
//            
//
//            
//        }else
//        {
//            
//            if ([[error.userInfo objectForKey:@"NSLocalizedDescription"]isEqualToString:UNAUTHORIZED_DESCRIPTION] || [[error.userInfo objectForKey:@"NSLocalizedDescription"]isEqualToString:UNAUTHORIZED_DESCRIPTION_ES])
//            {
//                UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"LOGIN_ERROR",nil)
//                                                             message:[NSString stringWithFormat:NSLocalizedString(@"INFO_LOGIN_ERROR",nil)] delegate:nil
//                                                   cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
//                
//                [av show];
//            }
//            else
//            {
//
//            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil, nil];
//            
//            [alert show];
//            }
//
//        }
//        
//    }];
//
//    UIActivityIndicatorView *act = [self getUIActivityViewInNavigationBar];
//    if (act!=nil)
//    {
//        [act setAnimatingWithStateOfTask:task];
//    }
//
}

//- (void)login {
//    NSURLSessionTask *task = [User post_login:email psw:password completion:^(User *infoLogin, NSError *error) {
//        
//        if (!error) {
//            // Load the SlideMenu
//            [self saveLoginInfoToDisk];
//            [self.menu loadSlideMenu];
//        }
//        else
//        {
//            if (error.code  != NSURLErrorNotConnectedToInternet){
//                //self.activityIndicator.hidden = YES;
//                UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"LOGIN_ERROR",nil)
//                                                             message:[NSString stringWithFormat:NSLocalizedString(@"INFO_LOGIN_ERROR",nil)] delegate:nil
//                                                   cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
//                
//                [av show];
//            }
//        }
//    }];
//    
//    [activityIndicator setAnimatingWithStateOfTask:task];
//}


-(BOOL)checkLoginFields
{
    email = TF_mail.text;
    password = TF_password.text;
    if ((email == nil)||(password == nil)||([email isEqualToString:@""])||([password isEqualToString:@""]))
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"LOGIN_INFO",nil)
                                                     message:[NSString stringWithFormat:NSLocalizedString(@"INFO_LOGIN_EMPTY",nil)] delegate:nil
                                           cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
        [av show];
        
    }else{
        if(![self validateEmail:email])
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"LOGIN_INFO",nil)
                                                         message:[NSString stringWithFormat:NSLocalizedString(@"EMAIL_REGISTER_ERROR",nil)] delegate:nil
                                               cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
            [av show];
        }
        else if(password.length<8)
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"LOGIN_INFO",nil)
                                                         message:[NSString stringWithFormat:NSLocalizedString(@"PASSWORD_LENGTH_REGISTER_ERROR",nil)] delegate:nil
                                               cancelButtonTitle:NSLocalizedString(@"RESPONSE_OK",nil) otherButtonTitles:nil];
            [av show];
        }
        else
        {
            return TRUE;
        }
    }
    return FALSE;
}

- (IBAction)goRememberPassword:(id)sender {
    
    [self performSegueWithIdentifier:@"goRememberPassword" sender:nil];
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

#pragma mark - Save login info into disk
//-(void) saveLoginInfoToDisk
//{
//    [VanadisDataFileManager saveDictionaryDataToDocumentsFolder:[NSArray arrayWithObjects:email,password, nil] keysArray:[NSArray arrayWithObjects:@"email",@"password", nil] filename:kLoginCredentialsSaved];
//}

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


#pragma mark - TutorialVCDelegate
- (void)TutorialVCDidClose
{
  //  [self.menu loadSlideMenu];
   // [self.menu shouldDisplayInitiallyLateralMenu];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  [self.navigationController setNavigationBarHidden:FALSE];
}

@end
