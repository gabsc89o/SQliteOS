//
//  TestDAO.m
//  SQliteOS
//
//  Created by user138066 on 4/20/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import "TestDAO.h"
#import "ClasePrueba.h"
#import "SqliteLoad.h"

@implementation TestDAO
-(ClasePrueba *)recuperarRecord{
    SqliteLoad *sql = [[SqliteLoad alloc] init];
    sqlite3 *bbdd = [sql bbdd];
    NSString *txt = @"select * from CLASEPRUEBA WHERE id=?";
    // Preparamos la consulta
    if (_queryInsert == nil ){
        sqlite3_prepare_v2(bbdd, [txt UTF8String], -1, &_queryInsert, nil);
    }
    // Una vez preparada la consulta tenemos que sustituir los interrogantes por los valores que tocan
    // Primer interrogante
    sqlite3_bind_int64(_queryInsert, 1, 1);
    ClasePrueba *rec = nil;
    if (sqlite3_step(_queryInsert) == SQLITE_ROW){
        NSString *nombre = [NSString stringWithUTF8String:(const char*) sqlite3_column_text(_queryInsert, 1)];
        NSString *pais = [NSString stringWithUTF8String:(const char*) sqlite3_column_text(_queryInsert, 2)];
        rec = [[ClasePrueba alloc] initConNombre:nombre pais:pais];
        sqlite3_reset(_queryInsert);
    }
    return rec;
}

-(BOOL)insertRecord: (ClasePrueba *)prueba
              error:(NSError **)error{
    SqliteLoad *sql = [[SqliteLoad alloc] init];
    sqlite3 *bbdd = [sql bbdd];
    NSString *txt = @"insert into CLASEPRUEBA (NOMBRE, PAIS) values (?,?)";
    if (_queryInsert == nil) {
        sqlite3_prepare_v2(bbdd, [txt UTF8String], -1, &_queryInsert, nil);
    }
    sqlite3_bind_text(_queryInsert, 1, [[prueba nombre] UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_queryInsert, 2, [[prueba pais] UTF8String], -1, SQLITE_TRANSIENT);
    int codigo = sqlite3_step(_queryInsert);
    NSLog(@"Datos: %@, %@",[prueba nombre],[prueba pais]);
    NSLog(@"Datos: %d",codigo);
    sqlite3_reset(_queryInsert);

    return YES;
}

-(NSArray *)listarPruebas:(NSError **)error{
    SqliteLoad *ssql = [[SqliteLoad alloc]init];
    sqlite3 *bbdd = [ssql bbdd];
    NSString *txt = @"SELECT * FROM CLASEPRUEBA";
    if (_queryInsert == nil) {
        sqlite3_prepare_v2(bbdd, [txt UTF8String], -1, &_queryInsert, nil);
    }
    NSMutableArray *allPruebas = [[NSMutableArray alloc]init];
    while (sqlite3_step(_queryInsert)==SQLITE_ROW) {
        ClasePrueba *cp = nil;
        NSString *nombre = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_queryInsert, 1)];
        NSString *pais = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_queryInsert, 2)];
        cp=[[ClasePrueba alloc]initConId:sqlite3_column_int64(_queryInsert, 0) nombre:nombre pais:pais];
        [allPruebas addObject:cp];
    }
    sqlite3_reset(_queryInsert);
    return allPruebas;
}

@end
