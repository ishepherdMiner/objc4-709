//
//  DataStructure.m
//  objc
//
//  Created by Jason on 25/12/2016.
//
//

#import "DataStructure.h"
#import "NewTarget.h"
@implementation DataStructure

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    return [[NewTarget alloc] init];
}
@end
