#import <Foundation/Foundation.h>

@interface NSCoder (MSCoding)

/// Decodes an NSMutableArray that may have not been encoded.
/// In that case, this method initializes and returns an empty mutable array.
- (nonnull NSMutableArray *)decodePlausibleMutableArrayForKey:
    (nonnull NSString *)key;

/// Encodes a BOOL iff its value is YES.
/// Decoding an unencoded BOOL will default to NO.
- (void)possiblyEncodeBool:(BOOL)boolean forKey:(nonnull NSString *)key;

/// Encodes an integer iff its value is nonzero.
/// Decoding an unencoded integer will default to 0.
- (void)possiblyEncodeInteger:(NSInteger)integer forKey:(nonnull NSString *)key;

/// Encodes an NSMutableArray iff it contains something.
/// Decoding an unencoded array will default to nil. To instead get back an
/// empty array, use decodePlausibleMutableArrayForKey.
- (void)possiblyEncodeMutableArray:(nullable NSMutableArray *)mutableArray
                            forKey:(nonnull NSString *)key;

/// Encodes an object iff it isn't nil.
/// Decoding an unencoded object will default to nil.
- (void)possiblyEncodeObject:(nullable id)object forKey:(nonnull NSString *)key;

/// Encodes an NSString iff its length is nonzero.
/// Decoding an unencoded string will default to nil.
- (void)possiblyEncodeString:(nullable NSString *)string
                      forKey:(nonnull NSString *)key;

@end
