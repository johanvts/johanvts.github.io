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

  beginfig(0);

  label("",(b,func(b)*1.1) scaled u); %just to add some space up top  
  dotlabel.lft("f(a)", (a,func(a)) scaled u);
  dotlabel.rt("f(b)", (b,func(b)) scaled u);
  
  path panels[];
  for i=0 upto n-1:
    panels[i] = (a+h*i,0) scaled u -- (a+h*i,func(a+h*i)) scaled u -- (a+h*(1+i),func(a+h*(1+i))) scaled u --(a+h*(1+i),0) scaled u -- cycle;
    draw panels[i];
  endfor;

  % Draw x-axis.
  drawarrow (0,0)--(1,0) scaled u;

  % Draw function
  draw P scaled u;

  % Draw labels
  label.bot("a",(a,0) scaled u);
  label.bot("b",(b,0) scaled u);

endfig;

  beginfig(1);

  label("",(b,func(b)*1.1) scaled u); %just to add some space up top
  dotlabel.rt("f(a)+f(b) / 2", (b,0.5*(func(a)+func(b))) scaled u);
  
  path panels[];
  for i=0 upto n-1:
    panels[i] = (a+h*i,0) scaled u -- (a+h*i,0.5*(func(a+h*i)+func(a+h*(1+i)))) scaled u -- (a+h*(1+i),0.5*(func(a+h*i)+func(a+h*(1+i)))) scaled u --(a+h*(1+i),0) scaled u -- cycle;
    draw panels[i];
  endfor;

  % Draw x-axis.
  drawarrow (0,0)--(1,0) scaled u;

  % Draw function
  draw P scaled u;

  % Draw labels
  label.bot("a",(a,0) scaled u);
  label.bot("b",(b,0) scaled u);

endfig;

  beginfig(4);

    n:=4;
    h:=(b-a)/n;
    label("",(b,func(b)*1.1) scaled u); %just to add some space up top
  dotlabel.lft("f(a)", (a,func(a)) scaled u);
  dotlabel.rt("f(b)", (b,func(b)) scaled u);
  
  path panels[];
  for i=0 upto n-1:
    panels[i] = (a+h*i,0) scaled u -- (a+h*i,func(a+h*i)) scaled u -- (a+h*(1+i),func(a+h*(1+i))) scaled u --(a+h*(1+i),0) scaled u -- cycle;
    draw panels[i];
  endfor;

  % Draw x-axis.
  drawarrow (0,0)--(1,0) scaled u;

  % Draw function
  draw P scaled u;

  % Draw labels
  label.bot("a",(a,0) scaled u);
  label.bot("b",(b,0) scaled u);

endfig;

  beginfig(16);

    n:=16;
    h:=(b-a)/n;
  
  dotlabel.lft("f(a)", (a,func(a)) scaled u);
  dotlabel.rt("f(b)", (b,func(b)) scaled u);
  
  path panels[];
  for i=0 upto n-1:
    panels[i] = (a+h*i,0) scaled u -- (a+h*i,func(a+h*i)) scaled u -- (a+h*(1+i),func(a+h*(1+i))) scaled u --(a+h*(1+i),0) scaled u -- cycle;
    draw panels[i];
  endfor;

  % Draw x-axis.
  drawarrow (0,0)--(1,0) scaled u;

  % Draw function
  draw P scaled u;

  % Draw labels
  label.bot("a",(a,0) scaled u);
  label.bot("b",(b,0) scaled u);

endfig;

end;
