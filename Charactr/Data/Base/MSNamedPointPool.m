#import "MSNamedPointPool.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSNamedPointPool

- (instancetype)initWithName:(NSString *)name {
  if ((self = [super init])) {
    _name = name;
  }
  return self;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [super encodeWithCoder:aCoder];
  [aCoder possiblyEncodeString:_name forKey:kMSNameKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super initWithCoder:aDecoder])) {
    _name = [aDecoder decodeObjectForKey:kMSNameKey];
  }
  return self;
}

@end
