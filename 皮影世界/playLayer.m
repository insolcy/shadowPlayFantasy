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
    bg=[CCSprite spriteWithFile:@"background1.png"];
    bg.position=ccp(winSize.width/2, winSize.height/2);
    [self addChild:bg];
}
//主菜单
-(void)labelShow
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    
    
  	starbutton = [CCMenuItemImage itemWithNormalImage:@"StartTheGame1.png" selectedImage:@"StartTheGame-Down1.png" target:self selector:@selector(onSet:)];
    howbutton = [CCMenuItemImage itemWithNormalImage:@"HowToPlay.png" selectedImage:@"HowToPlay-Down.png" target:self selector:@selector(onSet:)];
    setButton = [CCMenuItemImage itemWithNormalImage:@"Settings1.png" selectedImage:@"Settings1.png" target:self selector:@selector(onSet2:)];
    menu = [CCMenu menuWithItems:starbutton,howbutton,setButton, nil];
	
    
	
	menu.position = ccp(winSize.width/2, 350);
	[menu alignItemsVerticallyWithPadding: 40.0f];
	[self addChild:menu z: 1];


    
}
-(void)addBody
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCSprite *body =[CCSprite spriteWithFile:@"Body.png"];
    body.position=ccp(winSize.width-body.contentSize.width/2,winSize.height/2);
    //大臂
    forearm = [CCSprite spriteWithFile:@"forearm.png"];
    forearm.rotation=-30;
    forearm.position=ccp(winSize.width-forearm.contentSize.width/2+150,winSize.height/2+380);
    forearm.anchorPoint=ccp(0.9,0.9);
    //小臂
    arm =[CCSprite spriteWithFile:@"arm.png"];
    arm.rotation=50;
    arm.anchorPoint=ccp(0.9, 0.9);
    arm.position=ccp(winSize.width-forearm.contentSize.width/2+200,winSize.height/2-70);
    //手
    finger = [CCSprite spriteWithFile:@"finger.png"];
    finger.rotation=30;
    finger.anchorPoint=ccp(0.9,0.9);
    finger.position=ccp(720,180);
    [self addChild:body];
    [self addChild:forearm];
    [self addChild:arm];
    [self addChild:finger];
}

-(void)moveSet:(id)sender
{
    [SceneManager goSet];
}

-(void)onSet2:(id)sender{
    [SceneManager goSet];
}


-(void)onSet:(id)sender{
    
    [self leftButton];
    menu.position =ccp(-400,-400);
    UIImage *background3 = [UIImage imageNamed:@"background3.png"];
    CCTexture2D *newbg=[[CCTextureCache sharedTextureCache]addCGImage:background3.CGImage forKey:nil];
    [bg setTexture:newbg];
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    //大臂动作
    CCAction *action = [CCRotateBy actionWithDuration:2 angle:5];//旋转动作
    [forearm runAction:action];
    //小臂动作
    CCAction *action2 = [CCRotateBy actionWithDuration:2 angle:10];
    CCAction *armAction = [CCMoveTo actionWithDuration:2 position:(ccp(winSize.width-forearm.contentSize.width/2+150,winSize.height/2-85))];
    [arm runAction:armAction];
    [arm runAction:action2];
    //手动作
    CCAction *action3 = [CCRotateBy actionWithDuration:2 angle:30];
    CCAction *fingerAction = [CCMoveTo actionWithDuration:2 position:(ccp(640,220))];
    [finger runAction:fingerAction];
    [finger runAction:action3];
    //设置延迟动作
    //CCDelayTime* waitAction = [CCDelayTime actionWithDuration:2];
    //CCCallFunc* vanishAction = [CCCallFunc actionWithTarget:self selector:@selector(moveSet:)]; //调用removeSprite:方法
    //CCSequence* sequence = [CCSequence actions:waitAction, vanishAction, nil];
    //[self runAction:sequence];
}

//左侧按钮放置
-(void)leftButton
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCMenuItemImage *backButton=[CCMenuItemImage itemWithNormalImage:@"Back.png" selectedImage:@"Back.png" target:self selector:@selector(back:)];
    CCMenuItemImage *nextButton=[CCMenuItemImage itemWithNormalImage:@"Next.png" selectedImage:@"Next.png" target:self selector:@selector(back:)];
    CCMenuItemImage *helpButton=[CCMenuItemImage itemWithNormalImage:@"Help.png" selectedImage:@"Help.png" target:self selector:@selector(back:)];
    CCMenu *menu1 = [CCMenu menuWithItems: nextButton,backButton,helpButton ,nil];
    menu1.position = ccp(backButton.contentSize.width/2,winSize.height/2);
    [menu1 alignItemsVerticallyWithPadding: 20.0f];
    [self addChild: menu1];
}

-(id) init{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self addBG];
    [self labelShow];
    
    [self addBody];
    return self;
}


-(void) back: (id) sender{
    [SceneManager goMenu];
}

@end