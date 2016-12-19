//
//  main.m
//  debug-objc
//
//  Created by Jason on 13/12/2016.
//
//

#import "objc-private.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        objc_class *obj_1 = (objc_class *)[NSObject class];
        objc_class *obj_2 = (objc_class *)[NSString class];
        NSLog(@"%p,%p",obj_1,obj_2);
    }
    return 0;
}
