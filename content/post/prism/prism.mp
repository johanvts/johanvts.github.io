outputformat:="svg";
outputtemplate:="%j_%c.%{outputformat}";
hppp:= 0.2;
vppp:= 0.2;

vardef asin   primary x = angle((1+-+x,x)) enddef ;
vardef angleat expr t of p = angle (direction t of p) enddef;

u:= 2cm;

path p[],bb,kb;
bb:=unitsquare scaled 4u shifted (-2u,-1u);
pair A,B,C,h;
A=-B=(1,0)*u;
C=(0,2)*u;
path tri;
tri:=A--B--C--cycle;

numeric a[],b[],n[];
n1=1;
n2=1.4;

%Parameters
  h:= .4[B,C]; %Incidence location
  a1:=40; %alpha angle (0-90)

  % h:= .4[B,C]; %Incidence location
  % a1:=8; %alpha angle (0-90)

  % h:= .2[B,C]; %Incidence location
  % a1:=50; %alpha angle (0-90)

beginfig(0);
  draw tri;
  draw bb;
  
  p[1] := h--(dir ((angleat .5 of (B--C)) + 90 + a1)*3u shifted h);
  draw p1 cutafter bb;
  p2=p1;
  boolean outside,leave;
  outside:=true;
  leave:=false;
  forever:
    h:= p2 intersectionpoint tri;
    t:= ypart(p2 intersectiontimes tri);
    ray:=angleat 1 of p2;
    normal:=(angleat t of tri)-90;
    if outside:normal:=normal+180;fi
%    draw h--(dir(normal)*1u shifted h) dashed evenly;
    if ray*normal>0:
      a1:=ray-normal;
    elseif ray>normal:
      a1:=-360+abs(ray)+abs(normal);
    else:
      a1:=360-abs(ray)-abs(normal);
    fi
    show "alpha:";
    show a1;
    refi:= if outside :sind(a1)*n1/n2;else:sind(a1)*n2/n1;fi
  if (refi > 1) or (refi < -1) : %physics says -1, 0 is pretty;
    show "reflection";
    p2 := h--(((dir(normal-a1))*3u) shifted h);
  else:
    show "refreaction";    
    p2 := h--(dir(normal + 180 + asin(refi))*3u shifted h);
    if outside=false:leave:=true;draw p2 cutafter bb;fi
  fi
  p2 := (subpath(epsilon, 1) of p2);
  draw (p2 cutafter tri) cutafter bb;
  p2 := reverse(p2);
  outside:=false;
  exitif(leave);
  setbounds currentpicture to bb scaled 1.05; 
endfor;

  endfig;
end
  
