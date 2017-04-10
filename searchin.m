function b = searchin(s,length,space)
%bi-search

L = 1;
R = length;
b = floor((L+R)/2);

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

