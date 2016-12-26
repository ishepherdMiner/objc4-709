//
//  main.m
//  debug-objc
//
//  Created by Jason on 13/12/2016.
//
//

#import "objc-private.h"
#import <Foundation/Foundation.h>
#import "DataStructure.h"
void demo1();
void demo3();
void demo2();
void demo4();

static const void *assockey = "";
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DataStructure *d = [[DataStructure alloc] init];
        [d performSelector:@selector(haha)];
    }
    return 0;
}

void demo5() {
    Class cls = [DataStructure class];
    unsigned int count = 0;
    objc_property_attribute_t t1 = {"g1","val1"};
    objc_property_attribute_t t2 = {"g2","val2"};
    objc_property_attribute_t t[] = {t1,t2};
    class_addProperty(cls, "g", t, 2);
    objc_property_t *list2 = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; ++i) {
        objc_property_t ity = list2[i];
        const char *iname = property_getName(ity);
        NSLog(@"%@\n",[NSString stringWithUTF8String:iname]);
    }
    free(list2);
}

void demo4() {
    Class cls = [NSObject class];
    unsigned int count = 0;
    Ivar *list = class_copyIvarList(cls, &count);
    for (unsigned int i = 0; i < count; ++i) {
        Ivar ity = list[i];
        const char *iname = ivar_getName(ity);
        NSLog(@"%@\n",[NSString stringWithUTF8String:iname]);
    }
    free(list);

    objc_property_t *list2 = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; ++i) {
        objc_property_t ity = list2[i];
        const char *iname = property_getName(ity);
        NSLog(@"%@\n",[NSString stringWithUTF8String:iname]);
    }
    free(list2);

    Method *methods = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methods[i];
         printf("\t'%s'|'%s' of encoding '%s'\n",
         class_getName(cls),
         sel_getName(method_getName(method)),
         method_getTypeEncoding(method));

    }
    free(methods);

    Protocol * __unsafe_unretained * protocols = class_copyProtocolList(cls, &count);
    Protocol * protocol;
    for (unsigned int i = 0; i < count; i++) {
        protocol = protocols[i];
        NSLog(@"protocol name: %s", protocol_getName(protocol));
    }
}

void demo3() {
    objc_class *cls_a = (objc_class *)[NSArray class]->getMeta();
    
    while (true) {
        NSLog(@"...");
        NSArray *abc = [NSArray arrayWithObjects:@"abc", nil];
        sleep(1);
    }
}

void demo1() {
    objc_class *cls_a = (objc_class *)[NSObject class];
    objc_class *cls_b = (objc_class *)cls_a->getMeta();
    NSLog(@"%p,%p",cls_a,cls_b);
    objc_class *cls_a_s = (objc_class *)[NSString class];
    objc_class *cls_b_s = (objc_class *)cls_a_s->getMeta();
    NSLog(@"%p,%p",cls_a_s,cls_b_s);
    
//    NSObject *cls_a = [NSObject class];
//    objc_class *cls_a = (objc_class *)[NSObject class];
//    objc_class *cls_b = (objc_class *)cls_a->getMeta();
//    NSLog(@"%p,%p",cls_a,cls_b);
}

void demo2() {
    NSLog(@"NSString类的super_class是%@",class_getSuperclass([NSObject class]));
    NSLog(@"NSString类的version是%d",class_getVersion([NSObject class]));
    NSLog(@"NSString类的name是%s",class_getName([NSObject class]));
    NSLog(@"NSString类的instance_size是%ld",class_getInstanceSize([NSObject class]));
}
