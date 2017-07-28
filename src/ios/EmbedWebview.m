/********* EmbedWebview.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface EmbedWebview : CDVPlugin {
  // Member variables go here.
    UIWebView *webView;
	UIWebView *webView_a;
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

-(void)showWebViewLoadURL:(NSString*)urlString{
    if (webView == nil){
        webView = [[UIWebView alloc] init];
        CGRect rect = self.viewController.view.frame;
        rect.origin.y = 108;
        rect.size.height = rect.size.height - 108;
        webView.frame = rect;
        webView.scalesPageToFit = YES;
        
        webView.delegate = self.commandDelegate;
        
        [self.viewController.view addSubview:webView];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];    
    [webView loadRequest:request];
    webView.hidden = NO;
}
-(void)hideWebView{
    if (webView != nil){
        webView.hidden = YES;
    }
    
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
        webView_a = [[UIWebView alloc] init];
        CGRect rect = self.viewController.view.frame;
        rect.origin.y = 64;
        rect.size.height = rect.size.height - 64;
        webView_a.frame = rect;
        webView_a.scalesPageToFit = YES;
        
        webView_a.delegate = self.commandDelegate;
        
        [self.viewController.view addSubview:webView_a];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];    
    [webView_a loadRequest:request];
    webView_a.hidden = NO;
}
-(void)hideWebView_a{
    if (webView_a != nil){
        webView_a.hidden = YES;
    }
    
}
@end
