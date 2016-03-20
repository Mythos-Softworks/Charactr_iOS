#import "MSScionAbility.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionAbility

- (instancetype)initWithName:(NSString *)name expandable:(BOOL)expandable {
  if ((self = [super init])) {
    _name = name;
    _expandable = expandable;
  }
  return self;
}

- (instancetype)initWithName:(NSString *)name
               parentAbility:(MSScionAbility *)parentAbility {
  if ((self = [self initWithName:name expandable:NO])) {
    _parentAbility = parentAbility;
  }
  return self;
}

#pragma mark -

- (BOOL)favored {
  if (_parentAbility) {
    return _parentAbility.favored;
  }
  return _favored;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeInteger:_value forKey:kMSValueKey];
  [aCoder possiblyEncodeBool:_favored forKey:kMSFavoredKey];
  [aCoder possiblyEncodeBool:_expandable forKey:kMSExpandableKey];
  [aCoder possiblyEncodeObject:_parentAbility forKey:kMSParentAbilityKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _value = [aDecoder decodeIntegerForKey:kMSValueKey];
    _favored = [aDecoder decodeBoolForKey:kMSFavoredKey];
    _expandable = [aDecoder decodeBoolForKey:kMSExpandableKey];
    _parentAbility = [aDecoder decodeObjectForKey:kMSParentAbilityKey];
  }
  return self;
}

@end
