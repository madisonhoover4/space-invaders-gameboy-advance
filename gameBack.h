
//{{BLOCK(gameBack)

//======================================================================
//
//	gameBack, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 564 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 18048 + 2048 = 20608
//
//	Time-stamp: 2019-10-23, 17:16:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACK_H
#define GRIT_GAMEBACK_H

#define gameBackTilesLen 18048
extern const unsigned short gameBackTiles[9024];

#define gameBackMapLen 2048
extern const unsigned short gameBackMap[1024];

#define gameBackPalLen 512
extern const unsigned short gameBackPal[256];

#endif // GRIT_GAMEBACK_H

//}}BLOCK(gameBack)
