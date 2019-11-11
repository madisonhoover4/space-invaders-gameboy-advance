#include <stdlib.h>
#include "game.h"
#include <stdio.h>
#include "myLib.h"
#include "gameBack.h"
#include "startScreen.h"
#include "pauseScreen.h"
#include "gameOver.h"
#include "winScreen.h"
#include "spriteSheet.h"

ANISPRITE player;
ANISPRITE enemies[ENEMYCOUNT];
ANISPRITE bullets[BULLETCOUNT];
ANISPRITE enemyBullets[ENEMYBULLETCOUNT];
ANISPRITE healthBar;

int frameCount = 0;
int movingLeft = 0;

int livesRemaining = 4;
int enemiesRemaining = 25;


//----------------------------------------------------------------------------------
// GAME FUNCTIONS

void initGame() {

    // load palette and tiles for spritesheet
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);

    initPlayer();
    initEnemies();
    initBullets();
    initHealth();
    initEnemyBullets();
}

void drawGame() {
    
    for (int i = 0; i < ENEMYCOUNT; i++) {
        drawEnemy(&enemies[i]);
    }

    for (int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }

    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
        drawBullet(&enemyBullets[i]);
    }

    drawHealth(&healthBar);

    drawPlayer();

}

void updateGame() {

    updatePlayer(&player);

    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemies[i]);
    }

    for (int i = 0; i < ENEMYCOUNT; i++) {
        
        if (enemies[i].col == 222) {
            movingLeft = 1;
            for (int i = 0; i < ENEMYCOUNT; i++) {
                enemies[i].row += 2;
                enemies[i].col--;
            }
            break;
        } else if (enemies[i].col == 8) {
            movingLeft = 0;
            for (int i = 0; i < ENEMYCOUNT; i++) {
                enemies[i].row += 2;
                enemies[i].col++;
            }
            break;
        }

    }

    updateEnemyPos();

    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullets(&bullets[i]);
    }

    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
        updateEnemyBullets(&enemyBullets[i], &healthBar);
    }

    frameCount++;

    // handle enemy bullet
    if (frameCount == 100) {
        frameCount = 0;
        // hardcoded for first enemy to fire
        int randEnemyIndex = rand() % ENEMYCOUNT;
        if (enemies[randEnemyIndex].active) {
            fireEnemyBullet(&enemies[randEnemyIndex - 1]);
        }
        enemies[0].shooter = 1;
    }

}

//----------------------------------------------------------------------------------
// PLAYER FUNCTIONS

void initPlayer() {
    player.row = 135;
    player.col = (SCREENWIDTH / 2) - 8;
    player.rdel = 0;
    player.cdel = 2;
    player.width = 16;
    player.height = 16;
    player.aniState = 0; // starts as top left
    player.currFrame = 0; // starts as top left
    player.active = 1;
    player.numFrames = 1;
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 2, player.currFrame * 2) | ATTR2_PALROW(0);
}

void updatePlayer(ANISPRITE *player) {

    // go to the left
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player->col -= player->cdel;
    }

    // go to the right
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player->col += player->cdel;
    }

    // handle bullet firing
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireBullet();
    }

    // player cannot go past right side of screen
    if (player->col + player->width > SCREENWIDTH - 1) {
        player->col = 239 - player->width;
    }

    // player cannot go past left side of screen
    if (player->col < 0) {
        player->col = 0;
    }


}

//----------------------------------------------------------------------------------
// ENEMY FUNCTIONS

void initEnemies() {
    //player is at 0, bullets are at 21 and 41
    // going to start at 100
    // this goes 100 to 125
    int enemyOAMIndex = 101;
    int enemyArrIndex = 0;
    for (int c = 0; c < 5; c++) {
        for (int r = 0; r < 5; r++) {
            enemies[enemyArrIndex].row = r*20 + 10;
            enemies[enemyArrIndex].col = c*35 + 40;
            enemies[enemyArrIndex].rdel = 2;
            enemies[enemyArrIndex].cdel = 1;
            enemies[enemyArrIndex].width = 16;
            enemies[enemyArrIndex].height = 16;
            enemies[enemyArrIndex].aniState = 1; 
            enemies[enemyArrIndex].currFrame = c % 3; // this is what will change when adding more frames
            enemies[enemyArrIndex].active = 1;
            enemies[enemyArrIndex].numFrames = 2;
            enemies[enemyArrIndex].index = enemyOAMIndex;
            enemies[enemyArrIndex].shooter = 0;
            enemyOAMIndex++;
            enemyArrIndex++;
        }
    }
}

void drawEnemy(ANISPRITE* e) {
    if (e->active) {
        shadowOAM[e->index].attr0 = e->row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[e->index].attr1 = e->col | ATTR1_SMALL;
        shadowOAM[e->index].attr2 = ATTR2_TILEID((e->aniState) * 2, (e->currFrame) * 2) | ATTR2_PALROW(0);
    } else {
        shadowOAM[e->index].attr0 = ATTR0_HIDE;
    }
}

