#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "gameBack.h"
#include "startScreen.h"
#include "pauseScreen.h"
#include "gameOver.h"
#include "winScreen.h"

void initialize();

void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

enum {START, GAME, PAUSE, WIN, LOSE};
int state;

unsigned short buttons;
unsigned short oldButtons;

int areEnemiesAllDead;

int seed;

OBJ_ATTR shadowOAM[128];


int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

void initialize() {
    // set up display control register
    REG_DISPCTL = MODE0 | BGSTART_ENABLE | SPRITE_ENABLE;

    REG_BGSTARTCNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    
    goToStart();
}

void goToStart() {
    //load in the startScreen tiles and map to char and screenblocks
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen/2);
    DMANow(3, startScreenPal, PALETTE, 256);

    // waitForVBlank();

    state = START;

    seed = 0;
}

void start() {

    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        initGame();
        hideSprites();
        goToGame();
    }
}

void goToGame() {
    // load in tiles and map for gameBack
    DMANow(3, gameBackTiles, &CHARBLOCK[0], gameBackTilesLen/2);
    DMANow(3, gameBackMap, &SCREENBLOCK[28], gameBackMapLen/2);
    DMANow(3, gameBackPal, PALETTE, 256);
    

    state = GAME;
}

void game() {

    updateGame();
    drawGame();  

    waitForVBlank();  
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        hideSprites();
        goToPause(); 
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        hideSprites();
        goToLose();

    // one way to win
    } else {
        // check if enemiesRemaining, win if 0 then repopulate to ENEMYCOUNT #
        if (enemiesRemaining == 0) {
            goToWin();
        } 
        if (livesRemaining == 0) {
            goToLose();
        }
    }
}

void goToPause() {
    // load in tiles and map for pauseScreen
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);
    DMANow(3, pauseScreenPal, PALETTE, 256);

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    // load in tiles and map for winScreen
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);
    DMANow(3, winScreenPal, PALETTE, 256);

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // reset enemiesRemaining to equivalent of ENEMYCOUNT
    enemiesRemaining = 25;

    state = WIN;
}

void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {
    // load in tiles and map for gameOver
    DMANow(3, gameOverTiles, &CHARBLOCK[0], gameOverTilesLen/2);
    DMANow(3, gameOverMap, &SCREENBLOCK[28], gameOverMapLen/2);
    DMANow(3, gameOverPal, PALETTE, 256);

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // reset livesRemaining to desired amount
    livesRemaining = 4;

    state = LOSE;
}

void lose() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}