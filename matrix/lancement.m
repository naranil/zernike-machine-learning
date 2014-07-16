close all


image=imread('images/D_01_05µs_52mm.tif');    % lecture de l'image choisie, bon vous pouvez changer l'image hein...

% param.zone=[num2str(nom(3)) num2str(nom(4))];

image=double(image);               % conversion du 16-bit en double   
% Détermination du centroïde

fenetreimage = figure('units','normalized',...
    'NumberTitle','off',...
    'OuterPosition',[0 0.5 0.5 0.5],...
    'visible','off',...
'name','Zernike');
imagesc(image);figure(gcf);        % affichage de l'image par Matlab


    fenetreimage;
    
    % Sélection des 3 points pour déterminer le centroïde 
    % -> cliquer 3 fois sur l'image pour choisir les 3 points   
waitforbuttonpress
p1 = get(gca,'CurrentPoint');
waitforbuttonpress
p2 = get(gca,'CurrentPoint');
waitforbuttonpress
p3 = get(gca,'CurrentPoint');

p1 = p1(1,1:2);                     % stockage coordonées point 1
p2 = p2(1,1:2);                     % stockage coordonées point 2
p3 = p3(1,1:2);                     % stockage coordonées point 3



    % Calcul des coordonnées (xc , yc) du centroïde
x1 = p1(1); y1 = p1(2) ; x2 = p2(1) ; y2 = p2(2) ; x3 = p3(1) ; y3 = p3(2) ;

xcn = (x3^2 - x2^2 + y3^2 - y2^2)/2/(y3-y2)  - (x2^2 - x1^2 + y2^2 - y1^2) /2/(y2-y1) ;
xcd = (x2 - x1)/(y2 - y1) - (x3 - x2)/(y3 - y2) ;

xc = -xcn/xcd ;

yc = -(x2 - x1)*xc/(y2-y1) + (x2^2 - x1^2 + y2^2 - y1^2)/2/(y2 - y1) ;

    % Détermination des indices du centroïde dans la matrice image
c = [yc xc] ;
c = round(c) ;


% Normalisation de l'intensité lumineuse

M = max(max(image));
image = 1/M*image;

XCentre = round(xc);
YCentre = round(yc);
Rayon = sqrt((x1-xc)^2+(y1-yc)^2);
VTheta = 0:0.01:2*pi;
XCercle = XCentre + Rayon * cos(VTheta);
YCercle = YCentre + Rayon * sin(VTheta);
hold on
plot(XCercle, YCercle,'r','LineWidth',3)
plot(XCentre, YCentre,'*','LineWidth',5,'Color','g')

%Fenetre de validation
fenetreval = figure('units','normalized',...
    'NumberTitle','off',...
    'OuterPosition',[0 0.3 0.5 0.15],...
    'visible','off',...
'name','Validation');

bouton.valider=uicontrol(fenetreval,...
'style','push',...
'units','normalized',...
'position',[.10 .10 .3 .8],...
'string','Valider',...
'fontweight','bold',...
'foregroundcolor','b',...
'Fontsize',12,...
'fontname','verdana',...
'callback','calculZ');

bouton.recommencer=uicontrol(fenetreval,...
'style','push',...
'units','normalized',...
'position',[.60 .10 .3 .8],...
'string','Recommencer',...
'fontweight','bold',...
'foregroundcolor','b',...
'Fontsize',12,...
'fontname','verdana',...
'callback','lancement');



waitforbuttonpress