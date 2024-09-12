//timing parameters
parameter hactive = 960,
parameter vactive = 720,
parameter hblank = 288,
parameter vblank = 28,
parameter hFront = 48,
parameter vFront = 3,
parameter hBack = 144,
parameter vBack = 21,
parameter hSyncLength = 96,
parameter vSyncLength = 4,
parameter hPolarity = 1, //0 is active high. 1 means invert to active low.
parameter vPolarity = 0,

parameter bitsPerColorOutput = 4, //number of bits per color to VGA port

parameter pixelClk = 49, //49 MHz may end up not using

parameter timerCoordinateWidth = 16, //number of bits per coordinate output by timer. 16 bits is def overload, but fits nicely

//render parameters
parameter renderH = 240,
parameter renderV = 180,
parameter bitsPerColorInput = 4,
parameter bitsPerPixelIn = bitsPerColorInput*3,


//upscale parameters
renderCoordinateWidth = 8,
log2HScale = 2, //aka 4x
log2VScale = 2, //aka 4x
