//
//  ViewController.m
//  Spray
//
//  Created by luoxian on 16/4/24.
//  Copyright © 2016年 luoxian. All rights reserved.
//

#import "ViewController.h"
#define URL @"http://192.168.1.101/api/demo.php"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@end

@implementation ViewController
@synthesize username,password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)login:(id)sender {
    //表单提交前的验证
    if (username.text == nil||password.text==nil ) {
        [tools MsgBox:@"用户名或密码不能为空！"];
        return;
    }
    //隐藏键盘
    [username resignFirstResponder];
    [password resignFirstResponder];
    
    [tools showHUD:@"正在登陆...."];
    NSString *urlstr = URL;
    NSURL *myurl = [NSURL URLWithString:urlstr];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:myurl];
    //设置表单提交项
    [request setPostValue:username.text forKey:@"username"];
    [request setPostValue:username.text forKey:@"password"];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(GetResult:)];
    [request setDidFailSelector:@selector(GetErr:)];
    [request startAsynchronous];

}
- (void)GetResult:(ASIHTTPRequest *)request{
    //接收字符串数据
    NSString *str = [request responseString];
    NSLog(@"%@",str);
    
    //接收二进制数据åß
    //NSData *data = [request responseData];
    
}

//连接错误调用这个函数
- (void) GetErr:(ASIHTTPRequest *)request{
    
    [tools removeHUD];
    
    [tools MsgBox:@"网络错误,连接不到服务器"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
