% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function resul=equal(a,b)
% Enter two words 'a' and 'b', and compared whether they are equal

resul=1; %different
if length(char(a))==length(char(b))
    if char(a)==char(b)
        resul=0; %equal
    end
end