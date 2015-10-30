function fig_prop(handles)
a = 2*handles.cam.BeadCutSize+1; 

handles.cam.image = zeros(handles.cam.xPixel, handles.cam.yPixel);
axes(handles.imAxes);
handles.image = image(handles.cam.image); 
set(handles.imAxes, 'xtick', [], 'ytick', []);
set(handles.image, 'CDataMapping', 'scaled');
axis image xy;
switch handles.cam.name
    case 'Alexa647_7140'
        colormap hot; 
    case 'Alexa532_6816'
        colormap winter;
    case 'Tracking_7508'
        colormap jet;
end
     
handles.cam.beadVidImage = zeros(a);
axes(handles.beadVid);
handles.beadVidImage = image(handles.cam.beadVidImage); 
set(handles.beadVid, 'xtick', [], 'ytick', []);
set(handles.beadVidImage, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadVidFitImage = zeros(a);
axes(handles.beadVidFit);
handles.beadVidFitImage = image(handles.cam.beadVidFitImage); 
set(handles.beadVidFit, 'xtick', [], 'ytick', []);
set(handles.beadVidFitImage, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage1 = zeros(a);
axes(handles.beadRec1);
handles.beadRecImage1 = image(handles.cam.beadRecImage1); 
set(handles.beadRec1, 'xtick', [], 'ytick', []);
set(handles.beadRecImage1, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage1 = zeros(a);
axes(handles.beadRecFit1);
handles.beadRecFitImage1 = image(handles.cam.beadRecFitImage1); 
set(handles.beadRecFit1, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage1, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage2 = zeros(a);
axes(handles.beadRec2);
handles.beadRecImage2 = image(handles.cam.beadRecImage2); 
set(handles.beadRec2, 'xtick', [], 'ytick', []);
set(handles.beadRecImage2, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage2 = zeros(a);
axes(handles.beadRecFit2);
handles.beadRecFitImage2 = image(handles.cam.beadRecFitImage2); 
set(handles.beadRecFit2, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage2, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage3 = zeros(a);
axes(handles.beadRec3);
handles.beadRecImage3 = image(handles.cam.beadRecImage3); 
set(handles.beadRec3, 'xtick', [], 'ytick', []);
set(handles.beadRecImage3, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage3 = zeros(a);
axes(handles.beadRecFit3);
handles.beadRecFitImage3 = image(handles.cam.beadRecFitImage3); 
set(handles.beadRecFit3, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage3, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage4 = zeros(a);
axes(handles.beadRec4);
handles.beadRecImage4 = image(handles.cam.beadRecImage4); 
set(handles.beadRec4, 'xtick', [], 'ytick', []);
set(handles.beadRecImage4, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage4 = zeros(a);
axes(handles.beadRecFit4);
handles.beadRecFitImage4 = image(handles.cam.beadRecFitImage4); 
set(handles.beadRecFit4, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage4, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage5 = zeros(a);
axes(handles.beadRec5);
handles.beadRecImage5 = image(handles.cam.beadRecImage5); 
set(handles.beadRec5, 'xtick', [], 'ytick', []);
set(handles.beadRecImage5, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage5 = zeros(a);
axes(handles.beadRecFit5);
handles.beadRecFitImage5 = image(handles.cam.beadRecFitImage5); 
set(handles.beadRecFit5, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage5, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage6 = zeros(a);
axes(handles.beadRec6);
handles.beadRecImage6 = image(handles.cam.beadRecImage6); 
set(handles.beadRec6, 'xtick', [], 'ytick', []);
set(handles.beadRecImage6, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage6 = zeros(a);
axes(handles.beadRecFit6);
handles.beadRecFitImage6 = image(handles.cam.beadRecFitImage6); 
set(handles.beadRecFit6, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage6, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage7 = zeros(a);
axes(handles.beadRec7);
handles.beadRecImage7 = image(handles.cam.beadRecImage7); 
set(handles.beadRec7, 'xtick', [], 'ytick', []);
set(handles.beadRecImage7, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage7 = zeros(a);
axes(handles.beadRecFit7);
handles.beadRecFitImage7 = image(handles.cam.beadRecFitImage7); 
set(handles.beadRecFit7, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage7, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecImage8 = zeros(a);
axes(handles.beadRec8);
handles.beadRecImage8 = image(handles.cam.beadRecImage8); 
set(handles.beadRec8, 'xtick', [], 'ytick', []);
set(handles.beadRecImage8, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

handles.cam.beadRecFitImage8 = zeros(a);
axes(handles.beadRecFit8);
handles.beadRecFitImage8 = image(handles.cam.beadRecFitImage8); 
set(handles.beadRecFit8, 'xtick', [], 'ytick', []);
set(handles.beadRecFitImage8, 'CDataMapping', 'scaled');
colormap hot; axis image xy;

guidata(handles.output, handles);
end

