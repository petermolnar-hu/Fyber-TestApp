//
//  PMODataDownloaderTest.m
//  Parallels-test
//
//  Created by Peter Molnar on 09/05/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMODataDownloader.h"

@interface PMODataDownloaderTest : XCTestCase
@property (strong, nonatomic) PMODataDownloader *downloader;
@end

@implementation PMODataDownloaderTest

- (void)setUp {
    [super setUp];
    self.downloader =[[PMODataDownloader alloc] init];
    
}

-(void)tearDown {
    [super tearDown];
    _downloader = nil;
}


#pragma mark - Tests
- (void)testDownloadCompleted {
    // Needs internet connection
    [self.downloader downloadDataFromURL:[NSURL URLWithString:@"http://sample-file.bazadanni.com/download/txt/json/sample.json"]];
    XCTestExpectation *expectation = [self expectationForNotification:PMODataDownloaderDidDownloadEnded
                                                               object:self.downloader
                                                              handler:^BOOL(NSNotification * _Nonnull notification) {
                                                                  NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:[notification.userInfo objectForKey:@"data"]
                                                              options:0
                                                                                                                         error:nil];
                                                                  if (jsonArray &&[jsonArray count] >= 1) {
                                                                      [expectation fulfill];
                                                                      return true;
                                                                      
                                                                  } else {
                                                                      return false;
                                                                  }
                                                              }];

    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testDownloadFailure {
    [self.downloader downloadDataFromURL:[NSURL URLWithString:@"http://fdafdsafdsa.ji/tems.json"]];
    XCTestExpectation *expectation = [self expectationForNotification:PMODataDownloaderError
                                                               object:self.downloader
                                                              handler:^BOOL(NSNotification * _Nonnull notification) {
                                                                  NSError *error = [notification.userInfo objectForKey:@"error"];
                                                                  if (error && [error localizedDescription]) {
                                                                      [expectation fulfill];
                                                                      return true;
                                                                      
                                                                  } else {
                                                                      return false;
                                                                  }
                                                              }];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}


@end
