//
//  NSString+Hash.h
//
//  Created by Tom Corwine on 5/30/12..
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

//对一个字符串进行base64编码,并且返回
+ (NSString *)base64EncodeString:(NSString *)string;
//对base64编码之后的字符串解码,并且返回
+ (NSString *)base64DecodeString:(NSString *)string;
//字典转成字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dict;
//字符串转字典  
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
