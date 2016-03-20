#import "MSCharacterSelectCell.h"

static const CGFloat kNameLabelPadding = 4.0;

@implementation MSCharacterSelectCell {
  UILabel *_nameLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    self.backgroundColor = [UIColor darkGrayColor];

    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_nameLabel];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGSize boundSize = self.bounds.size;
  CGSize nameSize = [_nameLabel sizeThatFits:boundSize];
  CGFloat nameHeight = nameSize.height + kNameLabelPadding * 2.0;
  _nameLabel.frame = CGRectMake(0.0,
                                boundSize.height - nameHeight,
                                boundSize.width,
                                nameHeight);
}

#pragma mark

- (void)setCharacterInfo:(MSCharacterStorageObject *)characterInfo {
  _nameLabel.text = characterInfo.name;
  [self setNeedsLayout];
}

@end
