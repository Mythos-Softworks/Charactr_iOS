#import "MSCharacterCreationViewController.h"

#import "MSCharacterCreationView.h"
#import "MSScionCharacter.h"

@implementation MSCharacterCreationViewController {
  id<MSCharacterCreationDelegate> _delegate;
}

- (instancetype)initWithDelegate:(id<MSCharacterCreationDelegate>)delegate {
  if ((self = [super initWithNibName:nil bundle:nil])) {
    _delegate = delegate;
  }
  return self;
}

- (void)loadView {
  self.view = [[MSCharacterCreationView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setupNavigationItems];
}

#pragma mark Interface Handlers

#pragma mark Private Methods

- (id<MSCharacter>)createCharacterForType:(MSCharacterType)type {
  id<MSCharacter> character;

  switch (type) {
    case kMSCharacterTypeScion:
      character = [[MSScionCharacter alloc] init];
      break;
  }

  return character;
}

- (void)save {
  MSCharacterCreationView *characterCreationView = (MSCharacterCreationView *)self.view;
  NSString *characterName = characterCreationView.characterNameField.text;
  // TODO: Actually retrieve character type.
  MSCharacterType characterType = kMSCharacterTypeScion;
  if (characterName.length) {
    MSCharacterStorageObject *info = [[MSCharacterStorageObject alloc] initWithName:characterName
                                                                      characterType:characterType];
    [_delegate createdCharacter:[self createCharacterForType:characterType]
                           info:info];
  } else {
    // TODO: Display error.
  }
}

- (void)setupNavigationItems {
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                       style:UIBarButtonItemStylePlain
                                      target:_delegate
                                      action:@selector(characterCreationCanceled)];

  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(save)];

  self.navigationItem.title = @"New Character";
}

@end
