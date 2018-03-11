function res = plot_kurz(index, name)
load("roky.mat");
values = cell({rok2013, rok2014, rok2015, rok2016, rok2017});

hold on

for i = 1:length(values)
    val = values{i};  
    plot(1:length(val), val(:, index));
end

hold off

title(sprintf("Cena 1 %s v CZK v letech 2013 - 2017", name));
xlabel("Den v roce");
ylabel(sprintf("1 %s v CZK", name));
legend("2013", "2014", "2015", "2016", "2017");

end

