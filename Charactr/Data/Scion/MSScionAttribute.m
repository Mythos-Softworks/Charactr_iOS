#import "MSScionAttribute.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionAttribute

- (instancetype)initWithName:(NSString *)name {
  if ((self = [super init])) {
    _name = name;
    _value = 1;
  }
  return self;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeInteger:_value forKey:kMSValueKey];
  [aCoder possiblyEncodeInteger:_epicValue forKey:kMSEpicValueKey];
  [aCoder possiblyEncodeBool:_favored forKey:kMSFavoredKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _value = [aDecoder decodeIntegerForKey:kMSValueKey];
    _epicValue = [aDecoder decodeIntegerForKey:kMSEpicValueKey];
    _favored = [aDecoder decodeBoolForKey:kMSFavoredKey];
  }
  return self;
}

@end
