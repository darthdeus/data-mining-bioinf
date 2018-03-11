function [y,d] = decscale(x)
% skalovani do <-1, 1> s co nejvetsimi hodnotami
% y ... vystupni vektor
% d ... cim se skalovalo

d = ceil(log10(max(max(abs(x)))));

% osetreni samych nul
if (abs(d) == Inf)
    d = 1;
end

y = x ./ (10^d);
plot(x, y, 'o', 'MarkerFaceColor', 'g')
end

