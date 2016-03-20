#import "NSCoder+MSCoding.h"

@implementation NSCoder (MSCoding)

- (NSMutableArray *)decodePlausibleMutableArrayForKey:(NSString *)key {
  NSMutableArray *mutableArray = [self decodeObjectForKey:key];
  if (!mutableArray) mutableArray = [[NSMutableArray alloc] init];
  return mutableArray;
}

- (void)possiblyEncodeBool:(BOOL)boolean forKey:(NSString *)key {
  if (boolean) [self encodeBool:boolean forKey:key];
}

- (void)possiblyEncodeInteger:(NSInteger)integer forKey:(NSString *)key {
  if (integer) [self encodeInteger:integer forKey:key];
}

- (void)possiblyEncodeMutableArray:(NSMutableArray *)mutableArray
                            forKey:(NSString *)key {
  if (mutableArray.count) [self encodeObject:mutableArray forKey:key];
}

- (void)possiblyEncodeObject:(id)object forKey:(NSString *)key {
  if (object) [self encodeObject:object forKey:key];
}

- (void)possiblyEncodeString:(NSString *)string forKey:(NSString *)key {
  if (string.length) [self encodeObject:string forKey:key];
}

@end
