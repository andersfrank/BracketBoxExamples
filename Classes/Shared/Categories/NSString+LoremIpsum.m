//
//  NSString+LoremIpsum.m
//  BracketApp
//
//  Created by Anders Frank on 20/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "NSString+LoremIpsum.h"

@implementation NSString (LoremIpsum)

+ (instancetype)ba_loremIpsumString:(NSUInteger)wordCount {
    NSMutableArray *words = [NSMutableArray arrayWithCapacity:wordCount];
    for (int i = 0; i < wordCount; i++) {
        NSUInteger randomIndex = arc4random_uniform((u_int32_t)wordCount);
        NSString *word =[self ba_ipsumWords][randomIndex];
        if (i == 0) {
            word = [word capitalizedString];
        }
        [words addObject:word];
    }
    return [self ba_stringByCombiningComponents:words withString:@" "];
}

+ (NSArray *)ba_ipsumWords {
    static NSArray *words = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        words = [@"lorem ipsum dolor sit amet, consectetur adipiscing elit phasellus est nibh, porta nec suscipit ut, molestie non orci nulla commodo orci mattis nulla faucibus consequat nunc laoreet est sed ante pharetra euismod ultrices lorem dapibus integer cursus imperdiet massa viverra rhoncus magna tempus sit amet nunc sed est gravida interdum lectus nec, blandit libero. aenean et fringilla neque maecenas ultrices turpis at sapien molestie mollis donec pulvinar pretium lobortis phasellus vitae diam imperdiet, fringilla ante at pharetra justo etiam in viverra erat vel cursus urna phasellus sit amet tristique dui cras id ante blandit congue elit eu rutrum eros" componentsSeparatedByString:@" "];
    });
    return words;
}
            
+ (NSString *)ba_stringByCombiningComponents:(NSArray *)components withString:(NSString *)separator {
    if (components.count == 0) {
        return nil;
    }
    NSMutableString *result = [NSMutableString new];
    [components enumerateObjectsUsingBlock:^(NSString *component, NSUInteger idx, BOOL *stop) {
        [result appendString:component];
        BOOL last = component == components.lastObject;
        if (!last && separator) {
            [result appendString:separator];
        }
    }];
    return [NSString stringWithString:result];
}

@end
