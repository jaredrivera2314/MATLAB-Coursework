%DNA Analysis
%Jared Rivera 804603106

clear all; clc;

%Set counters to see which stop codon is used most
f31=0;
f11=0;
f13=0;

%Call the DNA array
load('chr1_section.mat');

%Determine length of chromosome
bases=length(dna);

%Pre-set an array to hold length data in
lengthvalues=zeros(1,ceil(bases/6));
lv=0;

%Initialize start criteria as false
start=0;

%Loop by 3 through the whole chromosome
for k=1:3:(bases-2)
    
   %Set start criteria for correct codon
       if start==0 &&(dna(k)==1 && dna(k+1)==4 && dna(k+2)==3)
           start=k;
       end
   
   %Set stop criteria for correct codon
   if dna(k)==4 && start~=0
       if dna(k+1)==1 || dna(k+1)==3
           if dna(k+2)==1 || (dna(k+2)==3 && dna(k+1)~=3)
               
                   %Update stop codon counters
                   if dna(k)==4 && dna(k+1)==3 && dna(k+2)==1
                      f31=f31+1;
                   end
                   if dna(k)==4 && dna(k+1)==1 && dna(k+2)==1
                       f11=f11+1;
                   end
                   if dna(k)==4 && dna(k+1)==1 && dna(k+2)==3
                       f13=f13+1;
                   end
               stop=k+2;
    
               
               %Calulate segment length
               slength=stop-start+1;
               
               %Save segment lengths in the array
               if mod(slength,3)==0
                   lv=lv+1;
                   lengthvalues(lv)=slength;
                   start=0;
                   
                  
               end
           end
       end
   end
       
end

%Calculate statistical values
totalsegments=lv;
avglength=mean(lengthvalues(1:lv));
maxlength=max(lengthvalues(1:lv));
minlength=min(lengthvalues(1:lv));

%Print to command window
fprintf('Total protein coding segments: %d\n', totalsegments);
fprintf('Average length: %.2f\n', avglength);
fprintf('Maximum length: %d\n', maxlength);
fprintf('Minimum length: %d\n', minlength);



