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

-(void)labelShow
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    
    
  	CCMenuItemImage *starbutton = [CCMenuItemImage itemWithNormalImage:@"StartTheGame1.png" selectedImage:@"StartTheGame-Down1.png" target:self selector:@selector(onSet:)];
    CCMenuItemImage *howbutton = [CCMenuItemImage itemWithNormalImage:@"HowToPlay.png" selectedImage:@"HowToPlay-Down.png" target:self selector:@selector(onSet:)];
    CCMenuItemImage *setButton = [CCMenuItemImage itemWithNormalImage:@"Settings1.png" selectedImage:@"Settings1.png" target:self selector:@selector(onSet:)];
    CCMenu *menu = [CCMenu menuWithItems:starbutton,howbutton,setButton, nil];
	
    
	
	menu.position = ccp(winSize.width/2, 350);
	[menu alignItemsVerticallyWithPadding: 40.0f];
	[self addChild:menu z: 1];


    
}
-(void)addBody
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCSprite *body =[CCSprite spriteWithFile:@"Body.png"];
    body.position=ccp(winSize.width-body.contentSize.width/2,winSize.height/2);
    [self addChild:body];
}

-(void)onSet:(id)sender{
    [SceneManager goSet];
}

-(id) init{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self addBG];
    [self labelShow];
    [self addBody];
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