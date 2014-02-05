GridMap
=======

Create an image for an electrode grid, and use a bubble plot to display the number of penetrations in each grid hole.

The R-scripts require an installation of the R package (http://www.r-project.org/). Dowload the files and source both functions from the command window of R.

In addation to the R-functions, BASH scripts are provided as simple wrapper to call the tools from the command line. Images are written in eps format to allow an easy editing with image processing software such as Inkscape (http://www.inkscape.org/).

To create a bare grid layout from the command line, use for example:

    ./GridLayout  -ttl "bare Grid" -g 0.35 -o example_GridLayout.eps

To create a map of penetration counts from the command line, use for example:

    ./GridMap testlocations_small.dat -ttl "random locations" -o example_GridMap.eps -l

Convert the eps files to more handy image formats with the `convert` tool (ImageMagick is required for this):

    convert  example_GridLayout.eps example_GridLayout.png
    convert  example_GridMap.eps example_GridMap.png

Usage for the grid layout from the command line"

    Usage: GridLayout [options]

    OPTIONS:
            -o     output name of the data file (currently this is an *.eps file)
            -l     left hemisphere (default is right), flips the ML-axis
            -rad   radius in number of grid holes (default is 7 -> 72 holes)
            -typ   layout type, currently only 'crist72' is implemented
            -g     radious of the grid hole (0 < h < 0.5 )
            -ttl   plot title
            -h     display this help information

Usage to plot the number of penetrations:

    Usage: GridMap <coorfile> [options]

          <coorfile> is a ascii text file that contains grid coordinates.
                     Each row corresponds to one coordinate (space delimined)
                     The first column represents M/L coordinates, the second
                     column represents A/P coordinates. No header line is used
                     in this file.

    OPTIONS:
            -o     output name of the data file (currently this is an *.eps file)
            -l     left hemisphere (default is right), flips the ML-axis
            -rad   radius in number of grid holes (default is 7 -> 72 holes)
            -typ   layout type, currently only 'crist72' is implemented
            -ttl   plot title
            -h     display this help information


This is an example of the bare grid layout:

![](example_GridLayout.png?raw=true)

The second example shows an overlaid bubble plot representing the number of penetrations:
![](example_GridMap.png?raw=true)

The scripts are released under the MIT licence, see MIT-LICENSE.txt for details. I do not guarantee that they are free of bugs, on the contrary, I am happy for any bug reports or comments of possible improvements.

