fenetrecentree = figure('units','normalized',...
    'NumberTitle','off',...
    'OuterPosition',[0 0.5 0.5 0.5],...
    'visible','off',...
'name','Zernike');

close(fenetreval);
close(fenetreimage);

N = 701 ;                           % N = taille souhaitée pour la matrice carrée (pour l'instant fixée à 700x700 pixels)
f = (N-1)/2 ;


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
X0=(N+1)/2;
Y0=(N+1)/2;

%début de la somme
j=0;
k=0;
limn=1;
 for n=(0:limn)

    j=j+1;
   for m =(-n:2:n)

        k=k+1;
        
        Z=0;
        for x=(1:N)
            for y=(1:N)
                r=2/N*sqrt((x-X0)^2+(y-Y0)^2);
                if(r<=1)
                    if(y==Y0&&x<X0)
                        theta=pi;
                    elseif(y==Y0&&x==X0)
                        theta=0;
                    else
                    theta=2*atan((2/N*(y-Y0))/(2/N*(x-X0)+r));
                    end
                 Z=Z+image2(x,y)*Vzern(n,m,r,theta);

                end
            end
        end
        
        Zern(j,k)=(n+1)/(pi)*Z*16/N^2;

   end
    Zern
 end

