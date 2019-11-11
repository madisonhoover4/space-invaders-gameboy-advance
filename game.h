// sprite struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int numFrames;
    int active;
    int index;
    int shooter;
} ANISPRITE;

//constants
#define ENEMYCOUNT 25
#define BULLETCOUNT 20
#define ENEMYBULLETCOUNT 20

// extern variables
extern ANISPRITE player;
extern ANISPRITE enemies[ENEMYCOUNT];
extern ANISPRITE bullets[BULLETCOUNT];
extern ANISPRITE enemyBullets[ENEMYBULLETCOUNT];
extern ANISPRITE healthBar;
extern int frameCount;
extern int livesRemaining;
extern int enemiesRemaining;
extern int movingLeft;

// prototypes for game functions
void initGame();
void updateGame();
void drawGame();

// prototypes for player (panda)
void initPlayer();
void drawPlayer();
void updatePlayer();

// prototypes for enemies
void initEnemies();
void drawEnemy();
void updateEnemy(ANISPRITE* e);
void updateEnemyPos();

// prototypes for bullets
void initBullets();
void initEnemyBullets();
void drawBullet();
void fireBullet();
void fireEnemyBullet(ANISPRITE* enemy);
void updateBullets(ANISPRITE* b);
void updateEnemyBullets(ANISPRITE* b, ANISPRITE* h);

// prototypes for health
void drawHealth();