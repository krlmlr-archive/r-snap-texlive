%
% ### Copyright (C) D. Chafa�, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%
% Ce bout de code permet de simuler une loi binomiale B(n,p) et de comparer 
% graphiquement les moyennes empiriques avec la moyenne th�orique.
% Tous les vecteurs sont des vecteurs ligne.
%
% Nota bene : la biblioth�que Stixbox fournit la fonction rbinom qui permet 
% de s'affranchir des calculs d�taill�s ici, cf. fin du pr�sent fichier.
%
clear r n p q P Q C B X
clf
%
r = input('Nombre maximal de r�alisations ? = ');
n = input('Taille n de la loi binomiale B(n,p), qui a n+1 atomes ? = ');
p = input('Valeur du param�tre p de la loi binomiale B(n,p) ? = ');
% p = proba de gagner � pile ou face = proba de 1 dans la Bernoulli sur {0,1}
% q = proba de perdre � pile ou face = proba de 0 dans la Bernoulli sur {0,1}
% B(n,p) est la loi de la somme de n v.a. i.i.d. de Bernoulli de ce type,
% i.e. la ni�me puissance de convolution de cette loi de Bernoulli. Elle 
% repr�sente la loi du nombre de succ�s � pile ou face en n lanc�s.
%
disp(sprintf('Calcul de la loi binomiale B(%d,%f)',n,p))
q = 1 - p;
P = [1 , cumprod(p * ones(1,n))];              % puissances croissantes de p
Q = [fliplr(cumprod(q * ones(1,n))), 1];       % puissances d�croissantes de q
C = [1 , cumprod([n:-1:1]) ./ cumprod([1:n])]; % coef. du bin�me de i = 1 � n
B = C .* P .* Q;                               % vecteur des poids de B(n,p)
%
disp(sprintf('G�n�ration al�atoire de %d r�alisations de B(%d,%f)',r,n,p))
X = rdiscr([1,r],[0:n],B);                     % �chantillonnage
% alternative :
%X=[]
%for i=1:r
%	X = [X probadis([0:n],B)];
%end
%
disp(sprintf('Trac� des graphique.'))
plot(cumsum(X) ./ [1:length(X)],'b')           % trac� des moyennes empiriques
title('Loi des Grands Nombres')
xlabel('Nombre de realisations')
ylabel('Moyennes empiriques')
hold on
plot(n * p * ones(1,r),'r--')                  % trac� de la moyenne th�orique
legend('Empirique','Theorique')
hold off
%
% Avec Stixbox, inutile de calculer B et d'appeler rdiscr([1,r],[0:n],B) 
% puisque qu'un simple rbinom([1,r],n,p) suffit.  
% M�me si l'on d�cide d'utiliser quand m�me prodadis, les coefficients 
% binomiaux n�cessaires au calcul de B peuvent se calculer beaucoup plus vite 
% en utilisant la fonction Stixbox bincoef qui fait appel � la fonction gamma.
%
