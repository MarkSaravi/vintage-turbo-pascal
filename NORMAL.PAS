program Normal_Prog;
uses Graph,CRT;
procedure Normal(xc,yc,gx,gy,color,ygap: Integer);
var
	x,y,ox,oy: Real;
begin
	ox:=-3;
    x:=ox;
    oy:=Exp(-ox*ox/2)/Sqrt(2*PI);
    {MoveTo(xc+Round(x*gx),GetMaxY-(yc-Round(gy*y)));}
    SetColor(color);
    repeat
    	x:=x+0.01;
    	y:=Exp(-x*x/2)/Sqrt(2*PI);
    	Line(xc+Round(ox*gx),GetMaxY-(yc-Round(oy*gy))+ygap,xc+Round(x*gx),GetMaxY+ygap-(yc-Round(gy*y)));
    	Line(xc+Round(ox*gx),GetMaxY-(yc+Round(oy*gy))-ygap,xc+Round(x*gx),GetMaxY-ygap-(yc+Round(gy*y)));
    	Line(xc+Round(oy*gy)+ygap,GetMaxY-(yc-Round(ox*gx)),xc+Round(y*gy)+ygap,GetMaxY-(yc-Round(gx*x)));
    	Line(xc-Round(oy*gy)-ygap,GetMaxY-(yc-Round(ox*gx)),xc-Round(y*gy)-ygap,GetMaxY-(yc-Round(gx*x)));
        ox:=x;
		oy:=y;
    until x>3;
end;
var
	gd,gm: Integer;
    i,col: Integer;
    nstate: Boolean;
begin
	Randomize;
	gd:=DETECT;
    InitGraph(gd,gm,'');
    if GraphResult<>0 then halt;
        i:=10;
    col:=1;
    nstate:=False;
    while NOT KeyPressed do
    begin
    	if nstate=True then
    		Normal(320,240,i DIV 3,i,col,i)
        else
        begin
        	SetColor(i);
        	Circle(320,240,i);
        end;
        col:=Random(16)+1;
        i:=i+1;
        if (nstate) AND (i>150) then
        begin
        	nstate:=NOT nstate;
            i:=10;
        end;
        if (NOT nstate) AND (i>200) then
        begin
        	nstate:=NOT nstate;
            i:=10;
        end;
    end;
    Pause;
    CloseGraph;
end.