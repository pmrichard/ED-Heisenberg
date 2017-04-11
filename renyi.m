function ee = renyi(n)
%compute renyi entropy for length n.
tic
global N;
global ground;

d = bitshift(1,n);
cd = bitshift(1,N-n);
densa = sparse(d,d);
n1 = 0;  n2 = 0;

for s1 = 0 : d-1
    su1 = numup(s1);
    if su1 <= N/2
        for s2 = 0 : d-1
            su2 = numup(s2);
            if su2 == su1
                for s3 = 0 : cd-1
                    if numup(s3) == N/2-su1
                        a = bitshift(s1,N-n)+s3;
                        b = bitshift(s2,N-n)+s3;
                        ina = searchin(a);  
                        inb = searchin(b);                      
                        densa(s1+1,s2+1) = densa(s1+1,s2+1)+ground(ina)*ground(inb);
                    end
                end
            end
        end
    end
end

densa2 = densa * densa;
ee = trace(densa2);
ee = -log(ee);

toc
end