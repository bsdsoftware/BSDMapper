//
//  PreferitoBase.h
//  Test
//
//  Created by Simone Fantini on 03/03/15.
//  Copyright (c) 2015 BSDSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreferitoBase : NSObject

@property (nonatomic, assign) int idPreferito;

@property (nonatomic, strong) NSString* descrizione;

@property (nonatomic, strong) NSString* nome;

@property (nonatomic, strong) NSNumber* temperaturaCelsius;

@end
