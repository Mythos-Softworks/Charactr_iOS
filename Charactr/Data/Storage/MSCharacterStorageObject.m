#import "MSCharacterStorageObject.h"

#import "MSArchiveKeys.h"
#import "MSScionCharacter.h"
#import "NSCoder+MSCoding.h"

@implementation MSCharacterStorageObject {
  NSString *_fileName;
}

- (instancetype)initWithName:(NSString *)name characterType:(MSCharacterType)characterType {
  if ((self = [super init])) {
    _name = name;
    _characterType = characterType;
  }
  return self;
}

- (NSString *)filePath {
  if (!_fileName) {
    _fileName = [self generateFileName];
  }
  return [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), _fileName];
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:_name forKey:kMSNameKey];
  [aCoder possiblyEncodeInteger:_characterType forKey:kMSCharacterTypeKey];
  [aCoder encodeObject:_fileName forKey:kMSFileNameKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [self initWithName:[aDecoder decodeObjectForKey:kMSNameKey]
                   characterType:[aDecoder decodeIntegerForKey:kMSCharacterTypeKey]])) {
    _fileName = [aDecoder decodeObjectForKey:kMSFileNameKey];
  }
  return self;
}

#pragma mark Private Methods

- (NSString *)generateFileName {
  return [NSString stringWithFormat:@"%@.chr", [[NSUUID UUID] UUIDString]];
}

@end
