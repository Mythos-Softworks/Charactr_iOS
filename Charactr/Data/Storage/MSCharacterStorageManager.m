#import "MSCharacterStorageManager.h"

static NSString *const kIndexFileName = @"characters.index";

@implementation MSCharacterStorageManager {
  NSMutableArray<MSCharacterStorageObject *> *_characterInfoArray;
  NSMutableDictionary<NSString*, id<MSCharacter>> *_characterSheetDictionary;
}

- (instancetype)init {
  if ((self = [super init])) {
    _characterSheetDictionary = [[NSMutableDictionary alloc] init];
    _characterInfoArray = [self loadCharacterStorageObjects];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveCharacterStorageObjects:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
  }
  return self;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark

- (void)accessedCharacterAtIndex:(NSInteger)index {
  for (NSInteger i = index; i > 0; i--) {
    [_characterInfoArray exchangeObjectAtIndex:i withObjectAtIndex:i-1];
  }
}

- (void)addCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info {
  [_characterInfoArray insertObject:info atIndex:0];
  _characterSheetDictionary[info.filePath] = character;

  [self saveCurrentCharacter];
  [self saveCharacterStorageObjects:nil];
}

- (NSInteger)count {
  return _characterInfoArray.count;
}

- (MSCharacterStorageObject *)characterInfoAtIndex:(NSInteger)index {
  return _characterInfoArray[index];
}

- (id)characterAtIndex:(NSInteger)index {
  NSString *filePath = _characterInfoArray[index].filePath;
  if (!_characterSheetDictionary[filePath]) {
    _characterSheetDictionary[filePath] = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
  }

  return _characterSheetDictionary[filePath];
}

- (void)saveCurrentCharacter {
  MSCharacterStorageObject *storageObject = [_characterInfoArray firstObject];
  NSString *filePath = storageObject.filePath;
  if (storageObject && _characterSheetDictionary[filePath]) {
    [NSKeyedArchiver archiveRootObject:_characterSheetDictionary[filePath]
                                toFile:filePath];
  }
}

#pragma mark Private Methods

- (NSMutableArray *)loadCharacterStorageObjects {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSString *indexFilePath = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), kIndexFileName];
  if ([fileManager fileExistsAtPath:indexFilePath]) {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:indexFilePath];
  } else {
    return [[NSMutableArray alloc] init];
  }
}

- (void)saveCharacterStorageObjects:(NSNotification *)notification {
  NSString *indexFilePath = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), kIndexFileName];
  [NSKeyedArchiver archiveRootObject:_characterInfoArray toFile:indexFilePath];
}

@end
