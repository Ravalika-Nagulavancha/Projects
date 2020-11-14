function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 16-Nov-2019 12:12:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


obj = VideoReader('real1_20sec.mp4');
vid = read(obj,[1 320]);
frames = obj.NumberOfFrames; %Read the Total number of frames and displyed in command window 
ST='.jpg';

%%ex)readind and writing the 100 frames 

%if u want to change the values means replace upto 1:776
 
Vid1=vid(:,:,:,1);
imshow(Vid1),title('Background Image')
 
 for x = 1:300
%  Sx=num2str(x);
%  Strc=strcat(Sx,ST);
pause(0.01)
 Vid=vid(:,:,:,x);
 axes(handles.axes1), imshow(Vid)
%       cd frames
%       imwrite(Vid,Strc);
%       cd ..  
 end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
obj = VideoReader('real1_20sec.mp4');
vid = read(obj,[1 300]);
frames = obj.NumberOfFrames; %Read the Total number of frames and displyed in command window 
ST='.jpg';

%%ex)readind and writing the 100 frames 

%if u want to change the values means replace upto 1:776

 for x = 1:300
%  Sx=num2str(x);
%  Strc=strcat(Sx,ST);
pause(0.01)
 Vid=vid(:,:,:,x);
 Vid=rgb2gray(Vid);
 axes(handles.axes2), imshow(Vid)
%       cd frames
%       imwrite(Vid,Strc);
%       cd ..  
 end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load struct

for f=1:300
 break
%%ex)readind and writing the 100 frames 

%if u want to change the values means replace upto 1:776
%  Sx=num2str(x);
%  Strc=strcat(Sx,ST);

 Vid=vid(:,:,:,f);
 Vid=rgb2gray(Vid);
 

 %%%% background subtraction
 
  Vid=vid(:,:,:,f)-Vid1; %%% subtracting background
  
  
    [L,numOfvehicles(k-startAt+1)] = bwlabel(Vid,8);
    s  = regionprops(L, 'area');
    sc  = regionprops(L, 'centroid');
    fgh = [];
    cnt = 1;
 for j = 1 : size(s,1)
  if s(j).Area > AREA_THR & ( (sc(j).Centroid(2) < 82) )&  ( (sc(j).Centroid(2)>75))
     fgh(j) = 1;
     cent = sc(j).Centroid;
     L(find(L == j)) = cnt;
      cnt = cnt + 1;
           else
            fgh(j) = 0;
            cent = sc(j).Centroid;
            L(find(L == j)) = 0;
           end
  end
    L1 = L;
    L1 = double(L1 > 0);
    numOfvehicles1(k-startAt+1) = length(find(fgh));
    boundBoxParams = princomp(regionprops(L, 'boundingBox'));
    boundBoxParams_car = princomp(regionprops(L, 'boundingBox','car','r'));
    boundBoxParams_2wheeler = princomp(regionprops(L, 'boundingBox','2 wheeler','b'));
    boundBoxParams_auto = princomp(regionprops(L, 'boundingBox','auto','y'));
    boundBoxParams_bus = princomp(regionprops(L, 'boundingBox','bus/truck','g'));
    fnumvehicles(k-startAt+1) = numOfvehicles1(k-startAt+1);
    maask=uint8(zeros(Nr,Nc));
%labeling moving object                                             
 for nop = 1 : numOfvehicles1(k-startAt+1)
    cc = round(boundBoxParams(nop).BoundingBox);
    plot(cc(1) :(cc(1) + cc(3)-1),cc(2),'r-');
    plot(cc(1) :(cc(1) + cc(3)-1),cc(2) + cc(4),'r-');
    plot(cc(1), cc(2) :(cc(2) + cc(4)-1),'r-');
    plot(cc(1) + cc(3), cc(2) :(cc(2) + cc(4)-1),'r-');
    aspectRatio(1,nop) = cc(3)/cc(4);
    aask(cc(2):cc(2)+cc(4)-1,cc(1):cc(1)+cc(3)-1)=uint8(ones(cc(4),cc(3)));
    Lvec = sum(L1(cc(2) :(cc(2) + cc(4)-1),cc(1) :(cc(1) + cc(3)-1)),1);
 end
    plot([50 310],[180 120],'m');
    plot([105 230],[145 120],'m');
    title(strcat('count : ',num2str(length(track_veh))));
    hold off;
    s  = regionprops(L, 'area');
    sc  = regionprops(L, 'centroid');
    k=[track_veh s.Area];
 
 speed1=(s.Area)./toc;
 
 N2w=length( boundBoxParams_2wheeler);
 
 Nc=length( boundBoxParams_car);
 
 Nb=length( boundBoxParams_bus);
 
 Na=length( boundBoxParams_auto);
 
 
end 

k={a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a77 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97 a98 a99 a100 a101 a102 a103 a104 a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127 a128 a129 a130 a131 a132 a133 a134 a135 a136 a137 a138 a139 a140 a141 a142 a143 a144 a145 a146 a147 a148 a149 a150 a151 a152 a153 a154 a155 a156 a157 a158 a159 a160  a161 a162 a163 a164 a165 a166 a167 a168 a169 a170 a171 a172 a173 a174 a175 a176 a177 a178 a179 a180 a181 a182 a183 a184 a185 a186 a187 a188 a189 a190 a191 a192 a193 a194 a195 a196 a197 a198 a199 a200 a201 a202 a203 a204 a205 a206 a207 a208 a209 a210 a211 a212 a213 a214 a215 a216 a217 a218 a219 a220 a221 a222 a223 a224 a225 a226 a227 a228 a229 a230 a231 a232 a233 a234 a235 a236 a237 a238 a239 a240 a241 a242 a243 a244 a245 a246 a247 a248 a249 a250 a251 a252 a253 a254 a255 a256 a257 a258 a259 a260  a261 a262 a263 a264 a265 a266 a267 a268 a269 a270 a271 a272 a273 a274 a275 a276 a277 a278 a279 a280 a281 a282 a283 a284 a285 a286 a287 a288 a289 a290 a291 a292 a293 a294 a295 a296 a297 a298 a299 a300};
sp=speed(k);

if (sp<=7)
    
    msgbox('Low Speed')
    
elseif (7<=sp<=11)
     msgbox('Average Speed')
elseif (sp>11)
    msgbox('OverSpeed')
    
end
    
for f=1:300
    
  pause(0.01)
  axes(handles.axes3), imshow(k{f})


  set(handles.edit6,'string',sp(f));
% %   end
      
end

VOLUME=0.5*N2w+1*Nc+3*Nb+1*Na;
set(handles.edit1,'string',N2w)
set(handles.edit2,'string',Nc)
set(handles.edit3,'string',Nb)
set(handles.edit4,'string',Na)
total=N2w+Nc+Nb+Na;
set(handles.edit5,'string',total)
set(handles.edit7,'string',VOLUME)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1),imshow([255])
% axes(handles.axes2),imshow([255])
axes(handles.axes3),imshow([255])
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.edit3,'string','')
set(handles.edit4,'string','')
set(handles.edit5,'string','')
set(handles.edit6,'string','')
set(handles.edit7,'string','')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
