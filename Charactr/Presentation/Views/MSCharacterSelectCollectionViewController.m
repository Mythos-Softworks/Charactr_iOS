#import "MSCharacterSelectCollectionViewController.h"

#import "MSCharacterCreateCell.h"
#import "MSCharacterCreationViewController.h"
#import "MSCharacterSelectCell.h"
#import "MSCharacterStorageManager.h"
#import "MSScionCharacterSheetViewController.h"

static const CGFloat kCellPadding = 8.0;
static const CGFloat kCellSize = 195.0;
static NSString *const kCreateCellReuseIdentifier =
    @"kCreateCellReuseIdentifier";
static NSString *const kSelectCellReuseIdentifier =
    @"kSelectCellReuseIdentifier";

@interface MSCharacterSelectCollectionViewController ()<MSCharacterCreationDelegate>

@end

@implementation MSCharacterSelectCollectionViewController {
  MSCharacterStorageManager *_characterStorageManager;
  BOOL _showingCharacter;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
  if ((self = [super initWithCollectionViewLayout:layout])) {
    _characterStorageManager = [[MSCharacterStorageManager alloc] init];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.collectionView registerClass:[MSCharacterCreateCell class]
          forCellWithReuseIdentifier:kCreateCellReuseIdentifier];
  [self.collectionView registerClass:[MSCharacterSelectCell class]
          forCellWithReuseIdentifier:kSelectCellReuseIdentifier];
  self.collectionView.backgroundColor = [UIColor grayColor];

  self.navigationItem.title = @"Characters";
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  if (_showingCharacter) {
    [_characterStorageManager saveCurrentCharacter];
    _showingCharacter = NO;
  }

  [self.collectionView reloadData];
}

#pragma mark <MSCharacterCreationDelegate>

- (void)characterCreationCanceled {
  [self dismissViewControllerAnimated:YES completion:nil];
  NSIndexPath *selectedItem = self.collectionView.indexPathsForSelectedItems.firstObject;
  [self.collectionView deselectItemAtIndexPath:selectedItem animated:YES];
}

- (void)createdCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info {
  [_characterStorageManager addCharacter:character info:info];
  [self dismissViewControllerAnimated:YES completion:nil];
  [self presentCharacterSheetForCharacter:character info:info];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  // Available characters, plus option to create.
  return _characterStorageManager.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell;

  if (indexPath.item < _characterStorageManager.count) {
    MSCharacterSelectCell *charCell =
        [collectionView dequeueReusableCellWithReuseIdentifier:kSelectCellReuseIdentifier
                                                  forIndexPath:indexPath];
    [charCell setCharacterInfo:[_characterStorageManager characterInfoAtIndex:indexPath.item]];

    cell = charCell;
  } else {
    MSCharacterCreateCell *newCell = [collectionView
        dequeueReusableCellWithReuseIdentifier:kCreateCellReuseIdentifier
                                  forIndexPath:indexPath];
    cell = newCell;
  }

  return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger index = indexPath.item;
  if (index < _characterStorageManager.count) {
    MSCharacterStorageObject *info = [_characterStorageManager characterInfoAtIndex:index];
    id<MSCharacter> character = [_characterStorageManager characterAtIndex:index];
    [_characterStorageManager accessedCharacterAtIndex:index];
    [self presentCharacterSheetForCharacter:character info:info];
  } else {
    MSCharacterCreationViewController *vc =
        [[MSCharacterCreationViewController alloc] initWithDelegate:self];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nvc animated:YES completion:nil];
  }
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(kCellSize, kCellSize);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(kCellPadding, kCellPadding, kCellPadding, kCellPadding);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return kCellPadding;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return kCellPadding;
}

#pragma mark Private Methods

- (void)presentCharacterSheetForCharacter:(id<MSCharacter>)character
                                     info:(MSCharacterStorageObject *)info {
  UIViewController *vc;

  switch (info.characterType) {
    case kMSCharacterTypeScion:
      vc = [[MSScionCharacterSheetViewController alloc]
          initWithCharacter:(MSScionCharacter *)character
                       info:info];
      break;
  }

  _showingCharacter = YES;
  [self.navigationController pushViewController:vc animated:YES];
}

@end
