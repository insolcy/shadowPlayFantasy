//
//  welcomeLayer.m
//  皮影世界
//
//  Created by lcy on 12-11-29.
//
//

#import "welcomeLayer.h"

@implementation welcomeLayer
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	welcomeLayer *layer = [welcomeLayer  node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(void)addBG
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCSprite *bg=[CCSprite spriteWithFile:@"background2.png"];
    bg.position=ccp(winSize.width/2, winSize.height/2);
    [self addChild:bg];
}

-(void)labelShow
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    
    
  	CCMenuItemImage *starbutton = [CCMenuItemImage itemWithNormalImage:@"start1.png" selectedImage:@"start-down1.png" target:self selector: @selector(onNewGame:)];
		CCMenu *menu = [CCMenu menuWithItems:starbutton, nil];
	
    
	
	menu.position = ccp(winSize.width/2, 250);
	[menu alignItemsVerticallyWithPadding: 40.0f];
	[self addChild:menu z: 1];
    CCMenuItemImage *setButton = [CCMenuItemImage itemWithNormalImage:@"Settings1.png" selectedImage:@"Settings1.png" target:self selector:@selector(onSet:)];
    CCMenu *menu1 = [CCMenu menuWithItems:setButton, nil];
    
    menu1.position=ccp(winSize.width-setButton.contentSize.width/2, setButton.contentSize.height/2);
    [menu1 alignItemsVerticallyWithPadding: 40.0f];

    [self addChild:menu1 z: 1];
    
}

-(void)onNewGame:(id)sender{
    [SceneManager goPlay];
}
-(void)onSet:(id)sender{
    [SceneManager goSet];
}



// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        [self addBG];
        [self labelShow];
        
        
        
	}
	return self;
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end
