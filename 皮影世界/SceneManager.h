//
//  SceneManager.h
//  皮影世界
//
//  Created by lcy on 12-10-23.
//
//

#import "cocos2d.h"
#import "welcomeLayer.h"
#import "playLayer.h"
#import "helpLayer.h"
#import "setLayer.h"

@interface SceneManager : NSObject{
    
}
+(void) goPlay;
+(void) goMenu;
+(void) goSet;
@end
