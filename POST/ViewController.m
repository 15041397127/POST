//
//  ViewController.m
//  POST
//
//  Created by zhang xu on 15/12/8.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *user;

@property (weak, nonatomic) IBOutlet UITextField *passworld;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)login:(UIButton *)sender {
    
    NSString *us=@"http://127.0.0.1/p.php";
    NSURL *url=[NSURL URLWithString:us];
    
    NSMutableURLRequest *requset=[NSMutableURLRequest requestWithURL:url];
    
    requset.HTTPMethod=@"POST";
    requset.HTTPBody=[@"name=zhangxu&password=lxr" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithRequest:requset completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        id dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if ([dic[@"status"] isEqual:@0]) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:dic[@"message"] preferredStyle:UIAlertControllerStyleAlert];
            [self showViewController:alert sender:nil];
        }

    }];
      [task resume];
    
    NSLog(@"点击!");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
