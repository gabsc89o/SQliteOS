//
//  ViewController.m
//  SQliteOS
//
//  Created by user138066 on 4/20/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import "ViewController.h"
#import "ClasePrueba.h"
#import "TestDAO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tablaDS = [[tablaDS alloc]init];
    [_tablePruebas setDataSource:_tablaDS];
}

-(void)viewWillAppear:(BOOL)animated{
    TestDAO *td = [[TestDAO alloc]init];
     NSError *error;
    [_tablaDS setPruebas:[td listarPruebas :&error]];
    [_tablePruebas reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)guardarClick:(id)sender{
    [self insertarbd];
}

-(void) insertarbd{
    NSString *_nombre = [_tnombre text];
    NSString *_pais = [_tpais text];
    
    ClasePrueba *cp = [[ClasePrueba alloc]initConNombre:_nombre pais:_pais];
    NSError *error;
    TestDAO *td = [[TestDAO alloc]init];
    [td insertRecord:cp error:&error];
    [_tnombre setText:@""];
    [_tpais setText:@""];
}

-(IBAction)recuperarClick:(id)sender{
    NSError *error;
    TestDAO *td = [[TestDAO alloc]init];
    ClasePrueba *cp = [td recuperarRecord];
    [_tnombre setText:cp.nombre];
    [_tpais setText:cp.pais];
}

@end
