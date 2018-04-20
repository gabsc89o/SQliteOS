//
//  AppDelegate.m
//  SQliteOS
//
//  Created by user138066 on 4/20/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //vamos a mirar si el fichero existe en la carpeta de usuario, sin existe nada caso contrario lo copiamos
    NSArray *pathq = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //recuperamos el nombre de la ruta
    NSString *directorio = [pathq objectAtIndex:0];
    //montamos el nombre completo de la ruta pathq + fichero
    NSString *pathBDModificable = [directorio stringByAppendingPathComponent:@"bbdd.sqlite"];
    //comprobar si el fichero esta o no
    BOOL ok = [[NSFileManager defaultManager]fileExistsAtPath:pathBDModificable];
    if (ok)
        return YES;
    
    NSString *pathBDBundle = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"bbdd.sqlite"];
    NSError *error;
    ok = [[NSFileManager defaultManager]copyItemAtPath:pathBDBundle toPath:pathBDModificable error:&error];
    if (ok) {
        NSAssert1(0, @"Error al copiar la BD", [error localizedDescription]);
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
