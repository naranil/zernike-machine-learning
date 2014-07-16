fenetrecentree = figure('units','normalized',...
    'NumberTitle','off',...
    'OuterPosition',[0 0.5 0.5 0.5],...
    'visible','off',...
'name','Zernike');

 load Zern.mat
 
close(fenetreval);
close(fenetreimage);
tic;
N = 701 ;                           % N = taille souhaitée pour la matrice carrée (pour l'instant fixée à 700x700 pixels)
f = (N-1)/2 ;
tic


image2 = zeros(N);                  % image2 : matrice carrée représentant l'image de diffraction centrée
for i=c(1)-f:c(1)+f
    for j=c(2)-f:c(2)+f
        li = i - (c(1)-f) + 1;
        co = j - (c(2)-f) + 1;
        image2(li,co) = image(i,j) ;
    end
end

figure , imagesc(image2);figure(gcf);   % affichage d'image2

%enregistrement du centre


%début de la somme

limn=15;
for n=(0:limn)
    for m =(-n:2:n)
       eval(['param.Zernike(' num2str(n+1) ',' num2str((m+n)/2+1) ')=(n+1)/(pi)*sum(sum(image2.*Zern.n' num2str(n) 'm' num2str(abs(m)) num2str(angle(m)/pi) '))*4/N^2;'])
    end
end
toc
    

        
