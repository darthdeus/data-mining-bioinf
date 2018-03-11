function [y] = dsapply(x,par)
%skalovani podle zadaneho parametru

if ((par == 0) || (abs(par) == Inf))
    par = 1;
end
y = x ./ par;
plot(x, y, 'o', 'MarkerFaceColor', 'g')
end

