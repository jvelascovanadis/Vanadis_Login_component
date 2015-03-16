//
//  TermsVC.m
//  Bizzibility
//
//  Created by jorge Velasco on 16/09/14.
//  Copyright (c) 2014 Vanadis. All rights reserved.
//

#import "TermsVC.h"
#import "SlideMenuController.h"


@interface TermsVC ()

@end

@implementation TermsVC

@synthesize delegate;

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
    [self configureNavBar];
    
    // IMPORTANT: Need to positioning the view!!
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setLegalTermsInTextView];
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configureNavBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(termsDidAccepted)];
    
}

#pragma mark -
#pragma mark Bar Button Actions
- (void) termsDidAccepted
{
    //[self.delegate termsDidAccepted];
    [self dismissViewControllerAnimated:YES completion:nil];
  
}

- (void) termsDidCancelled
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"register_warning_title", nil)
                                                 message:[NSString stringWithFormat:NSLocalizedString(@"register_warning_content", nil)]
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    av.delegate=self;
    [av show];
    
    //[self.delegate termsDidCancelled];
   // [self dismissViewControllerAnimated:YES completion:nil];
 

}


#pragma mark -
#pragma mark UIAlertView Delegate
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        NSLog(@"ok");
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        NSLog(@"cancel");
       // [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark -
#pragma mark Helpers
-(void)setLegalTermsInTextView
{
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:NSLocalizedString(@"legal_resource", nil) ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    self.legalTermsTextView.attributedText =[NSMutableAttributedString vanadisHTMLAttributtedString:htmlString color:[UIColor ocrWalletGrayMediumAColor] size:12.0f];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
