#import <UIKit/UIKit.h>

#import "MSScionSoak.h"

@interface MSScionArmor : NSObject<NSCoding>

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) MSScionSoak *soak;
@property(nonatomic) NSInteger mobilityPenalty;
@property(nonatomic) NSInteger fatigue;
@property(nonatomic, strong) NSString *info;
@property(nonatomic) BOOL worn;

@end
