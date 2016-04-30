#import "MSScionAttributeCell.h"

#import "UIButton+MSButtons.h"
#import "UILabel+MSLabels.h"
#import "UIView+MSLayout.h"

@implementation MSScionAttributeCell {
  id<MSScionAttributeHandler> _handler;

  UILabel *_attributeNameLabel;
  UILabel *_attributeValueLabel;
  UIButton *_attributeIncrementButton;
  UIButton *_attributeDecrementButton;

  UILabel *_epicNameLabel;
  UILabel *_epicValueLabel;
  UIButton *_epicIncrementButton;
  UIButton *_epicDecrementButton;

  UIButton *_favoredButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    UIView *contentView = self.contentView;

    // Main attribute elements.
    _attributeNameLabel = [UILabel boldTitleLabelWithText:@"Attribute"];
    [contentView addSubview:_attributeNameLabel];

    _attributeValueLabel = [UILabel valueLabel];
    [contentView addSubview:_attributeValueLabel];

    _attributeIncrementButton =
        [UIButton incrementButtonWithTarget:self action:@selector(incrementAttributeValue:)];
    [contentView addSubview:_attributeIncrementButton];

    _attributeDecrementButton =
        [UIButton decrementButtonWithTarget:self action:@selector(decrementAttributeValue:)];
    [contentView addSubview:_attributeDecrementButton];

    // Epic attribute elements.
    _epicNameLabel = [UILabel subtitleLabelWithText:@"Epic Attribute"];
    [contentView addSubview:_epicNameLabel];

    _epicValueLabel = [UILabel subvalueLabel];
    [contentView addSubview:_epicValueLabel];

    _epicIncrementButton =
        [UIButton incrementButtonWithTarget:self
                                     action:@selector(incrementEpicValue:)];
    [contentView addSubview:_epicIncrementButton];

    _epicDecrementButton =
        [UIButton decrementButtonWithTarget:self
                                     action:@selector(decrementEpicValue:)];
    [contentView addSubview:_epicDecrementButton];

    // Favored attribute elements.
    _favoredButton = [UIButton toggleLightButtonWithTarget:self action:@selector(toggleFavored:)];
    [contentView addSubview:_favoredButton];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  CGFloat totalOffset = 0.0;

  totalOffset = [self layoutInteractiveView:_favoredButton withXOffset:totalOffset];

  totalOffset = [self layoutTitleView:_attributeNameLabel
                         subtitleView:_epicNameLabel
                          withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_attributeDecrementButton
                          secondaryInteractiveView:_epicDecrementButton
                                       withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_attributeValueLabel
                          secondaryInteractiveView:_epicValueLabel
                                       withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_attributeIncrementButton
                          secondaryInteractiveView:_epicIncrementButton
                                       withXOffset:totalOffset];
}

#pragma mark

- (void)setAttribute:(MSScionAttribute *)attribute handler:(id<MSScionAttributeHandler>)handler {
  _attributeNameLabel.text = attribute.name;
  [self setAttributeValue:attribute.value];

  _epicNameLabel.text = [NSString stringWithFormat:@"Epic %@", attribute.name];
  [self setEpicValue:attribute.epicValue];

  [self setFavored:attribute.favored];

  _handler = handler;
}

#pragma mark Interface Events

- (void)incrementAttributeValue:(UIButton *)sender {
  [self setAttributeValue:[_handler attributeIncrementButtonPressedInCell:self]];
}

- (void)decrementAttributeValue:(UIButton *)sender {
  [self setAttributeValue:[_handler attributeDecrementButtonPressedInCell:self]];
}

- (void)incrementEpicValue:(UIButton *)sender {
  [self setEpicValue:[_handler epicAttributeIncrementButtonPressedInCell:self]];
}

- (void)decrementEpicValue:(UIButton *)sender {
  [self setEpicValue:[_handler epicAttributeDecrementButtonPressedInCell:self]];
}

- (void)toggleFavored:(UIButton *)sender {
  [self setFavored:[_handler favoredAttributeButtonPressedInCell:self]];
}

#pragma mark Private Methods

- (void)setAttributeValue:(NSInteger)value {
  _attributeValueLabel.text = [NSString stringWithFormat:@"%ld", (long)value];
  _attributeIncrementButton.enabled = value < 10;
  _attributeDecrementButton.enabled = value > 1;
  [self setNeedsDisplay];
}

- (void)setEpicValue:(NSInteger)value {
  _epicValueLabel.text = [NSString stringWithFormat:@"%ld", (long)value];
  _epicIncrementButton.enabled = value < 10;
  _epicDecrementButton.enabled = value > 0;
  [self setNeedsDisplay];
}

- (void)setFavored:(BOOL)favored {
  _favoredButton.selected = favored;
  [self setNeedsDisplay];
}

@end
