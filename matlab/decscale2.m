function X = decscale(y)
power = ceil(log10(max(abs(y))));
X = y * 10 ^ -power