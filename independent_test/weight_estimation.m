function [W] = weight_estimation(X, Y, type)

%
% Output: W -- a N*Q weight matrix for two scatter matrixes
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       

if(type <0) type = 5; end
if(type >5) type = 5; end
    
% +1/-1 --> +1/0
YY = (Y+1)/2;

t0=clock;

switch (type)
    case 1
        disp('Binary-based weight form');
        [W] = weight_Park2008_Binary(X, YY);
    case 2
        disp('Entropy-based weight form');
        [W] = weight_Chen2007_Entropy(X, YY);
    case 3
        disp('Correlation-based weight form');
        [W] = weight_Wang2010_Correlation15(X, YY);
    case 4
        disp('Fuzzy-based weight form');
        [W] = weight_Lin2010_Fuzzy(X, YY);
    case 5
        disp('Dependence-based weight form');
        [W] = weight_Xu2017_Dependence(X,YY);
end

t1 = etime(clock,t0);

disp(strcat('Costed time for weight estimation ===== ',num2str(t1)));

end
        
        