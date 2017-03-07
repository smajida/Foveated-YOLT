function [sigmas,class1,class2,class3,class4,class5,score1,score2,score3,score4,score5,detections1,detections2,detections3,detections4,detections5] = parse_detections(detections_file)
detections_ = tdfread(detections_file,';');

detections1=zeros(length(detections_.x1),4);
detections2=zeros(length(detections_.x2),4);
detections3=zeros(length(detections_.x3),4);
detections4=zeros(length(detections_.x4),4);

sigmas=detections_.sigma;

class1=detections_.class1;
class2=detections_.class2;
class3=detections_.class3;
class4=detections_.class4;
class5=detections_.class5;


score1=detections_.score1;
score2=detections_.score2;
score3=detections_.score3;
score4=detections_.score4;
score5=detections_.score5;


for i=1:length(detections_.x1)
    detections1(i,1)=detections_.x1(i);
    detections1(i,2)=detections_.y1(i);
    detections1(i,3)=detections_.w1(i);
    detections1(i,4)=detections_.h1(i);
    
    detections2(i,1)=detections_.x2(i);
    detections2(i,2)=detections_.y2(i);
    detections2(i,3)=detections_.w2(i);
    detections2(i,4)=detections_.h2(i);
    
    detections3(i,1)=detections_.x3(i);
    detections3(i,2)=detections_.y3(i);
    detections3(i,3)=detections_.w3(i);
    detections3(i,4)=detections_.h3(i);
    
    detections4(i,1)=detections_.x4(i);
    detections4(i,2)=detections_.y4(i);
    detections4(i,3)=detections_.w4(i);
    detections4(i,4)=detections_.h4(i);
    
    detections5(i,1)=detections_.x5(i);
    detections5(i,2)=detections_.y5(i);
    detections5(i,3)=detections_.w5(i);
    detections5(i,4)=detections_.h5(i);
end
