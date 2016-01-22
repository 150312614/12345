//
//  CZHTMLController.m
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZHTMLController.h"
#import "CZHelp.h"
@interface CZHTMLController ()<UIWebViewDelegate>

@end

@implementation CZHTMLController

- (void)loadView {
    self.view = [[UIWebView alloc]init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@",self.view);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    self.navigationItem.leftBarButtonItem = item;
    
    // javascript 脚本语言 解析型语言
    
    // 创建URL
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.help.html withExtension:nil];
//    NSURL *url = [NSURL URLWithString:@"https://www.taobao.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 使用webView加载
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    [webView loadRequest:request];
    
}

// webView 加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *code = [NSString stringWithFormat:@"document.location.href = '#%@';",self.help.ID];
    
    // 把代码拼到webView上面
    [webView stringByEvaluatingJavaScriptFromString:code];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
