function [res, par] = sdscale(x)
    par = [- mean(x) / std(x), 1 / std(x)];
    res = sdsapply(x, par);
end

function res = sdsapply(x, par)
    res = par(1) + par(2) * x;
end

