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

-(BOOL)insertRecord: (ClasePrueba *)prueba
              error:(NSError **)error{
    sqlite3 *bbdd = [[SqliteLoad init] bbdd];
    NSString *txt = @"insert into CLASEPRUEBA (NOMBRE, PAIS) values (?,?)";
    if (_queryInsert == nil) {
        sqlite3_prepare_v2(bbdd, [txt UTF8String], -1, &_queryInsert, nil);
    }
    sqlite3_bind_text(_queryInsert, 1, [[prueba nombre] UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_queryInsert, 2, [[prueba pais] UTF8String], -1, SQLITE_TRANSIENT);
    
}

@end
