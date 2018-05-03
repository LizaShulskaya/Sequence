//
//  Sequance.m
//  Sequance
//
//  Created by lizaveta shulskaya on 26.04.2018.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import "Sequence.h"

@implementation Sequence

@synthesize sequenArr;

- (int)lenght {
    NSArray *sortedSequence = [NSArray arrayWithArray:[[self sequenArr] sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return ([obj1 compare:obj2]);
    }]];
    
    int min = [sortedSequence[0] intValue];
    int length = 1;
    
    NSMutableArray *outputArr = [NSMutableArray array];
    [outputArr addObject:[NSNumber numberWithInt:min]];
    for(NSNumber *i in sortedSequence) {
        int intI = [i intValue];
        if((min+1) == intI) {
            min = intI;
            length++;
            [outputArr addObject:[NSNumber numberWithInt:min]];
        }
    }
    
    [self setSequenArr:outputArr];
    return length;
}

- (NSNumber *)sum {
    return ([sequenArr valueForKeyPath:@"@sum.self"]);
}

- (void)dealloc {
    [sequenArr release];
    [super dealloc];
}




@end
