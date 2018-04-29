//Program to Check Cone Angle Left And Right Phase
//Develop By Kawin Chinpong (kawin7538)





clear;
clf;
scicv_Init();
thresh_num=190;
headcut=10;
bottomcut=50;










S=imread(uigetfile([".png","PNG";".jpg","JPG"]),CV_LOAD_IMAGE_GRAYSCALE);
function [f,m,c]=linefit(x,y)
    n=size(x);
    if n(2)>n(1) then
        n=n(2);
    else
        n=n(1);
    end
    xsum=0;
    ysum=0;
    xysum=0;
    x2sum=0;
    for i=1:n
        xsum=x(i)+xsum;
        ysum=y(i)+ysum;
        x2sum=x(i)*x(i)+x2sum;
        xysum=x(i)*y(i)+xysum;
    end
    m=(n*xysum-xsum*ysum)/(n*x2sum-xsum*xsum);
    c=(x2sum*ysum-xsum*xysum)/(x2sum*n-xsum*xsum);
    for i=1:n
        f(i)=m*x(i)+c;
    end
endfunction
//Plot Image With contour
subplot(221);
matplot(S);
xtitle("Grayscale Image with contour line","X axis","Y axis");
sleep(250);
[thresh,img_bw]=threshold(S,thresh_num,255,THRESH_BINARY);
[img_contours,contours]=findContours(img_bw,CV_RETR_TREE,CV_CHAIN_APPROX_NONE,[0,0]);
temp=size(contours,"r")-1;
sc=zeros(1,temp);
for cnt=1:temp
    cont=contours(cnt);
    sc(cnt)=size(cont(:),2);
end
[maxV,maxI]=max(sc);
if(isempty(maxI)) then
    return ;
end
cont=contours(maxI);
sz=size(S);
temp=sz(1)-cont(:)(2,:);
plot(cont(:)(1,:),temp,'r');
sleep(250);
//Plot Contour Line only
[max_y,dump]=max(temp);
[min_y,dump]=min(temp);
[max_x,dump]=max(cont(:)(1,:));
[min_x,dump]=min(cont(:)(1,:));
disp("Max y");
disp(max_y);
disp("Min Y");
disp(min_y);
disp("Max x");
disp(max_x);
disp("Min x");
disp(min_x);
diff_y=max_y-min_y;
diff_x=max_x-min_x;
subplot(222);
plot(cont(:)(1,:),temp,'r');
xtitle("Contour line without image","X axis","Y axis");
sleep(250);
//Print Contour Left side
btl_y=-1;
for cnt=1:size(temp(:),1)
    //btl_y=temp(cnt)(1,:);
    if(cont(cnt)(1,:)==min_x) then
        btl_y=temp(cnt)(1,:);
    end
    
end
disp("Bottom Left Coordinate (Y,X) ");
disp(btl_y);
disp(min_x);
top_x=-1;
for cnt=1:size(temp(:),1)
    if(temp(cnt)(1,:)==max_y) then
        top_x=cont(cnt)(1,:);
    end
end
disp("Top of Cone Coordinate (Y,X) ");
disp(max_y);
disp(top_x);
graph_left=[];
for cnt=1:size(temp(:),1)
    if(temp(cnt)(1,:)>btl_y+bottomcut&&temp(cnt)(1,:)<max_y-headcut&&cont(cnt)(1,:)<=top_x&&cont(cnt)(1,:)>min_x) then
        graph_left($+1,1)=temp(cnt)(1,:);
        graph_left($,2)=cont(cnt)(1,:);
    end
end
subplot(223);
[yfit1,m,c]=linefit(graph_left(:,2),graph_left(:,1));
disp("Angle Left Side");
disp(atan(m)*180/%pi);
angle_left=atan(m)*180/%pi;
scatter(graph_left(:,2),graph_left(:,1),1,"red");
xtitle("Cone Left Side","X axis","Y axis");
sleep(250);
//Print Contour Right Side
btr_y=-1;
for cnt=1:size(temp(:),1)
    if(cont(cnt)(1,:)==max_x) then
        btr_y=temp(cnt)(1,:);
    end
end
disp("Bottom Right Coordinate (Y,X) ");
disp(btr_y);
disp(max_x);
graph_right=[];
for cnt=1:size(temp(:),1)
    if(temp(cnt)(1,:)>btr_y+bottomcut&&temp(cnt)(1,:)<max_y-headcut&&cont(cnt)(1,:)>=top_x&&cont(cnt)(1,:)<max_x) then
        graph_right($+1,1)=temp(cnt)(1,:);
        graph_right($,2)=cont(cnt)(1,:);
    end
end
subplot(224);
[yfit,m,c]=linefit(graph_right(:,2),graph_right(:,1));
disp("Angle Right Side");
disp(atan(m)*180/%pi);
angle_right=atan(m)*180/%pi;
scatter(graph_right(:,2),graph_right(:,1),1,"red");
xtitle("Cone Right Side","X axis","Y axis");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("");
disp("Angle Left Side");
disp(angle_left);
disp("Angle Right Side");
disp(-angle_right);
messagebox("Left Side = "+string(angle_left)+" and Right Side = "+string(-angle_right),"Angle Left And Right");
