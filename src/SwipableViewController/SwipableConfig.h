//
//  SwipableConfig_h
//  Pods
//
//  Created by sys on 16/4/17.
//
//

#ifndef SwipableConfig_h
#define SwipableConfig_h

#define TitleColorValue  ((CGFloat)0x80 / (CGFloat)0xFF)

//#define debugdebug
#ifdef debugdebug

#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)

#else

#define debugLog(...)
#define debugMethod()

#endif

#endif /* SwipableConfig_h */
