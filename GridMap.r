#########################################################################
##   Use a bubble plot to visualize the number of penetrations
##   that occurred for each hole in an electrode grid.
##
##     
##   (c) wolf zinke (Feb. 2014)
##
##########################################################################

GridMap = function(MLloc, APloc, grid_rad=7, hemi='R', grid_type='crist72', titl=NULL, filename=NULL)
{
    if(toupper(hemi) == 'L'){  MLloc = MLloc * -1  } # flip M/L direction

    min_rad = 0.1
    size.range = c(min_rad, 0.5)

    if(!is.null(filename)){
        postscript(file=filename , pointsize = 16, ,width = 0.39*30, height = 0.39*30,paper='special', horizontal=F)
#         postscript(file=filename ,paper='a4', horizontal=FALSE)
    }else{
        x11()
    }

    # define grid hole coordinates
    GridLayout(hole_rad=min_rad, grid_rad=grid_rad, hemi=hemi)  # needs to be sourced first

    # combine coordinates to unique identifiers
    got_coor = is.finite(APloc) & is.finite(MLloc)
    IDs = paste(MLloc[got_coor], APloc[got_coor], sep='/')

    # count occurrences of each grid location
    gridhole = table(IDs)
    grid_ids  = names(gridhole)
    coorlst   = strsplit(grid_ids,'/')

    xypos     = matrix(unlist(coorlst), ncol = 2, byrow = TRUE)
    APvals    = as.numeric(xypos[,2])
    MLvals    = as.numeric(xypos[,1])

    penecount = as.numeric(as.vector(gridhole))

    # Calculate the relative radius of each circle
    radarea = sqrt(penecount)
    radii   = (diff(size.range)*(radarea - min(radarea))) / diff(range(radarea)) + size.range[1] # normalize area

    # draw circles scaled according to the number of penetrations
    symbols (MLvals, APvals, circles=radii, add=TRUE, inches=FALSE , bg="black", fg='black',lwd=1.5)

    szpos = penecount >=  max(penecount)/10  # avoid writing numbers into small circles
    text(MLvals[szpos], APvals[szpos], labels=as.character(penecount[szpos]), col="white", cex=0.8)

    # create a legend for circle sizes
    # quick & dirty determination of legend sizes (should be improved some day)
    chose_steps = 1:50
    num_step = (max(penecount)/chose_steps)
    use_step = chose_steps[abs(num_step-5)==min(abs(num_step-5))]
    refsteps = seq(from=use_step,to=max(penecount),by=use_step)
    refsz = sqrt(refsteps)
    refsz = (diff(size.range)*(refsz - min(radarea))) / diff(range(radarea)) + size.range[1] # normalize area
    refsz = rev(refsz)

    symbols(rep(grid_rad+1,length(refsz)), -grid_rad-1+(1:length(refsz)-1), refsz, add=TRUE, inches=FALSE , bg="black", fg='black',lwd=1)

    text(grid_rad+1,   -grid_rad-2.2, "Number of\nPenetrations")
    text(grid_rad+2.2, -grid_rad-1+(1:length(refsz)-1), rev(refsteps))

    if(!is.null(filename)){ dev.off() }

}