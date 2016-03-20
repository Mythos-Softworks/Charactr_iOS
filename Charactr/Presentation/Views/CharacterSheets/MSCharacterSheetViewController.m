#import "MSCharacterSheetViewController.h"

@implementation MSCharacterSheetViewController

- (instancetype)initWithCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info {
  if ((self = [super initWithNibName:nil bundle:nil])) {
    _character = character;
    _info = info;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
  [infoButton addTarget:self action:@selector(infoButtonPressed:)
       forControlEvents:UIControlEventTouchUpInside];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];

  self.navigationItem.title = _info.name;
}

#pragma mark

- (void)infoButtonPressed:(UIBarButtonItem *)infoButton {
  NSAssert(NO, @"infoButtonPressed: not overridden in subclass!");
}

@end
