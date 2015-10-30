function varargout = initialize(varargin)
% INITIALIZE MATLAB code for initialize.fig
%      INITIALIZE, by itself, creates a new INITIALIZE or raises the existing
%      singleton*.
%
%      H = INITIALIZE returns the handle to a new INITIALIZE or the handle to
%      the existing singleton*.
%
%      INITIALIZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITIALIZE.M with the given input arguments.
%
%      INITIALIZE('Property','Value',...) creates a new INITIALIZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before initialize_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to initialize_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help initialize

% Last Modified by GUIDE v2.5 24-Feb-2015 10:47:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @initialize_OpeningFcn, ...
                   'gui_OutputFcn',  @initialize_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before initialize is made visible.
function initialize_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to initialize (see VARARGIN)

% Choose default command line output for initialize
handles.output = hObject;

set(handles.output, 'name', 'Initialization');
set(handles.selCam_ppm, 'value', 1);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes initialize wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = initialize_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in selCam_ppm.
function selCam_ppm_Callback(hObject, eventdata, handles)
% hObject    handle to selCam_ppm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selCam_ppm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selCam_ppm
value = get(handles.selCam_ppm,'value');
switch value
    case 1
        handles.cam.serialNum = 7140;
    case 2
        handles.cam.serialNum = 6816;
    case 3
        handles.cam.serialNum = 7508;
end
names = get(handles.selCam_ppm, 'string');
handles.cam.name = names{value};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function selCam_ppm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selCam_ppm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in initializeCam_pushbutton.
function initializeCam_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to initializeCam_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detect_cam(handles);
        
        
        
