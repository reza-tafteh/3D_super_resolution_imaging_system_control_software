function move_stage(handles, volt)
%% moe_stage: moes the stage to volt*conversionFactor (um)
if size(volt,2) == 1
    volt = [volt volt volt];
end

handles.daqVol(1:3) = volt;
handles.stageDaq.outputSingleScan(handles.daqVol);
handles.stageDaq.wait();

stage_pos_um= volt*4;
stage_pos_mic= ['[' num2str(stage_pos_um(1), '%0.2f') ',' num2str(stage_pos_um(2), '%0.2f') ',' num2str(stage_pos_um(3), '%0.2f') ']'];
msg = ['Stage:' stage_pos_mic ' um'];
handles.msgLog = [handles.msgLog; {msg}];
set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
guidata(handles.output, handles);