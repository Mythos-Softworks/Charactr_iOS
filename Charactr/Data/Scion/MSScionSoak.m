#import "MSScionSoak.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionSoak

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeInteger:_bashing forKey:kMSBashingKey];
  [aCoder possiblyEncodeInteger:_lethal forKey:kMSLethalKey];
  [aCoder possiblyEncodeInteger:_aggravated forKey:kMSAggravatedKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _bashing = [aDecoder decodeIntegerForKey:kMSBashingKey];
    _lethal = [aDecoder decodeIntegerForKey:kMSLethalKey];
    _aggravated = [aDecoder decodeIntegerForKey:kMSAggravatedKey];
  }
  return self;
}

@end

@implementation NSCoder (MSScionSoak)

- (MSScionSoak *)decodePlausibleSoakForKey:(NSString *)key {
  MSScionSoak *soak = [self decodeObjectForKey:key];
  if (!soak) soak = [[MSScionSoak alloc] init];
  return soak;
}

- (void)possiblyEncodeSoak:(MSScionSoak *)soak forKey:(NSString *)key {
  if (soak.bashing || soak.lethal || soak.aggravated)
      [self encodeObject:soak forKey:key];
}

@end
