//
//  BSDMapper.m
//  Test
//
//  Created by Simone Fantini on 03/03/15.
//  Copyright (c) 2015 BSDSoftware. All rights reserved.
//

#import "BSDMapper.h"
#import <objc/runtime.h>

@implementation BSDMapper

- (id)mapFrom:(id)source toClass:(__unsafe_unretained Class)destClass {
	if (!source)
		return nil;
	
	id dest = [[destClass alloc] init];
	unsigned int count;
	objc_property_t *properties = class_copyPropertyList(destClass, &count);
	for (int i = 0; i < count; i++) {
		objc_property_t *currentProp = properties + i;
		NSString *propName = [NSString stringWithUTF8String:property_getName(*currentProp)];
		id srcVal = [source valueForKey:propName];
		if ([srcVal respondsToSelector:@selector(copy)]) {
			srcVal = [srcVal copy];
		}
		[dest setValue:srcVal forKey:propName];
	}
	free(properties);
	return dest;
}

@end