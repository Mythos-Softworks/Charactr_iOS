#import "MSScionArmor.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionArmor

- (instancetype)init {
  if ((self = [super init])) {
    _soak = [[MSScionSoak alloc] init];
  }
  return self;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeSoak:_soak forKey:kMSSoakKey];
  [aCoder possiblyEncodeInteger:_mobilityPenalty forKey:kMSMobilityPenaltyKey];
  [aCoder possiblyEncodeInteger:_fatigue forKey:kMSFatigueKey];
  [aCoder possiblyEncodeString:_info forKey:kMSInfoKey];
  [aCoder possiblyEncodeBool:_worn forKey:kMSWornKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _soak = [aDecoder decodePlausibleSoakForKey:kMSSoakKey];
    _mobilityPenalty = [aDecoder decodeIntegerForKey:kMSMobilityPenaltyKey];
    _fatigue = [aDecoder decodeIntegerForKey:kMSFatigueKey];
    _info = [aDecoder decodeObjectForKey:kMSInfoKey];
    _worn = [aDecoder decodeBoolForKey:kMSWornKey];
  }
  return self;
}

@end
