clear; close all;

global N;     N = 18;
global ground;
global du;
global su;

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
            jn = searchin(ss);
            H(in,jn) = 1/2;
        end
    end
end

[ground,gvalue] = eigs(H,1,'sa');

ns = 0:N;
ees = zeros(1,N+1);
for n = 0 : N/2
    ees(n+1) = renyi(n);
    ees(N+1-n) = ees(n+1);
end

plot(ns,ees);
title(strcat('N=',int2str(N)));
ylim([0 1.5]);
xlim([0,N]);
ylabel('S_A^{(2)}');
xlabel('L');
legend('S_A^{(2)} - L');

