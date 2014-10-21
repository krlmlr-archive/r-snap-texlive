function res = probadis(x,p)
%res = PROBADIS(x,p)
%        Input   x     vector of real numbers (support points in IR)
%                p     vector of probability weights associated to x
%                      i.e. non-negative real numbers such that sum(p) == 1
%        Output  res   random number chosen from the finite discrete 
%                      distribution on x(1),...,x(n) with probability weights
%                      p(1),...,p(n) where n == length(x) == length(p)
%
% Renvoie UNE r�alisation de la loi discr�te � support fini sur IR dont les 
% points de support sont les composantes du vecteur x, et les poids sont les 
% composantes du vecteur p. Donc x(i) a une probabilit� p(i) d'�tre renvoy�.
%
% La m�thode consiste � �crire l'intervalle [0,1] comme une r�union disjointe
% d'intervalles de longueurs p(1),..., p(n) puis � regarder au quel appartient
% la r�alisation d'une loi uniforme obtenue par un appel � rand. Les valeurs 
% renvoy�es par des appels successifs sont donc pseudo-ind�pendantes. 
% Pour des raisons d'efficacit�, les conditions n�cessaires suivantes ne sont 
% pas contr�l�es par cette fonction :
%  - le nombre de param�tres pass�s est exactement 2
%  - les deux param�tres x et p sont bien des vecteurs et sont de m�me longueur
%  - les composantes de p sont positives ou nulles et leur somme vaut 1.
%
% See also RDISCR.
%
% ### Copyright (C) D. Chafa�, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

% On pourrait impl�menter cette fonction de la fa�on suivante :
%
%  INDICES = find(cumsum(p) >= rand);
%  res = x(INDICES(1));
%  return;
%
% Cette m�thode est correcte mais inefficace car elle ne tient pas compte de 
% la monotonie de cumsum(p), ce qui entraine des tests inutiles une fois que
% la valeur critique a �t� franchie. En jargon, c'est un 'firstmatch' qu'il 
% nous faut, pas un 'matchall'. Le nombre de if impliqu�s dans find est 
% toujours �gal � la taille de ce qu'on lui passe en param�tre.
%
% Morale de l'histoire : la bri�vet� d'un code n'assure pas sa performance !
% Et l'abscence de if dans un code ne signifie pas qu'il ne fait pas appel
% indirectement � des if, et encore moins que cela est fait de mani�re 
% optimale ! La fonction find n'est qu'une boucle for contenant un if.
%
% Ci-dessous, nous utilisons une version plus rapide dans le plus pur style
% for-if avec un nombre de if optimal. On pourrait adapter l'ordre des 
% intervalles test�s (et donc l'arbre associ��) aux poids p(i) de fa�on �
% tester d'abord les intervalles les plus probables. Est-ce vraiment mieux ?
% Exercice !

n = length(x);    % le nombre d'atomes.
r = rand;         % une r�alisation de loi uniforme sur [0,1].
a = 0; b = p(1);  % [a,b] = sous-intervalle de proba p(i) pour l'uniforme.
for i = 1:n-1     % parcours de tous les sous-intervalles juxtapos�s.
   if ((r >= a) & (r < b))
      res = x(i);
      return;     % on a trouv� le bon intervalle, on sort.
   end
   a = b; b = b + p(i+1); % on passe � l'intervalle suivant.
end
res = x(n); % le bon intervalle est le dernier.
return;
