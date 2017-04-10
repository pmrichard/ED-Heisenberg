clear; close all;

Min = 4;
Max = 16;

Ns = zeros(1,Max/2-1);
values = zeros(1,Max/2-1);

for N = Min : 2 : Max

D = bitshift(1,N)-1;
d = nchoosek(N,N/2);

du = 0;
su = zeros(1,d);
H = sparse(d,d);
cycle = [(1:N-1),0];

for s = 0 : D
    if numup(s) == N/2
        du = du+1;
        su(du) = s;
    end
end

for in = 1 : du
    s = su(in);
    for s1 = 0 : N-1
        s2 = cycle(s1+1);
        if bitget(s,s1+1) == bitget(s,s2+1)
            H(in,in) = H(in,in)+1/4;
        else
            H(in,in) = H(in,in)-1/4;
            ss = bitxor(s,bitshift(1,s1)+bitshift(1,s2));
            jn = searchin(ss,du,su);
            H(in,jn) = 1/2;
        end
    end
end

Ns(N/2-1) = N;
values(N/2-1) = eigs(H,1,'sa')/N;

end

plot(Ns,values);
ylim([-0.5 -0.42]);
xlim([Min Max]);
ax = axis;
maxy = max(values);
hold on;
plot([ax(1),ax(2)],[maxy,maxy],'r:');


