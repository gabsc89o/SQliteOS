//
//  tablaDS.h
//  SQliteOS
//
//  Created by user138066 on 4/24/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ClasePrueba.h"

@interface tablaDS : NSObject<UITableViewDataSource>

@property NSArray *pruebas;

-(ClasePrueba *)pruebaAt:(NSInteger)pos;


@end
