

i = Import["Images/1.JPG"]

(*Detect the edges of the barcode*)
corners = ImageCorners[i, 3, .01, 5]

(*Find where we need to crop the photo*)
minX = Min[corners[[;; , 1]]]
maxX = Max[corners[[;; , 1]]]
minY = Min[corners[[;; , 2]]]
maxY = Max[corners[[;; , 2]]]

(*Crop the photo, and split it into 10 pieces*)
z = ImageTrim[i, {{minX, minY}, {maxX, maxY}}]
imageData = ImagePartition[z, Scaled[{1/10, 1}]][[1, ;;]]

quantifyBar[x_] := Total[ImageMeasurements[x, "Mean"]]
classifyBar[x_] := If[x < 1.75, 1, 0]
halve[x_] := ImagePartition[x, Scaled[{1/2, 1}]][[1, ;;]]

(*These are the only relevant pieces of our barcode vector*)
relevantData = imageData[[{2, 3, 4, 6, 7, 8, 9, 10}]]

For[x = 1, x <= 8, x++,
 Print[classifyBar[quantifyBar[halve[relevantData[[x]]][[1]]]]]]

(*For[x = 1, x < Length[imageData] + 1, x++,
 Print[classifyBar[quantifyBar[imageData[[x]]]]]]*)

(*For[x = 1, x < Length[imageData] + 1, x++,
 Print[{classifyBar[quantifyBar[imageData[[x]]]],
   quantifyBar[imageData[[x]]]}]]*)
