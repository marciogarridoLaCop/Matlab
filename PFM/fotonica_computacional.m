clc;
clear all;
%==========================================================================
ref01 = 0; 
ref02 = 0;
ref03 = 0;
%==========================================================================
qtd_cam = 3;
mtx_cam = zeros(qtd_cam,2);
mtx_cam = [20 3.55; 1 3.6; 20 3.55];
np = 500;
comp_total = sum(mtx_cam(:,1));
%comp_onda = 1;
%==========================================================================
d = min(mtx_cam(:,1));
li = 0.2;
lf = 5;
qtd_lbd = 50;
inc = lf/qtd_lbd;
lambidas = li:inc:lf;
lambida_inv = d./lambidas;
%==========================================================================
for wt= 1:1:length(lambidas)
    
A1 = -2*eye(np)+diag(ones(np-1,1),1)+diag(ones(np-1,1),-1);
deltax = sum(mtx_cam(:,1)/(np-1));
A11 = (1/deltax^2)*A1;

k_zero = 2*pi()/(lambidas(wt));
kz = k_zero^2;
index = mtx_cam(:,2).^2;
index2 = kz.*index;
qtd_pontos = round(np.*mtx_cam(:,1)/comp_total)';
A2 = diag(repelem(index2,qtd_pontos));

A = A11 + A2;
%==========================================================================
B = kz*eye(np);
%==========================================================================
[L,H] = eig(A,B);
raiz = sqrt(H);
neff = diag(raiz);
%==========================================================================
filtro = mtx_cam(:,2);
aux = min(filtro);
aux2 = max(filtro);
col(1,1) = 1;
u=1;
for iw=1:np;
     if((neff(iw)> aux) && (neff(iw)< aux2))
            Get(wt,u) = neff(iw);
            E(:,col) = L(:,iw);
            u = u+1;
            col = col+1;
     end
%     if wt==1 && u>1
%             ref01=u-1;
%             Get2=Get(1,:);
%     end    
%     if  wt~=1 && u>1
%         ref02 = u-1;
%         ref03 = ref01-ref02;
%     end    
%     if ref03 == 0 && u>1
%        Get2=Get;
%     end      
%     if  ref03~=0 && u>1
%         Get2(wt,((ref03+1):ref01))= Get(wt,(1:ref02));
%     end
 end
end
     if u==1
              wag(1,gt)= wt;
              gt=gt+1;
     end
if (li==lf) 
     wt=length(lambida);
      end 

qnt_clns=ref01;

qnt_lnhs=length(Get2(:,qnt_clns));

ds = sort(lambida_inv,'descend'); % ordena os elementos do vetor em ordem decrescente

if length(Get)~=length(lambida_inv)
    for qw=1:1:length(wag)
        dfg=wag(1,qw);
        ds(dfg)=[]; 
    end
end
  
figure (1)
hold all
for d=qnt_clns:-1:1
     plot (ds,Get2(:,d),'LineWidth',2);
end
axis([0 lf mtx_cam(1,2) mtx_cam(2,2)])
title ('Modos de Propaga¡?o TE')
xlabel ('d/\lambda')
ylabel ('’ndice de Refra¡?o Efetivo (\eta)')
grid on





  

