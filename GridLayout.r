#########################################################################
##   Create a layout scheme for an electrode grid.
##
##
##   (c) wolf zinke (Feb. 2014)
##
##
##  ToDo:  - Use other layouts in addition to the crist grid with 72 holes
##
##########################################################################

GridLayout = function(grid_rad=7, hole_rad=0.4, hemi='R', grid_type='crist72', filename=NULL)
{
    if(!is.null(filename)){
        postscript(file=filename , pointsize = 16, ,width = 0.39*30, height = 0.39*30,paper='special', horizontal=F) }

    # create tick mark labels (quick & dirty)
    gridvec = -grid_rad:grid_rad
    APlbl = paste('A',gridvec,sep='')
    APlbl = gsub("A-",'P',APlbl)
    APlbl = gsub("A0",'0',APlbl)

    MLlbl = paste('L',gridvec,sep='')
    MLlbl = gsub("L-",'M',MLlbl)
    MLlbl = gsub("L0",'0',MLlbl)

    # swap M/L label depending on hemisphere
    if(toupper(hemi) == 'R'){
        lbls = c('M', 'L', 'P', 'A')
    }else{
        lbls = c('L', 'M', 'P', 'A')
        MLlbl = rev(MLlbl)
    }

    grid_pos = -grid_rad:grid_rad
    grid_x = c()
    grid_y = c()

    odia = grid_rad+1 # radius to draw cylinder
    plot_range = c(-odia-2, odia+2)
    lblpos=odia+1

    # determine grid layout
    if(grid_type == 'crist72'){
        for(i in grid_pos){
            for(j in grid_pos){
            if(i^2+j^2 < 7.5^2){
                grid_x = c(grid_x, i)
                grid_y = c(grid_y, j)
        }}}
    }else{ stop("Other layout options not implemented yet!") }

    # plot chamber and grid
    plot(0,0,asp=1, xlim=plot_range, ylim=plot_range, type='n', axes = T, xlab = "medio-lateral axis", ylab = 'anterio-posterior axis', bty="n", xaxs='i', yaxs='i', yaxt="n", xaxt="n")

    axis(1, at=gridvec,labels=MLlbl)
    axis(2, at=gridvec,labels=APlbl)

    lines(x=c(0, 0), y=c(-odia, odia), col='lightgrey', lty=1, lwd=1)
    lines(x=c(-odia, odia), y=c(0, 0), col='lightgrey', lty=1, lwd=1)

    # ok, I know, one would be enough...
    symbols (0,0, circles=odia, add=TRUE, inches=FALSE, fg='black',     lwd=8)
    symbols (0,0, circles=odia, add=TRUE, inches=FALSE, fg='darkgrey',  lwd=6)
    symbols (0,0, circles=odia, add=TRUE, inches=FALSE, fg='grey',      lwd=4)
    symbols (0,0, circles=odia, add=TRUE, inches=FALSE, fg='lightgrey', lwd=2)
    symbols (0,0, circles=odia, add=TRUE, inches=FALSE, fg='white',     lwd=1)

    symbols (grid_x, grid_y, circles=rep(hole_rad,length(grid_y)), add=TRUE, inches=FALSE, fg='darkgrey',lwd=1.5)

    text(x = c(-lblpos, lblpos, 0, 0), y = c(0,0,-lblpos, lblpos), labels = lbls, cex = 1.5)

    if(!is.null(filename)){ dev.off() }

}

