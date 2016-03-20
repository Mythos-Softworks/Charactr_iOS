#import "MSPointPool.h"

#import "MSArchiveKeys.h"
#import "NSCoder+MSCoding.h"

@implementation MSPointPool

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder possiblyEncodeInteger:_maxPool forKey:kMSMaxPoolKey];
  [aCoder possiblyEncodeInteger:_currentPool forKey:kMSCurrentPoolKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super init])) {
    _maxPool = [aDecoder decodeIntegerForKey:kMSMaxPoolKey];
    _currentPool = [aDecoder decodeIntegerForKey:kMSCurrentPoolKey];
  }
  return self;
}

@end

@implementation NSCoder (MSPointPool)

- (MSPointPool *)decodePlausiblePointPoolForKey:(NSString *)key {
  MSPointPool *pointPool = [self decodeObjectForKey:key];
  if (!pointPool) pointPool = [[MSPointPool alloc] init];
  return pointPool;
}

- (void)possiblyEncodePointPool:(MSPointPool *)pointPool
                         forKey:(NSString *)key {
  if (pointPool.maxPool || pointPool.currentPool) [self encodeObject:pointPool
                                                              forKey:key];
}

@end
