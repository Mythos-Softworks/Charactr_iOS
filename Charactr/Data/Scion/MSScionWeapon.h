#import <UIKit/UIKit.h>

typedef enum {
  MSScionDamageTypeBashing,
  MSScionDamageTypeLethal,
  MSScionDamageTypeAggravated
} MSScionDamageType;

@interface MSScionWeapon : NSObject<NSCoding>

@property(nonatomic, strong) NSString *name;
@property(nonatomic) NSInteger accuracy;
@property(nonatomic) NSInteger damage;
@property(nonatomic) MSScionDamageType damageType;
@property(nonatomic) NSInteger speed;
@property(nonatomic) NSString *info;

// Melee
@property(nonatomic) NSInteger defenseValue;

// Ranged
@property(nonatomic) NSInteger range;
@property(nonatomic) NSInteger clipSize;

@end
