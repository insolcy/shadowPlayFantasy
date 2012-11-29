//
//  playLayer.m
//  皮影世界
//
//  Created by lcy on 12-11-29.
//
//
#import "PlayLayer.h"

@implementation playLayer
-(void)addBG
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCSprite *bg=[CCSprite spriteWithFile:@"background1.png"];
    bg.position=ccp(winSize.width/2, winSize.height/2);
    [self addChild:bg];
}


-(id) init{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self addBG];
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector: @selector(back:)];
    CCMenu *menu = [CCMenu menuWithItems: back, nil];
    
    menu.position = ccp(160, 150);
    [self addChild: menu];
    
    return self;
}

-(void) back: (id) sender{
    [SceneManager goMenu];
}

@end