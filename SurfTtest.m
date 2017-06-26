function []=SurfTtest(Gp1,Gp2,Name,G1Name,G2Name,FsgdFName)

mkdir(strcat(cd,'/',Name));
Dest=strcat(cd,'/',Name);
copyfile('FreeSurfGroupTtest.sh',strcat(cd,'/',Name));

G1Subs=char(Gp1);
G2Subs=char(Gp2);

fileID = fopen(strcat(cd,'/',Name,'/',FsgdFName,'.fsgd'),'w');

fprintf(fileID,'GroupDescriptorFile 1\n');
fprintf(fileID,['Class ',G1Name,'\n']);
fprintf(fileID,['Class ',G2Name,'\n']);

for i=1:size(G1Subs,1)
    fprintf(fileID,['Input ',G1Subs(i,:),' ',G1Name,'\n']);
end
for i=1:size(G2Subs,1)
    fprintf(fileID,['Input ',G2Subs(i,:),' ',G2Name,'\n']);
end

fclose(fileID);

fileID = fopen(strcat(cd,'/',Name,'/lh-mean.mtx'),'w');
fprintf(fileID,'1 -1\n');
fclose(fileID);

fileID = fopen(strcat(cd,'/',Name,'/rh-mean.mtx'),'w');
fprintf(fileID,'1 -1\n');
fclose(fileID);

PDir=cd(Dest);


system('chmod +x FreeSurfGroupTtest.sh','-echo');
system(['./FreeSurfGroupTtest.sh ',G1Name,'Vs',G2Name,' ',FsgdFName,'.fsgd'],'-echo');

cd(PDir);

end