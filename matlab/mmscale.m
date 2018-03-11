function [res, par] = mmscale(x, low, high)
    a = (high - low) / (max(x) - min(x));
    b = high - (max(x) * a);
    
    res = x*a + b;
    par = [a, b];
end
