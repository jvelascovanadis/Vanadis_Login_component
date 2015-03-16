//
//  RememberPasswordVC.h
//  NearGay
//
//  Created by jorge Velasco on 09/01/15.
//  Copyright (c) 2015 Vanadis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RememberPasswordVC : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end
