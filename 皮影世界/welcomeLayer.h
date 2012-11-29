//
//  welcomeLayer.h
//  皮影世界
//
//  Created by lcy on 12-11-29.
//
//
#import <GameKit/GameKit.h>
#import "SceneManager.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "cocos2d.h"

@interface welcomeLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCLabelTTF *_label;
}
// When you import this file, you import all the cocos2d classes




// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(void)noNewGame:(id)sender;
-(void)onSet:(id)sender;
@end
