//
//  main.m
//  GuessingGame
//
//  Created by Princess Sampson on 8/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSNumber *number = @(arc4random_uniform(10));
    NSNumber *guess;
    NSMutableArray *previousGuesses;
    NSString *name;
    
    int cNum = -1;
    int numbersScannedIn = -1;
    
    while (numbersScannedIn == -1) {
        numbersScannedIn = scanf("%d", &cNum);
    }
    
    guess = @(cNum);
    
    if (guess == number) {
        NSLog(@"You're right! I'm thinking of %@\n\n", number);
    } else {
    NSLog(@"Wrong! I'm thinking of %@\n\n", number);
    }
    
    
    return 0;
}
