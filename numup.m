function nu = numup(s)
%count the number of one in a binary number

nu = 0;

while(s)
    nu = nu + 1;
    s = bitand(s,s-1);
end

