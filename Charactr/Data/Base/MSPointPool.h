#import <Foundation/Foundation.h>

/// Used for points that can be spent and regained (e.g. Willpower).
@interface MSPointPool : NSObject<NSCoding>

@property(nonatomic) NSInteger maxPool;
@property(nonatomic) NSInteger currentPool;

@end

@interface NSCoder (MSPointPool)

/// Decodes an MSPointPool that may have not been encoded.
/// In that case, this method initializes and returns a zeroed-out pool.
- (nonnull MSPointPool *)decodePlausiblePointPoolForKey:(nonnull NSString *)key;

/// Encodes an MSPointPool object iff it contains a nonzero value.
/// Decoding an unencoded pool will default to nil. To instead get back a
/// zeroed-out pool, use decodePlausbilePointPoolForKey.
- (void)possiblyEncodePointPool:(nullable MSPointPool *)pointPool
                         forKey:(nonnull NSString *)key;

@end
