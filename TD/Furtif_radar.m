% http://xymaths.free.fr/MathAppli/Furtif/Principe-Radar-Furtif.php#Fig2
clear all;close all
clc;
c=8;
Lx=100;Ly=Lx;
Nx=150;Ny=150;
dx=Lx/Nx;dy=Ly/Ny;
x=linspace(0,Lx,Nx);
y=linspace(0,Ly,Ny);

dt=sqrt(dx^2+dy^2)/(2*c);
nu=1;       % frequence de la source
Temis=2;    % duree d'émission de la source en ms
T=25;
t=[0:dt:T];Nt=length(t);
gax=c^2*dt^2/dx^2;
gay=c^2*dt^2/dy^2;

% Position de la source
sx=round(Lx/2);
sy=round(Ly/5);

u=zeros(Nx,Ny,Nt);


% Obstacle 1
Ox=round(3*Nx/4);Oy=round(Ny/2);%centre

% Obstacle 2
Px=round(Nx/4);Py=round(4*Ny/5);%centre

for k=2:Nt-1
if (k*dt<Temis)
        signal_emis(k+1)=2*sin(2*pi*nu*k*dt);
    else
        signal_emis(k+1)=0;
    end
end

for k=2:Nt-1
    for i=2:Nx-1
        for j=2:Ny-1
            tmp1=u(i-1,j,k)+u(i+1,j,k)-2*u(i,j,k);
            tmp2=u(i,j-1,k)+u(i,j+1,k)-2*u(i,j,k);
            u(i,j,k+1)=2*u(i,j,k)-u(i,j,k-1)+gax*tmp1+gay*tmp2;
        end
    end
    if (k*dt<Temis)
        u(sx,sy,k+1)=2*sin(2*pi*nu*k*dt);
    else
        u(sx,sy,k+1)=0;
    end
    %
    % Obstacle(s) :
    for l=-2:4
        u(Ox-l-4:Ox+l^2+2,Oy+l:Oy+l+2,k+1)=0; 
        u(Px+l:Px+l^2,Py+l:Py+l^2,:)=0; 
    end
    %
    % Reflections parasites:
    u(1,:,k+1)=u(2,:,k);
    u(Nx,:,k+1)=u(Nx-1,:,k);
    u(:,1,k+1)=u(:,2,k);
    u(:,Ny,k+1)=u(:,Ny-1,k);
end

% On dessine la source
u(sx,sy,:)=10;

% On dessine l'obstacle 1
for l=-2:4
    u(Ox-l-4:Ox+l^2+2,Oy+l:Oy+l+2,:)=8; 
end

% On dessine l'obstacle 2
for l=-2:4
    u(Px+l:Px+l^2,Py+l:Py+l^2,:)=10; 
end


fig=figure(1);clf;whitebg('w')
colormap(jet)


MM=[];

for k=1:2:Nt
    
    subplot(211);
    %imagesc(squeeze(u(:,:,k)));
    pcolor(squeeze(u(:,:,k)));
    axis on
    shading interp
    caxis([-0.5 2]);%colorbar
    
    subplot(212),hold on
    pp=plot([1:k]*dt,squeeze(u(sx+3,sy+3,1:k)),'LineWidth',0.1);
    set(pp,'linewidth',3')
    pp=plot(t,zeros(size(t)),'--k');
    set(pp,'linewidth',0.1')
    axis([0 T -0.6 0.6])
    xlabel('Temps [ms]','fontsize',16)
    ylabel('Amplitude','fontsize',16)
    grid on
    %pause(0.01)
    MM=[MM getframe(fig)];
end

%break
%movie2avi(MM,'Onde_Obstacles_Radar.avi')