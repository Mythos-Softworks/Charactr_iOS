#import "MSScionFeat.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSScionFeat

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeString:_category forKey:kMSCategoryKey];
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeString:_cost forKey:kMSCostKey];
  [aCoder possiblyEncodeString:_reference forKey:kMSReferenceKey];
  [aCoder possiblyEncodeString:_info forKey:kMSInfoKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
    _category = [aDecoder decodeObjectForKey:kMSCategoryKey];
    _cost = [aDecoder decodeObjectForKey:kMSCostKey];
    _reference = [aDecoder decodeObjectForKey:kMSReferenceKey];
    _info = [aDecoder decodeObjectForKey:kMSInfoKey];
  }
  return self;
}

@end
