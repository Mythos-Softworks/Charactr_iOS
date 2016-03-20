#import "MSCharacterCreationView.h"

@implementation MSCharacterCreationView

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    _characterNameField = [[UITextField alloc] initWithFrame:CGRectZero];
    _characterNameField.borderStyle = UITextBorderStyleRoundedRect;
    _characterNameField.placeholder = @"Character name";
    _characterNameField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self addSubview:_characterNameField];
    self.backgroundColor = [UIColor grayColor];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGSize boundSize = self.bounds.size;
  CGSize characterNameFieldSize = CGSizeMake(boundSize.width / 2.0, 22.0);
  _characterNameField.frame = CGRectMake((boundSize.width - characterNameFieldSize.width) / 2.0,
                                         boundSize.height / 7.0,
                                         characterNameFieldSize.width,
                                         characterNameFieldSize.height);
}

@end
