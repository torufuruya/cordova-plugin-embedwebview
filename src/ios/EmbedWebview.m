/********* EmbedWebview.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface EmbedWebview : CDVPlugin {
  // Member variables go here.
    UIWebView *webView;
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
@end
