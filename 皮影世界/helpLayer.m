//
//  helpLayer.m
//  皮影世界
//
//  Created by lcy on 12-11-29.
//
//

#import "helpLayer.h"

@implementation helpLayer
-(id) init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
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
