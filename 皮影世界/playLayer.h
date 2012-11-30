//
//  playLayer.h
//  皮影世界
//
//  Created by lcy on 12-11-29.
//
//

#import "cocos2d.h"

#import "SceneManager.h"

@interface playLayer : CCLayer {
    CCSprite *forearm;
    CCSprite *arm;
    CCSprite *finger;
    CCMenuItemImage *starbutton;
    CCMenuItemImage *howbutton;
    CCMenuItemImage *setButton;
    CCMenu *menu;
    CCSprite *bg;
    CCSprite *slider;
    CCMenuItemImage *head1;
    CCMenu *headMenu;
    CCSprite *Stick;
    CCMenu *menu1;

}

-(void)noNewGame:(id)sender;
-(void)onSet:(id)sender;
-(void) back: (id) sender;
-(void)removeButton;
@end