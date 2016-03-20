#import "MSCollectionViewCell.h"

@implementation MSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    self.layer.borderColor = [[UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0] CGColor];
  }
  return self;
}

- (void)setSelected:(BOOL)selected {
  [super setSelected:selected];
  self.layer.borderWidth = selected ? 4.0 : 0.0;
}

@end