void updateEnemy(ANISPRITE* e) {
    if (e->active) {

        // animate the character
        if (e->aniCounter % 20 == 0) {
            if (e->currFrame == 2) {
                e->currFrame = 3;
            } else if (e->currFrame == 3) {
                e->currFrame = 4;
            } else if (e->currFrame == 4) {
                e->currFrame = 2;
            }
        }
        e->aniCounter = e->aniCounter + 1;

        // if there is a collision with player, lose game
        if (collision(e->col, e->row, e->width, e->height, player.col, player.row,
                player.width, player.height)) {
            livesRemaining = 0;
        }
    }
}

void updateEnemyPos() {
    if (frameCount % 10 == 0) {
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].active) {

                if (movingLeft) {
                    enemies[i].col--;
                } else {
                    enemies[i].col++; 
                }
            }
        }
        
    }
}

//----------------------------------------------------------------------------------
// BULLET FUNCTIONS

void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].height = 16;
        bullets[i].width = 16;
        bullets[i].rdel = -2;
        bullets[i].cdel = 0;
        bullets[i].aniState = 2;
        bullets[i].currFrame = 0;
        bullets[i].active = 0;
        bullets[i].numFrames = 1;
        bullets[i].index = i + 21;
    }
}

void initEnemyBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        enemyBullets[i].height = 16;
        enemyBullets[i].width = 16;
        enemyBullets[i].rdel = 2;
        enemyBullets[i].cdel = 0;
        enemyBullets[i].aniState = 2;
        enemyBullets[i].currFrame = 1;
        enemyBullets[i].active = 0;
        enemyBullets[i].numFrames = 1;
        enemyBullets[i].index = i + 41;
    }
}

void drawBullet(ANISPRITE* e) {
    if (e->active) {
        shadowOAM[e->index].attr0 = e->row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[e->index].attr1 = e->col | ATTR1_SMALL;
        shadowOAM[e->index].attr2 = ATTR2_TILEID((e->aniState) * 2, (e->currFrame) * 2) | ATTR2_PALROW(0);
    } else {
        shadowOAM[e->index].attr0 = ATTR0_HIDE;
    }
}

void fireBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!(bullets[i].active)) {
            bullets[i].col = player.col;
            bullets[i].row = player.row;
            bullets[i].active = 1;
            break;
        }
    }
}

void fireEnemyBullet(ANISPRITE* enemy) {
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
        if (!(enemyBullets[i].active)) {
            enemyBullets[i].col = enemy->col;
            enemyBullets[i].row = enemy->row;
            enemyBullets[i].active = 1;
            break;
        }
    }
}

void updateBullets(ANISPRITE* b) {
    if (b->active) {
        b->row += b->rdel;
        if ((b->row) <= 0) {
            b->active = 0;
        }
    

        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (b->active && enemies[i].active && collision(b->col, b->row, b->width, b->height,
                enemies[i].col, enemies[i].row, enemies[i].width, enemies[i].height)) {

                // update enemies remaining    
                enemiesRemaining--;                

                // put bullet back in the pool
                b->active = 0;
                enemies[i].active = 0;

                // THIS DOESN'T WORK
                // if the enemy is a shooter, turn off their enemy bullets
                if (enemies[i].shooter) {
                    enemyBullets[0].active = 0;
                }

            }
        }
    }
}

void updateEnemyBullets(ANISPRITE* b, ANISPRITE* h) {
     if (b->active) {
        b->row += b->rdel;
        if ((b->row) >= 160) {
            b->active = 0;
        }
        
        // enemybullet row + height > 159 then set inactive
        for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
            if (b->active && collision(b->col, b->row, b->width, b->height,
                player.col, player.row, player.width, player.height)) {

                // put bullet back in the pool
                enemyBullets[i].active = 0;
                enemyBullets[i].col = 0;


                // update the score
                livesRemaining--;
                h->currFrame++;
            }
        }
    }
}

//----------------------------------------------------------------------------------
// HEALTH STATUS FUNCTIONS

void initHealth() {
    healthBar.row = 5;
    healthBar.col = 205;
    healthBar.width = 32;
    healthBar.height = 16;
    healthBar.aniState = 2;
    healthBar.currFrame = 0;
    healthBar.active = 1;
    healthBar.index = 100;
}

void drawHealth(ANISPRITE* h) {
    shadowOAM[h->index].attr0 = h->row | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[h->index].attr1 = h->col | ATTR1_MEDIUM;
    shadowOAM[h->index].attr2 = ATTR2_TILEID((h->aniState) * 4, (h->currFrame) * 2) | ATTR2_PALROW(0);
    
}
