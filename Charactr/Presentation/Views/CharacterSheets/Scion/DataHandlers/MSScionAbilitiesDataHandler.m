#import "MSScionAbilitiesDataHandler.h"

#import "MSScionAbilityCell.h"

static NSString *const kAbilityCellIdentifier = @"kAbilityCellIdentifier";

@interface MSScionAbilitiesDataHandler ()<MSScionAbilityHandler>

@end

@implementation MSScionAbilitiesDataHandler

- (void)handleDataForTable:(UITableView *)table delegate:(id<MSDataHandlerDelegate>)delegate {
  [super handleDataForTable:table delegate:delegate];

  [table registerClass:[MSScionAbilityCell class]
      forCellReuseIdentifier:kAbilityCellIdentifier];
}

#pragma mark <MSScionAbilityHandler>

- (NSInteger)abilityIncrementButtonPressedInCell:(MSScionAbilityCell *)cell {
  MSScionAbility *ability = [self abilityForCell:cell];
  ability.value++;
  return ability.value;
}

- (NSInteger)abilityDecrementButtonPressedInCell:(MSScionAbilityCell *)cell {
  MSScionAbility *ability = [self abilityForCell:cell];
  ability.value--;
  return ability.value;
}

- (BOOL)favoredAbilityButtonPressedInCell:(MSScionAbilityCell *)cell {
  NSInteger cellIndex = [_table indexPathForCell:cell].row;
  MSScionAbility *ability = _character.abilities[cellIndex];
  if (ability.parentAbility) return ability.favored;

  ability.favored = !ability.favored;

  if (ability.expandable) {
    for (NSInteger i = cellIndex + 1;
         i < _character.abilities.count && _character.abilities[i].parentAbility;
         i++) {
      MSScionAbilityCell *subcell = (MSScionAbilityCell *)
          [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
      [subcell setAbility:_character.abilities[i] handler:self];
    }
  }

  return ability.favored;
}

- (void)addAbilityButtonPressedInCell:(MSScionAbilityCell *)cell {
  UIAlertController *alert =
      [UIAlertController alertControllerWithTitle:@"Add specialty"
                                          message:@"Enter specialty name."
                                   preferredStyle:UIAlertControllerStyleAlert];
  [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.placeholder = @"e.g. Electronics";
  }];

  [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                            style:UIAlertActionStyleCancel
                                          handler:^(UIAlertAction *action){}]];

  __weak UIAlertController *weakAlert = alert;
  NSInteger index = [_table indexPathForCell:cell].row;
  __weak NSMutableArray *abilities = _character.abilities;
  __weak MSScionAbility *parentAbility = abilities[index];
  index++;
  __weak UITableView *table = _table;
  [alert addAction:[UIAlertAction actionWithTitle:@"OK"
      style:UIAlertActionStyleDefault
      handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = weakAlert.textFields.firstObject;

        if (textField.text.length) {
          [abilities insertObject:[[MSScionAbility alloc] initWithName:textField.text
                                                         parentAbility:parentAbility]
                          atIndex:index];
          [table insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:index
                                                              inSection:0] ]
                       withRowAnimation:UITableViewRowAnimationAutomatic];
        }
      }]];

  [_delegate presentViewController:alert animated:YES completion:^{
    alert.preferredAction = alert.actions.lastObject;
  }];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _character.abilities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MSScionAbilityCell *cell =
      [tableView dequeueReusableCellWithIdentifier:kAbilityCellIdentifier];
  [cell setAbility:_character.abilities[indexPath.row] handler:self];
  return cell;
}

#pragma mark <UITableViewDelegate>

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable highlighting for dice pool selection.
  return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable selection for dice pool selection.
  return nil;
}

#pragma mark Private Methods

- (MSScionAbility *)abilityForCell:(UITableViewCell *)cell {
  return _character.abilities[[_table indexPathForCell:cell].row];
}

@end
