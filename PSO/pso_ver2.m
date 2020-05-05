x=x0; % initial population
 v=0.1*x0; % initial velocity
 for i=1:pop
 f0(i,1)=fun(x0(i,:));
 end
 [fmin0,index0]=min(f0);

 pbest=x0; % initial pbest
 gbest=x0(index0,:); % initial gbest
 % pso initialization------------------------------------------------end

 % pso algorithm---------------------------------------------------start
 c1=1.5; c2=2.5;
 ite=1; maxite=1000; tolerance=1;
 while ite<=maxite && tolerance>10^-8

 w=0.1+rand*0.4;
 % pso velocity updates
 for i=1:pop
 for j=1:kk
 v(i,j)=w*v(i,j)+c1*rand*(pbest(i,j)-x(i,j))...
 +c2*rand*(gbest(1,j)-x(i,j));
 end
 end
 % pso position update
 for i=1:pop
 for j=1:kk
 x(i,j)=x(i,j)+v(i,j);
 end
 end
 % handling boundary violations
 for i=1:pop
 for j=1:kk
 if x(i,j)<LB(j)
 x(i,j)=LB(j);
 elseif x(i,j)>UB(j)
 x(i,j)=UB(j);
 end
 end
 end
 % evaluating fitness
 for i=1:pop
 f(i,1)=fun(x(i,:));
 end
 % updating pbest and fitness
 for i=1:pop
 if f(i,1)<f0(i,1)
 pbest(i,:)=x(i,:);
 f0(i,1)=f(i,1);
 end
 end
 [fmin,index]=min(f0); % finding out the best particle
 ffmin(ite,run)=fmin; % storing best fitness
 ffite(run)=ite; % storing iteration count
 % updating gbest and best fitness
 if fmin<fmin0
 gbest=pbest(index,:);
 fmin0=fmin;
 end 

 % calculating tolerance
 if ite>100;
 tolerance=abs(ffmin(ite-100,run)-fmin0);
 end
 % displaying iterative results
 if ite==1
 disp(sprintf('Iteration Best particle Objective fun'));
 end
 disp(sprintf('%8g %8g %8.4f',ite,index,fmin0));
 ite=ite+1;
 end