//
//  main.m
//  debug-objc
//
//  Created by Jason on 03/05/2017.
//
//

// -fno-objc-arc

#import <Foundation/Foundation.h>

@interface WeakProperty : NSObject

@property (nonatomic,weak) NSObject *obj;
@property (nonatomic,weak) NSObject *obj2;
@property (nonatomic,weak) NSObject *obj3;
@property (nonatomic,weak) NSObject *obj4;
@property (nonatomic,weak) NSObject *obj5;

@property (nonatomic,weak) id obj6;
@end

@implementation WeakProperty

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WeakProperty *property = [[WeakProperty alloc] init];
        NSObject *obj = [[NSObject alloc] init];
        property.obj = obj;
        
        NSLog(@"%lu",sizeof(uintptr_t));
        NSLog(@"%@",property.obj);
        
        // [1]
        property.obj2 = obj;
        
        // [2]
        property.obj3 = obj;
        property.obj4 = obj;
        property.obj5 = obj;
        
        // [3]
        // property.obj = nil;
    }
    return 0;
}

