#import <UIKit/UIKit.h>

#import "MSCharacterStorageObject.h"

@protocol MSCharacterCreationDelegate <NSObject>

- (void)characterCreationCanceled;
- (void)createdCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info;

@end

@interface MSCharacterCreationViewController : UICollectionViewController

- (instancetype)initWithDelegate:(id<MSCharacterCreationDelegate>)delegate;

@end
