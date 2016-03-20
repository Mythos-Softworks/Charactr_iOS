#import "MSCharacterCreateCell.h"

@implementation MSCharacterCreateCell {
  UILabel *_createLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    self.backgroundColor = [UIColor whiteColor];

    _createLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _createLabel.numberOfLines = 2;
    _createLabel.textAlignment = NSTextAlignmentCenter;
    _createLabel.text = @"Create\nCharacter";
    [self addSubview:_createLabel];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGSize boundSize = self.bounds.size;
  CGSize createSize = [_createLabel sizeThatFits:boundSize];
  _createLabel.frame = CGRectMake((boundSize.width - createSize.width) / 2.0,
                                  (boundSize.height - createSize.height) / 2.0,
                                  createSize.width,
                                  createSize.height);
}

@end
