//
//  Preferito.h
//  Test
//
//  Created by Simone Fantini on 03/03/15.
//  Copyright (c) 2015 BSDSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nazione.h"
#import "PreferitoBase.h"

@interface Preferito : PreferitoBase

@property (nonatomic, strong) Nazione *nazione;

@end
