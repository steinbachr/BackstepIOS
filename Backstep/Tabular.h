//
//  Tabular.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Tabular <NSObject>

- (UIImage *) rowPicture;
- (NSString *) rowTitle;
- (NSString *) rowSubtitle;

@end
