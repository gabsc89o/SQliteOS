//
//  TestDAO.h
//  SQliteOS
//
//  Created by user138066 on 4/20/18.
//  Copyright © 2018 user138066. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface TestDAO : NSObject

{
@private
    sqlite3_stmt *_queryInsert;
}

@end
