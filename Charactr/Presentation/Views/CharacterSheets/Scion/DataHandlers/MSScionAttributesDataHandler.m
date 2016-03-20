#import "MSScionAttributesDataHandler.h"

#import "MSScionAttributeCell.h"

static NSString *const kAttributeCellIdentifier = @"kAttributeCellIdentifier";
static const CGFloat kCellHeight = 54.0;

@interface MSScionAttributesDataHandler ()<MSScionAttributeHandler>

@end

@implementation MSScionAttributesDataHandler

- (void)handleDataForTable:(UITableView *)table delegate:(id<MSDataHandlerDelegate>)delegate {
  [super handleDataForTable:table delegate:delegate];

  [table registerClass:[MSScionAttributeCell class]
      forCellReuseIdentifier:kAttributeCellIdentifier];
}

#pragma mark <MSScionAttributeHandler>

- (NSInteger)attributeIncrementButtonPressedInCell:(MSScionAttributeCell *)cell {
  MSScionAttribute *attribute = [self attributeForCell:cell];
  attribute.value++;
  return attribute.value;
}

- (NSInteger)attributeDecrementButtonPressedInCell:(MSScionAttributeCell *)cell {
  MSScionAttribute *attribute = [self attributeForCell:cell];
  attribute.value--;
  return attribute.value;
}

- (NSInteger)epicAttributeIncrementButtonPressedInCell:(MSScionAttributeCell *)cell {
  MSScionAttribute *attribute = [self attributeForCell:cell];
  attribute.epicValue++;
  return attribute.epicValue;
}

- (NSInteger)epicAttributeDecrementButtonPressedInCell:(MSScionAttributeCell *)cell {
  MSScionAttribute *attribute = [self attributeForCell:cell];
  attribute.epicValue--;
  return attribute.epicValue;
}

- (BOOL)favoredAttributeButtonPressedInCell:(MSScionAttributeCell *)cell {
  MSScionAttribute *attribute = [self attributeForCell:cell];
  attribute.favored = !attribute.favored;
  return attribute.favored;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _character.attributes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MSScionAttributeCell *cell =
      [tableView dequeueReusableCellWithIdentifier:kAttributeCellIdentifier];
  [cell setAttribute:_character.attributes[indexPath.row] handler:self];
  return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  return kCellHeight;
}

- (BOOL)tableView:(UITableView *)tableView
    shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable highlighting for dice pool selection.
  return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable selection for dice pool selection.
  return nil;
}

#pragma mark Private Methods

- (MSScionAttribute *)attributeForCell:(UITableViewCell *)cell {
  return _character.attributes[[_table indexPathForCell:cell].row];
}

@end
