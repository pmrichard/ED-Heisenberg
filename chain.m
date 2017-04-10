clear; close all; tic 

global L;   L = 17;
global D;
global du;
global su;
global mineigs;

D = 2^L-1;
du = zeros(1,L+1);
su = zeros(L+1,nchoosek(L,floor(L/2)));
cycle = [(1:L-1),0];
mineigs = zeros(1,L+1);

genmag;
for nu = 0 : L
    space = su(nu+1,:);
    dspace = du(nu+1);
    H = zeros(dspace,dspace);
    for in = 1 : du(nu+1)
        s = space(in);
        for t = 0 : L-1
            j = cycle(t+1);
            if bitget(s,t+1) == bitget(s,j+1)
                H(in,in) = H(in,in)+1/4;
            else
                H(in,in) = H(in,in)-1/4;
                ss = bitxor(s,2^t+2^j);
                jn = search(nu,ss);
                H(in,jn) = 1/2;
            end
        end
    end
    mineigs(nu+1) = eigs(H,1,'sa')/L;
end

mineigs
toc