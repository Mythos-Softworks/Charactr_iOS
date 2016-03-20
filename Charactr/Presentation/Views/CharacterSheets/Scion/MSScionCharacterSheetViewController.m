#import "MSScionCharacterSheetViewController.h"

#import "MSScionAbilitiesDataHandler.h"
#import "MSScionAttributesDataHandler.h"
#import "MSScionCharacterSheetView.h"
#import "MSScionFeaturesDataHandler.h"

@interface MSScionCharacterSheetViewController ()<MSDataHandlerDelegate>

@end

@implementation MSScionCharacterSheetViewController {
  MSScionAttributesDataHandler *_attributesHandler;
  MSScionAbilitiesDataHandler *_abilitiesHandler;
  MSScionFeaturesDataHandler *_featuresHandler;
}

- (instancetype)initWithCharacter:(MSScionCharacter *)character
                             info:(MSCharacterStorageObject *)info {
  if ((self = [super initWithCharacter:character info:info])) {
    _attributesHandler = [[MSScionAttributesDataHandler alloc] initWithCharacter:character];
    _abilitiesHandler = [[MSScionAbilitiesDataHandler alloc] initWithCharacter:character];
    _featuresHandler = [[MSScionFeaturesDataHandler alloc] initWithCharacter:character];
  }
  return self;
}

- (void)loadView {
  self.view = [[MSScionCharacterSheetView alloc] initWithFrame:CGRectZero];
  self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  MSScionCharacterSheetView *view = (MSScionCharacterSheetView *)self.view;
  [_attributesHandler handleDataForTable:view.attributesTableView delegate:self];
  [_abilitiesHandler handleDataForTable:view.abilitiesTableView delegate:self];
  [_featuresHandler handleDataForTable:view.featuresTableView delegate:self];
}

#pragma mark

- (void)infoButtonPressed:(UIBarButtonItem *)infoButton {
  // TODO: Present info screen.
}

#pragma mark <MSDataHandlerDelegate>

- (void)dataHandler:(MSBaseDataHandler *)dataHandler didSelectIndexPath:(NSIndexPath *)indexPath {
  // TODO: Handle selection.
}

@end
