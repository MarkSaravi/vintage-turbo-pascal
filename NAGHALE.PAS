uses graph,crt;
var
   gd,gm,b,i:integer;
   nstr: string[5];

procedure naghale(xc,yc,r,n,color:integer);
  var
     x,y,a:real;
begin
    a:=0;
    setcolor(color);
    repeat
        Moveto(round(xc+(r-10)*cos(-a)),round(yc+(r-10)*sin(-a)));
        lineto(round(xc+r*cos(-a)),round(yc+r*sin(-a)));
		a:=a+pi/n;
    until a>pi;
end;
begin
    gd:=detect;
    initgraph(gd,gm,'  ');
    if graphresult <> 0 then halt;
    setcolor(14);
    arc(320,240,0,180,100);
    arc(320,240,0,180,50);
    line(270,240,370,240);
   	naghale(320,240,100,60,2);
    setcolor(14);
    moveto(230,240);
    lineto(180,240);
    lineto(180,300);
    lineto(460,300);
    lineto(460,240);
    lineto(410,240);
    moveto(180,240);
    b:=0;
    setcolor(2);
    repeat
        line(185+b,300,185+b,295);
        b:=b+5;
    until b>270;
    setcolor(5);
    b:=5;
    i:=0;
    repeat
        line(180+b,300,180+b,290);
        Str(i,nstr);
        OutTextXY(182+b-TextWidth(nstr) DIV 2,280,nstr);
        b:=b+45;
        i:=i+1;
    until b>280;
	ReadKey;
end.


