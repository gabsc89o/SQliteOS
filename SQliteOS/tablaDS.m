//
//  tablaDS.m
//  SQliteOS
//
//  Created by user138066 on 4/24/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import "tablaDS.h"

@implementation tablaDS



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *idCeldaPrueba = @"celdaPrueba";
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:idCeldaPrueba];
    if (celda == nil) {
        celda = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCeldaPrueba];
    }
    NSInteger fila = [indexPath row];
    ClasePrueba *cp = [_pruebas objectAtIndex:fila];
    NSString *str = [NSString stringWithFormat: @"%@ %@", cp.nombre,cp.pais];
    [[celda textLabel]setText:str];
    return celda;
}

-(ClasePrueba *)pruebaAt:(NSInteger)pos{
    return (ClasePrueba *)[_pruebas objectAtIndex:pos];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_pruebas count];
}

@end
