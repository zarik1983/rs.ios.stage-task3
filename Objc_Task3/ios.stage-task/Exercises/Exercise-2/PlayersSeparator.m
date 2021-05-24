#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSMutableArray<NSNumber *> *upperArray = [NSMutableArray new];
    NSMutableArray<NSNumber *> *lowerArray = [NSMutableArray new];
        
    for (NSNumber *item in ratingArray) {
        if ([upperArray count] == 0 || [item intValue] > [[upperArray lastObject] intValue]) {
            [upperArray addObject:item];
        } else {
            if ([upperArray count] == 1) {
                upperArray[0] = item;
            } else {
                NSNumber *tempNumber = [upperArray lastObject];
                [upperArray removeLastObject];
                if ([item intValue] > [[upperArray lastObject] intValue]) {
                    [upperArray addObject:item];
                } else {
                    [upperArray addObject:tempNumber];
                }
            }
        }
    }
    
    for (NSNumber *item in ratingArray) {
        if ([lowerArray count] == 0 || [item intValue] < [[lowerArray lastObject] intValue]) {
            [lowerArray addObject:item];
        } else {
            if ([lowerArray count] == 1) {
                lowerArray[0] = item;
            } else {
                NSNumber *tempNumber = [lowerArray lastObject];
                [lowerArray removeLastObject];
                if ([item intValue] < [[lowerArray lastObject] intValue]) {
                    [lowerArray addObject:item];
                } else {
                    [lowerArray addObject:tempNumber];
                }
            }
        }
    }
    int numberCombs = 0;
    if ([upperArray count] > 2) {
        numberCombs += [self factorial:[upperArray count]]/([self factorial:3]*[self factorial:[upperArray count]-3]);
    }
    if ([lowerArray count] > 2) {
        numberCombs += [self factorial:[lowerArray count]]/([self factorial:3]*[self factorial:[lowerArray count]-3]);
    }
return numberCombs;
}

- (int)factorial:(int)n
{
    if (n == 0)
        return 1;
    return n * [self factorial:n-1];
}

@end

