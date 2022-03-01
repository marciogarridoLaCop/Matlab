function plotStores()
X = [5 40 70];
Y = [20 50 15];
pgon1 = nsidedpoly(5,"Center",[X(1) Y(1)],"sidelength",3);
pgon2 = nsidedpoly(5,"Center",[X(2) Y(2)],"sidelength",3);
pgon3 = nsidedpoly(5,"Center",[X(3) Y(3)],"sidelength",3);
plot([pgon1 pgon2 pgon3])
axis equal
end