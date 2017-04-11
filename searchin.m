function b = searchin(s)
%bi-search

global du;
global su;

L = 1;
R = du;
b = floor((L+R)/2);

while(L <= R)
    if (s > su(b))
        L = b+1;
        b = floor((L+R)/2);
    elseif (s < su(b))
        R = b-1;
        b = floor((L+R)/2);
    elseif (s == su(b))
        return
    end
end
b = -1;    

end

