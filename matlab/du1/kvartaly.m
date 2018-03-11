% Zde pouze nacitame predpripravene promenne s daty kurzu pro jednotlive
% roky.
load("roky.mat");
roky = {rok2013, rok2014, rok2015, rok2016, rok2017};

% Spocitame prumerny kurz pro jednotlive kvartaly.
k1_prumery = [];
k2_prumery = [];
k3_prumery = [];
k4_prumery = [];

% Postupne spocitame prumery za kvartaly za kazdy rok
for i = 1:length(roky)
   rok = roky{i};
   
   kvartal = round(length(rok) / 4);
   
   k1 = rok(1:kvartal, :);
   k2 = rok(1*kvartal:2*kvartal, :);
   k3 = rok(2*kvartal:3*kvartal, :);
   k4 = rok(3*kvartal:end, :);
   
   % Oba kurzy pocitame naraz, neni duvod rozdelovat matice podle sloupecku
   k1_prumery = [k1_prumery; mean(k1)];
   k2_prumery = [k2_prumery; mean(k2)];
   k3_prumery = [k3_prumery; mean(k3)];
   k4_prumery = [k4_prumery; mean(k4)];
end

% Overime hypotezu pro 3. priklad, zde staci porovnat jednotlive kvartaly a
% zjistit, zda pocet TRUE hodnot je nad polovinu.
xx = num2cell(mean(k1_prumery < k3_prumery, 1) > 0.5);
[eur_k1_stat, usd_k1_stat] = xx{:};
disp(sprintf("EUR vyhodne v k1? %d\nUSD vyhodne v k1? %d\n", eur_k1_stat, usd_k1_stat));

prumery = {k1_prumery, k2_prumery, k3_prumery, k4_prumery};
% Pro 4. priklad navic overime kazdy kvartal oproti vsem ostatnim
indexy = [2 3 4; 1 3 4; 1 2 4; 1 2 3];

% Nejprve iterujeme kvartal
for i = 1:length(indexy)
    ity = prumery{i};
    porovnani = indexy(i,:);
    
    % A pak pres vsechny roky, kde kontrolujeme proti prumerum zda je
    % vybrany kvartal lepsi nez vsechny ostatni
    je_lepsi = [1 1];
    for j = 1:length(porovnani)
        jty = prumery{porovnani(j)};
        
        % Opet pouzivame stejny postup jako v 3), a opet pro oba kurzy
        % najednou ve vektorizovane podobe.
        je_lepsi = je_lepsi & mean(ity < jty, 1) > 0.5;        
    end
    
    % Zde vypiseme pokud kvartal prosel testem oproti vsem ostatnim letem.
    % Pokud je takovych vyskytu vice, vypisou se vsechny, coz ale v
    % testovacich datech nenastava.
    if je_lepsi(1)
        disp(sprintf("EUR v kvartalu %d je nejvyhodnejsi", i));
    end
    
    % Opet to same pro USD
    if je_lepsi(2)
        disp(sprintf("USD v kvartalu %d je nejvyhodnejsi", i))
    end
end