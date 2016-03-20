#import "MSCharacter.h"

/// Object to maintain information about a stored character.
@interface MSCharacterStorageObject : NSObject<NSCoding>

/// File path where character object is stored.
@property(readonly) NSString *filePath;

/// Character name.
@property(nonatomic, strong) NSString *name;

/// Type of character sheet.
@property(nonatomic) MSCharacterType characterType;

- (instancetype)initWithName:(NSString *)name characterType:(MSCharacterType)characterType
    NS_DESIGNATED_INITIALIZER;

- (instancetype)init
    NS_UNAVAILABLE;

@end
