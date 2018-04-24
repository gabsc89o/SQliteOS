//
//  ViewController.h
//  SQliteOS
//
//  Created by user138066 on 4/20/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tablaDS.h"

@interface ViewController : UIViewController

{
    tablaDS *_tablaDS;
    
}

@property IBOutlet UITextField *tnombre;
@property IBOutlet UITextField *tpais;
@property IBOutlet UITableView *tablePruebas;


@end

