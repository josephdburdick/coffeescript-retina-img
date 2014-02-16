# Replacing inline images for retina screens
if (window.devicePixelRatio > 1) 
  $('img').each ->                                 # replace img with class selector to control which images' src get swapped out 
    src = $(this).attr('src')
    pathSplits = src.split('/')                    # slice up url into array
    fileName = pathSplits[pathSplits.length - 1]   # from that array grab the last slice
    fileNameSplit = fileName.split('.')            # that last slice? yeah, slice that by the period (".")
    fileNameSplit[0] += "@2x"                      # append @2x to the first slice (filename) of the new array
    pathSplits.pop()
    pathSplits.push(fileNameSplit.join('.')) # take the original src array and replace the filename with the new filename
    $(this).attr('src', pathSplits.join('/'))      # replace the src attribute of the image with the newly joined retina URL

