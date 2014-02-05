GridMap
=======

Create an image for an electrode grid, and use a bubble plot to display the number of penetrations in each grid hole.

The R-script require an installation of the R package (http://www.r-project.org/). Dowload the files and source both functions.

In addation to the R-functions, BASH scripts are used as simple wrapper to call the tools from the command line. Images are written in eps format to allow an easy editing with image processing software such as Inkscape (http://www.inkscape.org/). Convert them to more handy image formats with the convert tool, e.g. `convert  example_GridLayout.eps example_GridLayout.png`

This is an example of the bare grid layout:

![](example_GridLayout.png?raw=true)

And this example shows an overlaid bubble plot representing the number of penetrations:
![](example_GridMap.png?raw=true)

The scripts are released under the MIT licence, see MIT-LICENSE.txt for details. I do not guarantee that they are free of bugs, on the contrary, I am happy for any bug reports or comments of possible improvements.

