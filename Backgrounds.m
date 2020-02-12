
clear camera
%%

 detector = vision.CascadeObjectDetector();
 
%%
camera = webcam();
blob = vision.BlobAnalysis('MinimumBlobArea',2000);
videoplayer= vision.DeployableVideoPlayer();
 
%%
while true
   image = snapshot(camera);
   mask = step(detector,rgb2gray(image));
   [~,~,bbox] = step(blob,mask);
   J = insertShape(image,'rectangle',bbox);
   step(videoplayer,J);
    
    
    
end
