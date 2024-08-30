This will be a Raw bitmap of 640x512.

Every frame, this bitmap will be copied directly to the display BRAM.

Instead of 16-bit (15-bit) color, each entry will use 10-bit color (aka arrrgggbbb where a=1 is clear)
The 10-bit color will be raised to fit a 16-bit entry.