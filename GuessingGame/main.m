//
//  main.m
//  GuessingGame
//
//  Created by Princess Sampson on 8/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

bool getStringFromUser(char name[], int nameLength);
int getNumberFromUser(int maxValidChoice);
bool play (char name[], NSNumber *number, NSMutableArray *guessesDestination);

int main(int argc, const char * argv[]) {
    
    NSNumber *number = @(arc4random_uniform(10));
    NSMutableArray *allGuesses  = [NSMutableArray array];
    
    NSLog(@"What's your name?");
    char name[30];
    getStringFromUser(name, 30);
    
    bool playing = play(name, number, allGuesses);
    
    while(playing) {
        playing = play(name, number, allGuesses);
    }
    
    return 0;
}

bool play (char name[], NSNumber *number, NSMutableArray *guessesDestination) {
    bool anyGuessesRight = false;
    
    NSLog(@"Hello, %s. I'm thinking of a number 0-9.", name);
    [guessesDestination addObject: @(getNumberFromUser(9))];
    
    for (NSNumber *guess in guessesDestination) {
        
        if ([guess isEqual: number]) {
            anyGuessesRight = true;
        }
    }
    
    if (!anyGuessesRight) {
        NSLog(@"Wrong! You guessed: %@", guessesDestination);
        NSLog(@"Would you like to guess again? Enter 1 for yes, and any other number to quit:");
        
        int guessAgain = getNumberFromUser(1);
        
        switch (guessAgain) {
            case 1: {
                return true;
                break;
            }
            default: {
                break;
            }
        }
        
    } else {
        NSLog(@"Right, %s! I was thinking of %@.", name, number);
    }
    
    return false;
}

bool getStringFromUser(char name[], int nameLength) {
    char *result = NULL;
    
    while (result != name) {
        fpurge(stdin);
        result = fgets(name, nameLength, stdin);
    }
    
    return true;
}

int getNumberFromUser(int maxValidChoice) {
    int choice = 0;
    int numberOfItemsScanned = 0;
    int firstValidChoice = 0;
    
    fpurge(stdin);
    numberOfItemsScanned = scanf("%d", &choice);
    if ((numberOfItemsScanned == 1) && (choice >= firstValidChoice) && (choice <= maxValidChoice)) {
        return choice;
    }
    
    return -1;
}
