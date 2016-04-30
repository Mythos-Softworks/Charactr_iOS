#import "MSScionVirtuesCell.h"

#import "UIButton+MSButtons.h"
#import "UILabel+MSLabels.h"
#import "UIView+MSLayout.h"

static const NSInteger kNumberOfVirtues = 4;

@implementation MSScionVirtuesCell {
  id<MSScionVirtueHandler> _handler;

  NSMutableArray<UILabel *> *_virtueNameLabels;
  NSMutableArray<UILabel *> *_virtueValueLabels;
  NSMutableArray<UIButton *> *_virtueIncrementButtons;
  NSMutableArray<UIButton *> *_virtueDecrementButtons;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    _virtueNameLabels = [[NSMutableArray alloc] init];
    _virtueValueLabels = [[NSMutableArray alloc] init];
    _virtueIncrementButtons = [[NSMutableArray alloc] init];
    _virtueDecrementButtons = [[NSMutableArray alloc] init];

    UIView *contentView = self.contentView;
    for (NSInteger i = 0; i < kNumberOfVirtues; i++) {
      UILabel *nameLabel =
          [UILabel labelWithText:[NSString stringWithFormat:@"Virtue %ld", (long)i]];
      [contentView addSubview:nameLabel];
      [_virtueNameLabels addObject:nameLabel];

      UILabel *valueLabel = [UILabel valueLabel];
      [contentView addSubview:valueLabel];
      [_virtueValueLabels addObject:valueLabel];

      UIButton *incrementButton =
          [UIButton incrementButtonWithTarget:self action:@selector(incrementVirtueValue:)];
      [contentView addSubview:incrementButton];
      [_virtueIncrementButtons addObject:incrementButton];

      UIButton *decrementButton =
          [UIButton decrementButtonWithTarget:self action:@selector(decrementVirtueValue:)];
      [contentView addSubview:decrementButton];
      [_virtueDecrementButtons addObject:decrementButton];
    }
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  // TODO(jaysen): Layout subviews...
}

#pragma mark

- (void)setVirtues:(NSArray<MSNamedPointPool *> *)virtues
           handler:(id<MSScionVirtueHandler>)handler {
  // TODO(jaysen): Handle!
}

#pragma mark Interface Events

- (void)incrementVirtueValue:(UIButton *)sender {
  // TODO(jaysen): Increment!
}

- (void)decrementVirtueValue:(UIButton *)sender {
  // TODO(jaysen): Decrement!
}

@end
