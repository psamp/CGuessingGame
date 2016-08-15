//
//  main.m
//  GuessingGame
//
//  Created by Princess Sampson on 8/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

int getNumberFromUser(int maxValidChoice);

int main(int argc, const char * argv[]) {
    
    NSNumber *number = @(arc4random_uniform(10));
    NSMutableArray *allGuesses  = [NSMutableArray array];
    bool anyGuessesRight = false;
    
    for (int i = 0; i < 3; i++) {
        
        NSLog(@"I'm thinking of a number 0-9. You're on guess %d/3.", i + 1);
        [allGuesses addObject: @(getNumberFromUser(9))];
    }
    
    for (NSNumber *guess in allGuesses) {
        
        if ([guess isEqual: number]) {
            anyGuessesRight = true;
        }
    }
    
    if (!anyGuessesRight) {
        NSLog(@"Wrong! I'm thinking of %@.", number);
        NSLog(@"You guessed: %@", allGuesses);
    } else {
        NSLog(@"Right! I was thinking of %@.", number);
    }
    
    return 0;
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
