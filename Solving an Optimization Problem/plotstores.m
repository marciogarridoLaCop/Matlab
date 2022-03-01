function plotStores(x,y)
X = [];
Y = [];
X=x;
Y=y;
    for i=1:length(x)
    pgon(i) = nsidedpoly(5,"Center",[X(i) Y(i)],"sidelength",3);
    end
plot(pgon)
axis equal
end