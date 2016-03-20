#import "MSScionCharacter.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

static NSInteger const kCurrentVersion = 1;

@implementation MSScionCharacter

@synthesize characterType = _characterType;

+ (MSCharacterType)characterType {
  return kMSCharacterTypeScion;
}

- (instancetype)init {
  if ((self = [super init])) {
    _version = kCurrentVersion;
    _experience = [[MSPointPool alloc] init];
    _attributes = [self initialAttributes];
    _abilities = [[self initialAbilities] mutableCopy];
    _willpower = [[MSPointPool alloc] init];
    _legend = 2;
    _legendPoints = [[MSPointPool alloc] init];
    _legendPoints.maxPool = 4;
    _legendPoints.currentPool = 4;
    _virtues = [self initialVirtues];
    _birthrights = [[NSMutableArray alloc] init];
    _boons = [[NSMutableArray alloc] init];
    _knacks = [[NSMutableArray alloc] init];
    _soak = [[MSScionSoak alloc] init];
    _weapons = [[NSMutableArray alloc] init];
    _armor = [[NSMutableArray alloc] init];
  }
  return self;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeInteger:_version forKey:kMSVersionKey];
  [aCoder possiblyEncodeString:_playerName forKey:kMSPlayerNameKey];
  [aCoder possiblyEncodeString:_calling forKey:kMSCallingKey];
  [aCoder possiblyEncodeString:_nature forKey:kMSNatureKey];
  [aCoder possiblyEncodeString:_pantheon forKey:kMSPantheonKey];
  [aCoder possiblyEncodeString:_patron forKey:kMSPatronKey];
  [aCoder possiblyEncodeString:_band forKey:kMSBandKey];
  [aCoder possiblyEncodeString:_role forKey:kMSRoleKey];
  [aCoder possiblyEncodePointPool:_experience forKey:kMSExperienceKey];
  [aCoder encodeObject:_attributes forKey:kMSAttributesKey];
  [aCoder encodeObject:_abilities forKey:kMSAbilitiesKey];
  [aCoder possiblyEncodePointPool:_willpower forKey:kMSWillpowerKey];
  [aCoder possiblyEncodeInteger:_legend forKey:kMSLegendKey];
  [aCoder possiblyEncodePointPool:_legendPoints forKey:kMSLegendPointsKey];
  [aCoder encodeObject:_virtues forKey:kMSVirtuesKey];
  [aCoder possiblyEncodeMutableArray:_birthrights forKey:kMSBirthrightsKey];
  [aCoder possiblyEncodeMutableArray:_boons forKey:kMSBoonsKey];
  [aCoder possiblyEncodeMutableArray:_knacks forKey:kMSKnacksKey];
  [aCoder possiblyEncodeSoak:_soak forKey:kMSSoakKey];
  [aCoder possiblyEncodeMutableArray:_weapons forKey:kMSWeaponsKey];
  [aCoder possiblyEncodeMutableArray:_armor forKey:kMSArmorKey];
  [aCoder possiblyEncodeInteger:_bashing forKey:kMSBashingKey];
  [aCoder possiblyEncodeInteger:_lethal forKey:kMSLethalKey];
  [aCoder possiblyEncodeInteger:_aggravated forKey:kMSAggravatedKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _version = [aDecoder decodeIntegerForKey:kMSVersionKey];
    _playerName = [aDecoder decodeObjectForKey:kMSPlayerNameKey];
    _calling = [aDecoder decodeObjectForKey:kMSCallingKey];
    _nature = [aDecoder decodeObjectForKey:kMSNatureKey];
    _pantheon = [aDecoder decodeObjectForKey:kMSPantheonKey];
    _patron = [aDecoder decodeObjectForKey:kMSPatronKey];
    _band = [aDecoder decodeObjectForKey:kMSBandKey];
    _role = [aDecoder decodeObjectForKey:kMSRoleKey];
    _experience = [aDecoder decodePlausiblePointPoolForKey:kMSExperienceKey];
    _attributes = [aDecoder decodeObjectForKey:kMSAttributesKey];
    _abilities = [aDecoder decodeObjectForKey:kMSAbilitiesKey];
    _willpower = [aDecoder decodePlausiblePointPoolForKey:kMSWillpowerKey];
    _legend = [aDecoder decodeIntegerForKey:kMSLegendKey];
    _legendPoints =
        [aDecoder decodePlausiblePointPoolForKey:kMSLegendPointsKey];
    _virtues = [aDecoder decodeObjectForKey:kMSVirtuesKey];
    _birthrights =
        [aDecoder decodePlausibleMutableArrayForKey:kMSBirthrightsKey];
    _boons = [aDecoder decodePlausibleMutableArrayForKey:kMSBoonsKey];
    _knacks = [aDecoder decodePlausibleMutableArrayForKey:kMSKnacksKey];
    _soak = [aDecoder decodePlausibleSoakForKey:kMSSoakKey];
    _weapons = [aDecoder decodePlausibleMutableArrayForKey:kMSWeaponsKey];
    _armor = [aDecoder decodePlausibleMutableArrayForKey:kMSArmorKey];
    _bashing = [aDecoder decodeIntegerForKey:kMSBashingKey];
    _lethal = [aDecoder decodeIntegerForKey:kMSLethalKey];
    _aggravated = [aDecoder decodeIntegerForKey:kMSAggravatedKey];
  }
  return self;
}

#pragma mark Private Methods

- (NSArray *)initialAttributes {
  return @[
      [[MSScionAttribute alloc] initWithName:@"Strength"],
      [[MSScionAttribute alloc] initWithName:@"Dexterity"],
      [[MSScionAttribute alloc] initWithName:@"Stamina"],
      [[MSScionAttribute alloc] initWithName:@"Charisma"],
      [[MSScionAttribute alloc] initWithName:@"Manipulation"],
      [[MSScionAttribute alloc] initWithName:@"Appearance"],
      [[MSScionAttribute alloc] initWithName:@"Perception"],
      [[MSScionAttribute alloc] initWithName:@"Intelligence"],
      [[MSScionAttribute alloc] initWithName:@"Wits"]
  ];
}

- (NSArray *)initialAbilities {
  return @[
      [[MSScionAbility alloc] initWithName:@"Academics" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Animal Ken" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Art" expandable:YES],
      [[MSScionAbility alloc] initWithName:@"Athletics" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Awareness" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Brawl" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Command" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Control" expandable:YES],
      [[MSScionAbility alloc] initWithName:@"Craft" expandable:YES],
      [[MSScionAbility alloc] initWithName:@"Empathy" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Fortitude" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Integrity" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Investigation" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Larceny" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Marksmanship" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Medicine" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Melee" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Occult" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Politics" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Presence" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Science" expandable:YES],
      [[MSScionAbility alloc] initWithName:@"Stealth" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Survival" expandable:NO],
      [[MSScionAbility alloc] initWithName:@"Thrown" expandable:NO]
  ];
}

- (NSArray *)initialVirtues {
  return @[
      [[MSNamedPointPool alloc] init],
      [[MSNamedPointPool alloc] init],
      [[MSNamedPointPool alloc] init],
      [[MSNamedPointPool alloc] init]
  ];
}

@end
