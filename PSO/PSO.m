

    inputs = dataInputs6';
    targets = dataOutput';
    
    % Create a Fitting Network
    n = 2;  %hidden layer size
    net = feedforwardnet(n);
    net = configure(net, inputs, targets);
    
    m = length(inputs(:,1));
    o = length(targets(:,1));
    
    kk = m*n + n + n + o;

    for j=1:kk
        LB(1,j) = 0;
        UB(1,j) = 500;
    end

    pop = 14;

    for i=1:pop
        for j =1:kk
            weights(i,j) = LB(1,j)+rand*(UB(1,j)-LB(1,j));
        end
    end

    maxrun = 1;
    for run =1:maxrun
        fun = @(x) fitnessFun(x,n,m,0,net,inputs,targets);
        w0 = weights;


        x = w0;
        v = 0.1*w0;
        for i=1:pop
            f0(i,1) = fun(w0(i,:));
        end

        %for i=1:pop
        %    disp(sprintf('%8g ', f0(i,1)));
        %end


        [fmin0,index0] = min(f0);

        pbest = w0;
        gbest = w0(index0,:);
        w=1;
        wdamp = 0.99;
        c1=1.5; c2=2.0;
        ite=1; maxite=1000; tolerance=1;

        while ite<=maxite && tolerance>10^-8

            
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
                disp(sprintf('Iteration Best_particle Fitness'));
            end
            disp(sprintf('%8g %8g %8.4f',ite,index,fmin0));
            ite=ite+1;
            w=w*wdamp;
        end
        xo=gbest;
        fval=fun(xo);
        xbest(run,:)=xo;
        ybest(run,1)=fun(xo);
        disp(sprintf('****************************************'));
        disp(sprintf(' RUN fval ObFuVa'));
        disp(sprintf('%6g %6g %8.4f %8.4f',run,fval,ybest(run,1)));
    end
       
    disp('Final nn model is net_f')
    net_f = feedforwardnet(n);
    net_f=configure(net_f,inputs,targets);
    [a b]=min(ybest);
    xo=xbest(b,:);
    k=0;
    for i=1:n
        for j=1:m
            k=k+1;
            xi(i,j)=xo(k);
        end
    end
    for i=1:n
        k=k+1;
        xl(i)=xo(k);
        xb1(i,1)=xo(k+n);
    end
    for i=1:o
        k=k+1;
        xb2(i,1)=xo(k);
    end
    net_f.iw{1,1}=xi;
    net_f.lw{2,1}=xl;
    net_f.b{1,1}=xb1;
    net_f.b{2,1}=xb2;
    %Calculation of MSE
    err=sum((net_f(inputs)-targets).^2)/length(net_f(inputs))
    %Regression plot
    plotregression(targets,net_f(inputs))
    
    
    
    
