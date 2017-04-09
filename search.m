function b = search(nu, s)
%bi-search

global du;
global su;

L = 1;
R = du(nu+1);
b = floor((L+R)/2);
space = su(nu+1,:);

while(L <= R)
    if (s > space(b))
        L = b+1;
        b = floor((L+R)/2);
    elseif (s < space(b))
        R = b-1;
        b = floor((L+R)/2);
    elseif (s == space(b))
        return
    end
end
b = -1;    

end

