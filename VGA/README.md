The VGA driver IP is mostly for generating an image. 
Each submodule (bitmap, sprite drawer, etc) is responsible for using the x and y from the VGA driver to determine their own output.
This means each submodule will need to translate x and y to an address. May need to make a universal address generator that can be configured for each submodule.
Each submodule is also responsible for converting their outputs to the expected color format for the VGA driver.

Video driver will be responsible for converting render resolution to output resolution (e.g. 576p renderred upscaled to 720p);
To do this, the x and y will need to be translated from output coordinates to render coordinates