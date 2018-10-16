clear all; clc;

%prompt for user input as strings
M=input('Please enter the month as MMM (e.g. JAN): ', 's');
D=input('Please enter the day as DD (e.g. 07): ', 's');
Y=input('Please enter the year as YYYY (e.g. 2016): ', 's');
clc;
%peform validity checks on year
YN=str2num(Y);

if length(YN)~=1
    error('Integers only for the year');
elseif YN<0 || YN>9999 || mod(YN,1)~=0
    error('Please enter a year between 1AD and 9999AD');
elseif length(Y)<4 ||length(Y)>4
    error('Please enter a year in YYYY format');
end


%validity on days
DN=str2num(D);

if length(DN)~=1
    error('Numbers only for the DD');
elseif length(D)~=2
    error('Please enter a day in DD format');
end

%validity on months
MN=str2num(M);

if length(M)~=3
    error('Please enter a month in MMM format');
elseif strcmp(M, 'JAN')==0 &&strcmp(M, 'FEB')==0 &&strcmp(M, 'MAR')==0&&strcmp(M, 'APR')==0&&strcmp(M, 'MAY')==0&&strcmp(M, 'JUN')==0&&strcmp(M, 'JUL')==0&&strcmp(M, 'AUG')==0&&strcmp(M, 'SEP')==0&&strcmp(M, 'OCT')==0&&strcmp(M, 'NOV')==0&&strcmp(M, 'DEC')==0
    error('Please enter a valid month');
end

%Account for leap year
leapyear=(mod(YN,4)==0 && mod(YN,100)~=0)||(mod(YN,400)==0);

%Specific month's day allowance
if ((strcmp(M,'JAN')==1|| strcmp(M,'MAR')==1||strcmp(M,'MAY')==1||strcmp(M,'JUL')==1||strcmp(M,'AUG')==1||strcmp(M,'OCT')==1||strcmp(M,'DEC')==1)&&DN>31)||DN<1
    error('Input a valid number of days');
elseif (strcmp(M,'APR')==1 || strcmp(M,'JUN')==1 || strcmp(M,'SEP')==1 || strcmp(M,'NOV'))&&DN>30
    error('Input a valid number of days');
end

%February
if strcmp(M,'FEB')==1 && leapyear==1 && DN>29
    error('Input a valid number of days');
elseif strcmp(M,'FEB')==1 && leapyear==0 &&DN>28
    error('Input a valid number of days');
end



%Create the Algorithm
d=DN;

if strcmp(M,'JAN')==1 || strcmp(M,'FEB')==1
    y=mod(YN-1,100);
    c=floor(YN-1/100);
else
    y=mod(YN,100);
    c=floor(YN/100);
end

%assign month a #

if strcmp(M,'JAN')==1
    MN=1;
elseif strcmp(M,'FEB')==1
    MN=2;
elseif strcmp(M,'MAR')==1
    MN=3;  
elseif strcmp(M,'APR')==1
    MN=4;
elseif strcmp(M,'MAY')==1
    MN=5;
elseif strcmp(M,'JUN')==1
    MN=6;  
elseif strcmp(M,'JUL')==1
    MN=7;
elseif strcmp(M,'AUG')==1
    MN=8;
elseif strcmp(M,'SEP')==1
    MN=9;  
elseif strcmp(M,'OCT')==1
    MN=10;
elseif strcmp(M,'NOV')==1
    MN=11;  
elseif strcmp(M,'DEC')==1
    MN=12;
end

m=mod(MN+9,12)+1;

%Assign a day of the week
front=(d+floor(2.6*m-0.2)+y+floor(y/4)+floor(c/4)-2*c);
w=mod(front,7);


%print result
if w==0
    fprintf('%s %s %s is a Sunday\n',M,D,Y);
elseif w==1
    fprintf('%s %s %s is a Monday\n',M,D,Y);
elseif w==2
    fprintf('%s %s %s is a Tuesday\n',M,D,Y);
elseif w==3
    fprintf('%s %s %s is a Wednesday\n',M,D,Y);
elseif w==4
    fprintf('%s %s %s is a Thursday\n',M,D,Y);
elseif w==5
    fprintf('%s %s %s is a Friday\n',M,D,Y);
elseif w==6
    fprintf('%s %s %s is a Saturday\n',M,D,Y);
end



