program N_Polygon;
uses Graph,CRT;
const
	N=8;
    XC=320;
    YC=240;
var
    x,y: array [1..N] of Integer;

procedure DrawNPoly;
var
	i: Integer;
begin
    for i:=1 to N do
    begin
        if i=1 then
        	MoveTo(x[i],y[i])
        else
        	LineTo(x[i],y[i])
    end;
    LineTo(x[1],y[1]);
end;

procedure CalcNewPoly;
var
	i: Integer;
    xt,yt: array [1..N] of Integer;
begin
    for i:=1 to N-1 do
    begin
        xt[i]:=(x[i]+x[i+1]) DIV 2;
        yt[i]:=(y[i]+y[i+1]) DIV 2;
    end;
    xt[N]:=(x[1]+x[N]) DIV 2;
    yt[N]:=(y[1]+y[N]) DIV 2;
    for i:=1 to N do
    begin
    	x[i]:=xt[i];
        y[i]:=yt[i];
    end;
end;

var
    radius,color,i: Integer;
    alfa,dalfa: Integer;
	gd,gm: Integer;

begin
	gd:=DETECT;
    InitGraph(gd,gm,'');
    if GraphResult<>0 then halt;
        alfa:=0;
    while NOT KeyPressed do
    begin
    ClearDevice;
    radius:=200;
    color:=1;
    alfa:=alfa+10;
    dalfa:=360 DIV N;
    for i:=1 to N do
    begin
    	x[i]:=XC+Round(radius*cos(alfa*PI/180));
        y[i]:=YC+Round(radius*sin(alfa*PI/180));
        alfa:=alfa+dalfa;
    end;
    for i:=1 to 10 do
    begin
    	SetColor(i);
    	DrawNPoly;
        CalcNewPoly;
    end;
    Delay(10000);
    end;
    CloseGraph;
end.