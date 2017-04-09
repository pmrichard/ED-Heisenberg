%generate the spaces of the same magnetization

global D;
global du;
global su;

for s = 0 : D
    nu = numup(s);
    du(nu+1) = du(nu+1)+1;
    su(nu+1,du(nu+1)) = s;
end


