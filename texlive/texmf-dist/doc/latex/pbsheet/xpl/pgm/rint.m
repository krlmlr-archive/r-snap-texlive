function X = rint(num,k);
% X = RINT(num,k)
%        Input   num     positive integer or a vector [lig,col] of integers
%                k       positive integer
%        Output  X       num-vector or a num-matrix of random numbers
%                        chosen from uniform distribution on {1,...,k}
%
% Renvoie num r�alisations ou une matrice [lig,col] de r�alisations 
% pseudo-ind�pendantes de la loi uniforme discr�te sur les k premiers 
% entiers non nuls {1,...,k}.
%
% La m�thode consiste � consid�rer la partie enti�re de 1+kU o� U suit une loi
% uniforme sur [0,1]. Cette derni�re s'obtient via la fonction rand, et les
% valeurs renvoy�es par des appels successifs sont donc pseudo-ind�pendantes. 
%
% ### Copyright (C) D. Chafa�, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

if length(num) == 1
   num = [num 1];
end
X = ceil(k * rand(num));
return;
