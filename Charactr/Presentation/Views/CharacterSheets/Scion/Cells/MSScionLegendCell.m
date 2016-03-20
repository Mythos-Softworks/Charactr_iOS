#import "MSScionLegendCell.h"

#import "UIButton+MSButtons.h"
#import "UILabel+MSLabels.h"
#import "UIView+MSLayout.h"

@implementation MSScionLegendCell {
  id<MSScionLegendHandler> _handler;

  UILabel *_legendNameLabel;
  UILabel *_legendValueLabel;
  UIButton *_legendIncrementButton;
  UIButton *_legendDecrementButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    UIView *contentView = self.contentView;

    _legendNameLabel = [UILabel titleLabelWithText:@"Legend"];
    [contentView addSubview:_legendNameLabel];

    _legendValueLabel = [UILabel valueLabel];
    [contentView addSubview:_legendValueLabel];

    _legendIncrementButton =
        [UIButton incrementButtonWithTarget:self action:@selector(incrementLegendValue:)];
    [contentView addSubview:_legendIncrementButton];

    _legendDecrementButton =
        [UIButton decrementButtonWithTarget:self action:@selector(decrementLegendValue:)];
    [contentView addSubview:_legendDecrementButton];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  CGFloat totalOffset = 0.0;

  totalOffset = [self layoutTitleView:_legendNameLabel withXOffset:totalOffset];

  totalOffset = [self layoutInteractiveView:_legendDecrementButton withXOffset:totalOffset];

  totalOffset = [self layoutInteractiveView:_legendValueLabel withXOffset:totalOffset];

  totalOffset = [self layoutInteractiveView:_legendIncrementButton withXOffset:totalOffset];
}

#pragma mark

- (void)setLegend:(NSInteger)legend handler:(id<MSScionLegendHandler>)handler {
  [self setLegendValue:legend];
  _handler = handler;
}

#pragma mark Interface Events

- (void)incrementLegendValue:(UIButton *)sender {
  [self setLegendValue:[_handler legendRatingIncrementButtonPressed]];
}

- (void)decrementLegendValue:(UIButton *)sender {
  [self setLegendValue:[_handler legendRatingDecrementButtonPressed]];
}

#pragma mark Private Methods

- (void)setLegendValue:(NSInteger)value {
  _legendValueLabel.text = [NSString stringWithFormat:@"%d", value];
  _legendIncrementButton.enabled = value < 12;
  _legendDecrementButton.enabled = value > 2;
  [self setNeedsDisplay];
}

@end
