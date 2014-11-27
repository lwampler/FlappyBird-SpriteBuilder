#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here

    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    
    timeSinceObstacle += delta; //time since last obstacle added
    
    if (timeSinceObstacle > 2.0f)   //increment time since last obstacle added
    {
        [self addObstacle];         //add new obstacle
        timeSinceObstacle = 0.0f;   //reset timer
    }
    
}

// put new methods here

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [character flap];
}

@end
