#import "MSScionBirthright.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionBirthright

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeInteger:_value forKey:kMSValueKey];
  [aCoder possiblyEncodeString:_info forKey:kMSInfoKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _value = [aDecoder decodeIntegerForKey:kMSValueKey];
    _info = [aDecoder decodeObjectForKey:kMSInfoKey];
  }
  return self;
}

@end
