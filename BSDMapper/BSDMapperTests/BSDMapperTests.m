//
//  BSDMapperTests.m
//  BSDMapperTests
//
//  Created by Simone Fantini on 03/03/15.
//  Copyright (c) 2015 BSDSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BSDMapper.h"
#import "Preferito.h"
#import "Nazione.h"
#import "PreferitoDTO.h"

@interface TestTests : XCTestCase

@end

@implementation TestTests

- (void)setUp {
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testExample {
	Preferito *p = [TestTests preferitoTest];
	BSDMapper *mapper = [BSDMapper new];
	PreferitoDTO *dto = [mapper mapFrom:p toClass:[PreferitoDTO class]];
	XCTAssertEqual(dto.idPreferito, p.idPreferito);
	XCTAssertTrue([dto.descrizione isEqualToString:p.descrizione]);
	XCTAssertTrue([dto.nome isEqualToString:p.nome]);
	XCTAssertTrue([dto.temperaturaCelsius isEqualToNumber:p.temperaturaCelsius]);
}

+ (Preferito *)preferitoTest {
	Preferito *src = [Preferito new];
	src.idPreferito = 1;
	src.descrizione = @"Cielo sereno";
	src.nome = @"Cesena";
	src.temperaturaCelsius = @22;
	Nazione *n = [Nazione new];
	n.idNazione = 43;
	n.nome = @"Italia";
	src.nazione = n;
	return src;
}

- (void)testAutomaticMappingPerformance {
	Preferito *p = [TestTests preferitoTest];
	// This is an example of a performance test case.
	[self measureBlock:^{
		BSDMapper *mapper = [BSDMapper new];
		PreferitoDTO *dto = [mapper mapFrom:p toClass:[PreferitoDTO class]];
	}];
}

- (void)testManualMappingPerformance {
	Preferito *p = [TestTests preferitoTest];
	// This is an example of a performance test case.
	[self measureBlock:^{
		PreferitoDTO *dto = [PreferitoDTO new];
		dto.idPreferito = p.idPreferito;
		dto.descrizione = [p.description copy];
		dto.nome = [p.nome copy];
		dto.temperaturaCelsius = [p.temperaturaCelsius copy];
	}];
}

@end