feat_vec_rnn=[];
feat_cell={};
labels=[];
files = dir('C:\Users\sarda\Documents\ucla\junior\ece 114\Project\Speech\Machine learning speech project F19-20191028\Machine learning speech project F19 (1)\ece114_speech_data\me\*.wav');
count=1;
for file = files'
    disp(file.name)
    [audio,fs]=audioread(file.name);
    mfccs=v_melcepst(audio,fs);
    feat_cell{count}=mfccs;
count=count+1;
labels=[labels; contains(file.name,'english')];
end
%%
shortest=min(cellfun('size',feat_cell,1));

for ii = 1:length(feat_cell)
    feat_vec_rnn(:,:,ii)=resample(feat_cell{ii},shortest,size(feat_cell{ii},1));
end