//
//  MMZCHMViewController.m
//  MMR
//
//  Created by qianfeng on 15/6/30.
//  Copyright © 2015年 MaskMan. All rights reserved.
//

#import "RegisterViewController.h"
#import "SettingDoctorInfoViewController.h"
#import "LoginViewController.h"
#import "XMPPFramework.h"
#import "MBProgressHUD.h"
#import "FriendListViewController.h"

@interface RegisterViewController ()
{
    UIView *bgView;
    UITextField *username;
    UITextField *password;
    UINavigationBar *customNavigationBar;
    UIButton *yzButton;
}

@property(nonatomic, copy) NSString *oUserPhoneNum;
@property(assign, nonatomic) NSInteger timeCount;
@property(strong, nonatomic) NSTimer *timer;
//验证码
@property(copy, nonatomic) NSString *smsId;
@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
//    
   self.title=@"注册1/3";
    self.navigationController.navigationBarHidden = NO;
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
   self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
    
    
    [self createTextFields];
}

-(void)clickaddBtn
{
    [self.navigationController popViewControllerAnimated:YES];
  //  [self.navigationController pushViewController:[[SettingPatientInfoViewController alloc]init] animated:YES];
}

-(void)createTextFields
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"欢迎注册病人随访app";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    
    [self.view addSubview:label];

   
        CGRect frame=[UIScreen mainScreen].bounds;
        bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 100)];
        bgView.layer.cornerRadius=3.0;
        bgView.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:bgView];
        
        username=[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请输入您的用户名"];
        username.clearButtonMode = UITextFieldViewModeWhileEditing;
        username.autocapitalizationType =UITextAutocapitalizationTypeNone;
    
    
    
    
        //phone.text=@"15527002684";
        
        password=[self createTextFielfFrame:CGRectMake(100, 60, 200, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"请输入您的密码" ];
        password.clearButtonMode = UITextFieldViewModeWhileEditing;
        //code.text=@"mojun1992225";
        //密文样式
        password.secureTextEntry=YES;
        password.keyboardType=UIKeyboardTypeNumberPad;
        
        
    UILabel *usernamelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    usernamelabel.text=@"用户名";
    usernamelabel.textColor=[UIColor blackColor];
    usernamelabel.textAlignment=NSTextAlignmentLeft;
    usernamelabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *passwordlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 62, 50, 25)];
    passwordlabel.text=@"密  码";
    passwordlabel.textColor=[UIColor blackColor];
    passwordlabel.textAlignment=NSTextAlignmentLeft;
    passwordlabel.font=[UIFont systemFontOfSize:14];
    
    
//    yzButton=[[UIButton alloc]initWithFrame:CGRectMake(bgView.frame.size.width-100-20, 62, 100, 30)];
//    //yzButton.layer.cornerRadius=3.0f;
//    //yzButton.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
//    [yzButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//    [yzButton setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
//    yzButton.font=[UIFont systemFontOfSize:13];
//    [yzButton addTarget:self action:@selector(getValidCode:) forControlEvents:UIControlEventTouchUpInside];
//    [bgView addSubview:yzButton];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"下一步" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(next)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;

        
    [bgView addSubview:username];
    [bgView addSubview:password];
        
    [bgView addSubview:usernamelabel];
    [bgView addSubview:passwordlabel];
    [bgView addSubview:line1];
    [self.view addSubview:landBtn];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [username resignFirstResponder];
    
}

-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}

-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

//验证码
-(void)next
{
    
//    if ([phone.text isEqualToString:@""])
//    {
//        //[SVProgressHUD showInfoWithStatus:@"亲,请输入注册手机号码"];
//        return;
//    }
//    else if (phone.text.length <11)
//    {
//        ///[SVProgressHUD showInfoWithStatus:@"您输入的手机号码格式不正确"];
//        return;
//    }
//    else if ([code.text isEqualToString:@""])
//    {
//        //[SVProgressHUD showInfoWithStatus:@"亲,请输入验证码"];
//        return;
//    }
//    else if (self.smsId.length == 0)
//    {
//        //[SVProgressHUD showInfoWithStatus:@"验证码错误"];
//        return;
//   }
    
    NSString *userName = username.text ;
    NSString *passWord = password.text;
    
    
    NSUserDefaults *doctor =[NSUserDefaults standardUserDefaults];
    //个人信息
    [doctor setObject:username.text forKey:@"registerUsername"];
    [doctor setObject:username.text forKey:@"registerPassword"];
    
    NSLog(@"register-username:%@",userName);
    NSLog(@"register-passWord:%@",passWord);
    userName=[userName stringByAppendingString:@"@macbookair.local"];
    NSLog(@"注册时候的username是：%@",userName);
     [[DWXMPP_Core sharedManager] registerWithUserName:userName andPassWord:passWord];

   
    [self.navigationController pushViewController:[[SettingDoctorInfoViewController alloc]init] animated:YES];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_WILL_CONNECT object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_CONNECT_FAULT object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_AUTNENTICATE_SUCCEED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_AUTNENTICATE_FAULT object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_REGISTER_SUCCEED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_REGISTER_FAULT object:nil];
}

#pragma mark - Notification
- (void)registerNotification{
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRegister:) name:DWXMPP_NOTIFICATION_REGISTER_SUCCEED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotRegister:) name:DWXMPP_NOTIFICATION_REGISTER_FAULT object:nil];
}



#pragma mark - Register
- (void)didRegister:(NSNotification *)notification{
    NSString *strNotification = notification.name;
    
    if ([strNotification isEqualToString:DWXMPP_NOTIFICATION_REGISTER_SUCCEED]){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me"]];
        HUD.mode = MBProgressHUDModeCustomView;
        HUD.labelText = @"注册成功";
        HUD.removeFromSuperViewOnHide = YES;
        [self.view addSubview:HUD];
        [HUD show:YES];
        [HUD hide:YES afterDelay:1.0];
    }
}

- (void)didNotRegister:(NSNotification *)notification{
    NSString *strNotification = notification.name;
    
    if([strNotification isEqualToString:DWXMPP_NOTIFICATION_REGISTER_FAULT]){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        NSString *errorCode = [[[notification.object elementsForName:@"error"] firstObject] attributeStringValueForName:@"code"];
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.mode = MBProgressHUDModeText;
        HUD.detailsLabelText = [NSString stringWithFormat:@"注册失败 错误代码：%@", errorCode];
        HUD.removeFromSuperViewOnHide = YES;
        [self.view addSubview:HUD];
        [HUD show:YES];
        [HUD hide:YES afterDelay:2];
    }
}







@end
