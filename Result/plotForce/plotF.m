function plotF()
    f=fopen('t.txt','r');
    data=fscanf(f,'%f %f %f %f %f %f %f %f %f',[9,inf]); 
    figure; 
    
    for i=1:200:24000
        x1=data(2,i);z1=data(3,i);
        x2=data(4,i);z2=data(5,i);
        fx1=data(6,i)/20;fz1=data(7,i)/20;
        fx2=data(8,i)/20;fz2=data(9,i)/20;
        FX1=data(6,1:i)/20;FZ1=data(7,1:i)/20;
        FX2=data(8,1:i)/20;FZ2=data(9,1:i)/20;
        Z=data(5,1:i);
        hold on;axis([-7 7 -3 5]);grid on;
        xlabel('Z (A)');ylabel('X (A)');
        set(gcf,'Position',[0,0,600,350],'color','w');
        
        plot([-7,7],[0,0],'k-');
        plot([-7,7],[1.42,1.42],'k--')
        plot(Z,FZ2,'r-','linewidth',3);plot(Z,FX2,'b-','linewidth',3);
        rectangle('Position',[z2-0.125,x2-0.125,0.25,0.25],'Curvature',[1,1],'FaceColor','k','EdgeColor','k');
        rectangle('Position',[z1-0.125,x1-0.125,0.25,0.25],'Curvature',[1,1],'FaceColor','k','EdgeColor','k');
        quiver(z2,x2,fz2,0,'r-','linewidth',2);quiver(z2,x2,0,fx2,'b-','linewidth',2);
        quiver(z1,x1,fz1,0,'m-','linewidth',2);quiver(z1,x1,0,fx1,'g-','linewidth',2);

        %pause(0.01);
        if i>23800
            break;
        end
        
        frame=getframe(1);
        im=frame2im(frame);
        [imind,cm]=rgb2ind(im,256);
        if i==1
            imwrite(imind,'force.gif','gif','Loopcount',inf,'Delaytime',0.01);
        else
            imwrite(imind,cm,'force.gif','gif','WriteMode','append');
        end
        hold off;plot(1,1);
    end
end