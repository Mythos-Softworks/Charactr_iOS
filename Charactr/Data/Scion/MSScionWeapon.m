#import "MSScionWeapon.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionWeapon

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeInteger:_accuracy forKey:kMSAccuracyKey];
  [aCoder possiblyEncodeInteger:_damage forKey:kMSDamageKey];
  [aCoder possiblyEncodeInteger:_damageType forKey:kMSDamageTypeKey];
  [aCoder possiblyEncodeInteger:_speed forKey:kMSSpeedKey];
  [aCoder possiblyEncodeString:_info forKey:kMSInfoKey];

  [aCoder possiblyEncodeInteger:_defenseValue forKey:kMSDefenseValueKey];

  [aCoder possiblyEncodeInteger:_range forKey:kMSRangeKey];
  [aCoder possiblyEncodeInteger:_clipSize forKey:kMSClipSizeKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _accuracy = [aDecoder decodeIntegerForKey:kMSAccuracyKey];
    _damage = [aDecoder decodeIntegerForKey:kMSDamageKey];
    _damageType = [aDecoder decodeIntegerForKey:kMSDamageTypeKey];
    _speed = [aDecoder decodeIntegerForKey:kMSSpeedKey];
    _info = [aDecoder decodeObjectForKey:kMSInfoKey];

    _defenseValue = [aDecoder decodeIntegerForKey:kMSDefenseValueKey];

    _range = [aDecoder decodeIntegerForKey:kMSRangeKey];
    _clipSize = [aDecoder decodeIntegerForKey:kMSClipSizeKey];
  }
  return self;
}

@end
