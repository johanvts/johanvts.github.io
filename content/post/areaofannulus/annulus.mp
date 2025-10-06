outputformat:= "svg";
outputtemplate := "%j_%c.%o";
hppp := 0.25;
vppp := 0.25;

  u := 5cm;

  beginfig(0);
    fill fullcircle scaled 6cm withcolor 0.4 [red,white];
    unfill fullcircle scaled u;
    draw fullcircle scaled u;
    draw fullcircle scaled 6cm;

    z1 = ((0,0)--(0,u)) intersectionpoint (fullcircle scaled u);
    z2 = ((-u,y1)--(u,y1)) intersectionpoint (subpath (50,170) of fullcircle scaled 6cm);
    label.lrt("r",z1);
    label.ulft("R",z2);

    drawarrow origin--z1;
    drawarrow origin--z2;


  endfig;
    

    beginfig(1);
    fill (halfcircle--cycle) scaled 6cm withcolor 0.4 [red,white];
    unfill fullcircle scaled u;
    draw halfcircle scaled u;
    draw halfcircle scaled 6cm;

    z1 = ((0,0)--(0,u)) intersectionpoint (fullcircle scaled u);
    z2 = ((-u,y1)--(u,y1)) intersectionpoint (subpath (50,170) of fullcircle scaled 6cm);

    draw z2--((-u,y1)--(u,y1)) intersectionpoint (fullcircle scaled 6cm);

    label.top("t",z1);

      setbounds currentpicture to (-0.8u,0)--(0.8u,0)--(0.8u,0.8u)--(-0.8u,0.8u)--cycle;


    endfig;

    beginfig(2);
    fill (halfcircle--cycle) scaled 6cm withcolor 0.4 [red,white];
    unfill fullcircle scaled u;
    draw halfcircle scaled u;
      draw halfcircle scaled 6cm;
      
    z1 = ((0,0)--(0,u)) intersectionpoint (fullcircle scaled u);
    z2 = ((-u,y1)--(u,y1)) intersectionpoint (subpath (50,170) of fullcircle scaled 6cm);

      label.rt("r",0.5z1);
      label.lft("R",0.5z2);
      label.top("t/2",0.3[z1,z2]);

      draw origin--z1;
      draw origin--z2;
      draw z1--z2;

      setbounds currentpicture to (-0.8u,0)--(0.8u,0)--(0.8u,0.8u)--(-0.8u,0.8u)--cycle;
	


  endfig;





end;
