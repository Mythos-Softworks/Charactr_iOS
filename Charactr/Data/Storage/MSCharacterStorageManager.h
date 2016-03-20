#import <UIKit/UIKit.h>

#import "MSCharacter.h"
#import "MSCharacterStorageObject.h"

/// Object to handle the storage and retrieval of characters.
@interface MSCharacterStorageManager : NSObject

/// Number of existing characters.
@property(readonly) NSInteger count;

/// Bubbles now-most-recent access to the top.
- (void)accessedCharacterAtIndex:(NSInteger)index;

/// Adds a new character to the existing character list.
- (void)addCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info;

/// App-level character information (name, class, etc.) at index.
- (MSCharacterStorageObject *)characterInfoAtIndex:(NSInteger)index;

/// User-level character information (character sheet) at index.
- (id<MSCharacter>)characterAtIndex:(NSInteger)index;

/// Save the most recently accessed character to disk.
- (void)saveCurrentCharacter;

@end
