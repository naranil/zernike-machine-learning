N=1001;
%enregistrement du centre
X0=(N+1)/2;
Y0=(N+1)/2;
limmin=0;
limmax=20;

for n=(limmin:limmax)
        if(mod(n,2)==0)
             inf=0;
             mult=1;
        else inf=1;
            mult=-1;
        end
   for m =(inf:2:n)
        Z=zeros((N-1)/2,(N-1)/2);
        Zi=zeros((N-1)/2,(N-1)/2);
        for x=(1:X0)
            for y=(1:Y0)
                r=2/N*sqrt((x-X0)^2+(y-Y0)^2);
                if(r<=1)
                    if(y==Y0&&x<X0)
                        theta=pi;
                    elseif(y==Y0&&x==X0)
                        theta=0;
                    else
                        theta=2*atan((2/N*(y-Y0))/(2/N*(x-X0)+r));
                    end
                Z(x,y)=Vzern(n,mult*m,r,theta);
                Zi(x,y)=Vzern(n,-mult*m,r,theta);
                end
            end
        end
        eval(['Zern.n' num2str(n) 'm' num2str(abs(m)) '=Z;']);
        eval(['Zerni.n' num2str(n) 'm' num2str(abs(m)) '=Zi;']);
        eval(['dlmwrite(''Zernn' num2str(n) 'm' num2str(abs(m)) '0.txt'',Zern.n' num2str(n) 'm' num2str(abs(m)) ',''precision'',9)']);
        eval(['dlmwrite(''Zernn' num2str(n) 'm' num2str(abs(m)) '1.txt'',ZernI.n' num2str(n) 'm' num2str(abs(m)) ',''precision'',9)']);
   end
 end