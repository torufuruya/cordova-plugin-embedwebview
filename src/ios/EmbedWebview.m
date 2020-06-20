/********* EmbedWebview.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

#define SLIDE_TIME 0.12
@interface EmbedWebview : CDVPlugin {
  // Member variables go here.
    WKWebView *webView;
	WKWebView *webView_a;
}

- (void)open:(CDVInvokedUrlCommand*)command;
@end

@implementation EmbedWebview

- (void)open:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self showWebViewLoadURL:urlString];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
-(void)close:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self hideWebView];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)move_right:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self MoveToRight];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)move_left:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self MoveToLeft];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
-(void)showWebViewLoadURL:(NSString*)urlString{
    if (webView == nil){
        webView = [[WKWebView alloc] init];
        CGRect rect = self.viewController.view.frame;
        rect.origin.y = 108;
        rect.size.height = rect.size.height - 108;
        webView.backgroundColor = [UIColor whiteColor];
        webView.frame = rect;
//        webView.scalesPageToFit = YES;
        
//        webView.delegate = self.commandDelegate;
        
        [self.viewController.view addSubview:webView];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];    
    [webView loadRequest:request];
    webView.hidden = NO;
}
-(void)hideWebView{
    if (webView != nil){
        NSURL *url = [NSURL URLWithString:@""];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        webView.hidden = YES;
    }
}
-(void)MoveToRight{
    if (webView == nil) return;
    UIView *view = webView;
    CGRect originRect = webView.frame;
    CGRect movedRect = self.viewController.view.frame;
    movedRect.origin.x = 220;
    movedRect.origin.y = 108;
    movedRect.size.height = movedRect.size.height - 108;
    view.frame = originRect;
    [UIView animateWithDuration:SLIDE_TIME animations:^{
        view.frame = movedRect;
    }];
}
-(void)MoveToLeft{
    if (webView == nil) return;
    UIView *view = webView;
    CGRect originRect = webView.frame;
    CGRect movedRect = self.viewController.view.frame;
    movedRect.origin.x = 0;
    movedRect.origin.y = 108;
    movedRect.size.height = movedRect.size.height - 108;
    view.frame = originRect;
    [UIView animateWithDuration:SLIDE_TIME animations:^{
        view.frame = movedRect;
    }];

}

- (void)open_a:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self showWebViewLoadURL_a:urlString];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)close_a:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    [self hideWebView_a];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
-(void)showWebViewLoadURL_a:(NSString*)urlString{
    if (webView_a == nil){
        webView_a = [[WKWebView alloc] init];
        CGRect rect = self.viewController.view.frame;
        rect.origin.y = 64;
        rect.size.height = rect.size.height - 64;
        webView_a.frame = rect;
//        webView_a.scalesPageToFit = YES;
        
//        webView_a.delegate = self.commandDelegate;
        
        [self.viewController.view addSubview:webView_a];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];    
    [webView_a loadRequest:request];
    webView_a.hidden = NO;
}
-(void)hideWebView_a{
    if (webView_a != nil){
        NSURL *url = [NSURL URLWithString:@""];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView_a loadRequest:request];
        webView_a.hidden = YES;
    }
    
}
@end
