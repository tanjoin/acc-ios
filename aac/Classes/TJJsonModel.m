//
//  TJJsonModel.m
//  aac
//

#import "TJJsonModel.h"
#import "JSONValueTransformer+TJ.h"

@implementation TJJsonModel

+ (NSDictionary *)jsonKeyMap
{
  return @{};
}

- (BOOL)isEqual:(id)object
{
  if (object == self) {
    return YES;
  }
  if (!object || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return [self isEqualToJsonModel:object];
}

- (BOOL)isEqualToJsonModel:(TJJsonModel *)jsonModel
{
  if (self == jsonModel) {
    return YES;
  }
  if ([[self toJSONString] isEqualToString:[jsonModel toJSONString]] == NO) {
    return NO;
  }
  return YES;
}

#pragma mark - JSONModel protocol

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  return true;
}

+ (JSONKeyMapper *)keyMapper
{
  NSMutableDictionary *keyMap =  [@{
                                    @"identifier": @"id",
                                    @"descriptionText": @"description"
                                    } mutableCopy];
  [keyMap addEntriesFromDictionary:[self jsonKeyMap]];
  return [JSONKeyMapper baseMapper:[JSONKeyMapper mapperForSnakeCase]
         withModelToJSONExceptions:keyMap];
}

@end
