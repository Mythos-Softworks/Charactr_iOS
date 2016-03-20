#import <Foundation/Foundation.h>

#import "MSCharacter.h"
#import "MSNamedPointPool.h"
#import "MSPointPool.h"
#import "MSScionAbility.h"
#import "MSScionArmor.h"
#import "MSScionAttribute.h"
#import "MSScionBirthright.h"
#import "MSScionFeat.h"
#import "MSScionSoak.h"
#import "MSScionWeapon.h"

@interface MSScionCharacter : NSObject<MSCharacter, NSCoding>

// App info
@property(nonatomic) NSInteger version;

// Metagame information
@property(nonatomic, strong) NSString *playerName;
@property(nonatomic, strong) NSString *calling;
@property(nonatomic, strong) NSString *nature;
@property(nonatomic, strong) NSString *pantheon;
@property(nonatomic, strong) NSString *patron;
@property(nonatomic, strong) NSString *band;
@property(nonatomic, strong) NSString *role;
@property(nonatomic, strong) MSPointPool *experience;

// Attributes
@property(nonatomic, strong) NSArray<MSScionAttribute *> *attributes;

// Abilities
@property(nonatomic, strong) NSMutableArray<MSScionAbility *> *abilities;

// Scion-tific stats
@property(nonatomic, strong) MSPointPool *willpower;
@property(nonatomic) NSInteger legend;
@property(nonatomic, strong) MSPointPool *legendPoints;
@property(nonatomic, strong) NSArray<MSNamedPointPool *> *virtues;
@property(nonatomic, strong) NSMutableArray<MSScionBirthright *> *birthrights;
@property(nonatomic, strong) NSMutableArray<MSScionFeat *> *boons;
@property(nonatomic, strong) NSMutableArray<MSScionFeat *> *knacks;

// Combat
@property(nonatomic, strong) MSScionSoak *soak;
@property(nonatomic, strong) NSMutableArray<MSScionWeapon *> *weapons;
@property(nonatomic, strong) NSMutableArray<MSScionArmor *> *armor;
@property(nonatomic) NSInteger bashing;
@property(nonatomic) NSInteger lethal;
@property(nonatomic) NSInteger aggravated;

@end
