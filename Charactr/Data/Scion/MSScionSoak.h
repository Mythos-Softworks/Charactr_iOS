#import <UIKit/UIKit.h>

@interface MSScionSoak : NSObject<NSCoding>

@property(nonatomic) NSInteger bashing;
@property(nonatomic) NSInteger lethal;
@property(nonatomic) NSInteger aggravated;

@end

@interface NSCoder (MSScionSoak)

/// Decodes an MSScionSoak that may have not been encoded.
/// In that case, this method initializes and returns a zeroed-out soak.
- (nonnull MSScionSoak *)decodePlausibleSoakForKey:(nonnull NSString *)key;

/// Encodes an MSScionSoak object iff it contains a nonzero value.
/// Decoding an unencoded soak will default to nil. To instead get back a
/// zeroed-out soak, use decodePlausbileSoakForKey.
- (void)possiblyEncodeSoak:(nullable MSScionSoak *)soak
                    forKey:(nonnull NSString *)key;

@end
