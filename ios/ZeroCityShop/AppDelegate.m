/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * react-native bundle --entry-file index.ios.js --bundle-output ./ios/main.jsbundle --platform ios --assets-dest ./ios --dev false
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *Mac 终端删除当前项目中所有.svn文件
 打开终端，进入项目所在的文件夹：使用命令find . -type d -name ".svn" |xargs rm -rvf就可将项目的.svn全部删除；
 */

#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTDevLoadingView.h>
#import "SplashScreen.h"

#define AppSever  2

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  RCTRootView *rootView ;
#ifdef DEBUG
  
#if  AppSever==1  //localhost
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:[[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil]
                                            moduleProvider:nil
                                             launchOptions:launchOptions];
  
#elif AppSever==2  //localIP
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:[NSURL URLWithString:@"http://20.0.0.32:8081/index.ios.bundle?platform=ios&dev=true"]
                                            moduleProvider:nil
                                             launchOptions:launchOptions];
#endif

  [bridge moduleForClass:[RCTDevLoadingView class]];
  rootView = [[RCTRootView alloc] initWithBridge:bridge
                                      moduleName:@"ZeroCityShop"
                               initialProperties:nil];
  
#else

  rootView = [[RCTRootView alloc] initWithBundleURL:[[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"]
                                         moduleName:@"ZeroCityShop"
                                  initialProperties:nil
                                      launchOptions:launchOptions];
#endif
  

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  //[SplashScreen show];
  return YES;
}

@end
