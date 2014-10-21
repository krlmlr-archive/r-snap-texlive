function X = rdiscr(num,x,p)
%X = RDISCR(num,x,p)
%        Input   num   positive integer or a vector [lig,col] of integers
%                x     vector of real numbers (support points in IR)
%                p     vector of probability weights associated to x
%                      i.e. non-negative real numbers such that sum(p) == 1
%        Output  X     num-vector or a num-matrix of random numbers
%                      chosen from the finite discrete distribution on 
%                      x(1),...,x(n) with probability weights p(1),...,p(n) 
%                      where n == length(x) == length(p)
%
% Renvoie num r�alisations ou une matrice [lig,col] de r�alisations 
% pseudo-i.i.d de la loi discr�te � support fini sur IR dont les 
% points de support sont les composantes du vecteur x, et les poids sont les 
% composantes du vecteur p. Donc x(i) a une probabilit� p(i) d'�tre renvoy�.
%
% La m�thode consiste � �crire l'intervalle [0,1] comme une r�union disjointe
% d'intervalles de longueurs p(1),..., p(n) puis � regarder au quel appartient
% la r�alisation d'une loi uniforme obtenue par un appel � rand. Les valeurs 
% renvoy�es par des appels successifs sont donc pseudo-ind�pendantes. 
% Pour des raisons d'efficacit�, les conditions n�cessaires suivantes ne sont 
% pas contr�l�es par cette fonction :
%  - le nombre de param�tres pass�s est exactement 3
%  - les deux param�tres x et p sont bien des vecteurs et sont de m�me longueur
%  - les composantes de p sont positives ou nulles et leur somme vaut 1
%  - le param�tre num est un entier positif non nul une un couple de ce type
%
% See also PROBADIS.
%
% ### Copyright (C) D. Chafa�, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

% Voir les commentaires dans le code de la fonction probadis.
% Faire 'type probadis' pour cela.
% Le code qui suit pourrait beaucoup gagner en rapidit� sur une machine //
% Il est possible de l'am�liorer en stockant un arbre construit avec les 
% tests utilis�s par les valeurs d�j� g�n�r�es. Il est surtout aussi possible
% d'imiter le code matriciel de la fonction de r�partition inverse binomiale 
% de la fonction qbinom de Stixbox, appel�e par rbinom. Exercice !
%
% D'autres algorithmes sont possibles. Par exemple, on pourrait proc�der
% avec des r�alisations de Bernoulli i.i.d. (obtenues facilement avec rand)
% pour choisir l'intervalle : 
% La probabilit� d'�tre <= x(1) est p(1)
% Sinon, la probabilit� d'�tre <= x(2) est p(2)/sum(p(2:n))
% etc. Nul besoin de commencer par x(1), et l'on peut adapter l'arbre utilis�
% aux poids p(i) de fa�on � faire un nombre de tests optimal. Exercice !

if length(num) == 1
   num = [num 1];
else 
   num = reshape(num,1,2);
end

n = length(x);    % le nombre d'atomes.
U = rand(num);    % r�alisations de loi uniforme sur [0,1].
X = repmat(x(n),num(1),num(2)); % par d�faut, la valeur est la plus grande
for l = 1:num(1) % lignes
for c = 1:num(2) % colonnes
	a = 0; b = p(1);  % [a,b] = sous-inter. de proba p(i) pour l'uniforme.
	for i = 1:n-1 % parcours de tous les sous-intervalles juxtapos�s.
   		if ((U(l,c) >= a) & (U(l,c) < b))
      			X(l,c) = x(i);
      			break; % on a trouv� le bon intervalle, on sort.
   		end
   		a = b; b = b + p(i+1); % on passe � l'intervalle suivant.
	end
end
end
return;
