outputformat:= "svg";
outputtemplate := "%j_%c.%o";
hppp := 0.25;
vppp := 0.25;

vardef func (expr X) = 
  3*(X**4) - 11X*X*X + 12X*X - 4X + 0.5
enddef;


  u := 5cm;

  % Calculate function.
  pair f[]; numeric steps;
  steps=10;
  for j=0 upto steps:
    f[j] := (j/steps, func(j/steps));
  endfor;
  path P;
  P := f0 for j=1 upto steps: ..f[j] endfor;

  % Set up trapezoid method
  numeric a,b,n,h;
  a=0.05;
  b=0.95;
  n=1;
  h=(b-a)/n;

  beginfig(1);

  label("",(b,func(b)*1.1) scaled u); %just to add some space up top

  % Color in function
    fill buildcycle(((a,0) scaled u -- (a,1) scaled u), P scaled u,((b,1) scaled u -- (b,0) scaled u),((0,func(0.83795)) scaled u -- (1,func(0.83795)) scaled u)) withcolor 0.4[red,white];

  % draw error box
    draw (a*u,0)--(a,func(0.83795)) scaled u -- (b,func(0.8379)) scaled u -- (b*u,0) -- cycle;

  % label
  dotlabel.rt("f(c)", (b,func(0.83795)) scaled u);

    
  % Draw x-axis.
  drawarrow (0,0)--(1,0) scaled u;

  % Draw function
  draw P scaled u;

  % Draw labels
  label.bot("a",(a,0) scaled u);
  label.bot("b",(b,0) scaled u);

endfig;


end;
