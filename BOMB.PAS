program Bomb;
uses Graph,CRT;
const
	ASPEED=10;
    RSPEED=20;
    G=9.8;
	SX=500;
    SY=400;
var
	AirCraft,Rocket: Pointer;
    blown: Boolean;
    t,dt: Real;
var
	ex: Integer;
    dir: Integer;
    color: Integer;
procedure Explode;
var
	i: Integer;
begin
    for i:=1 to 3 do
    begin
    	ex:=ex+dir;
        if ex>50 then
        begin
			dir:=-1;
            color:=WHITE;
        end;
        SetColor(color);
        Circle(SX+15,SY+15,ex);
    end;
end;
procedure DrawTarget;
begin
	Rectangle(SX+1,SY+1,SX+30,SY+30);
    Line(SX+11,SY-11,SX+40,SY-11);
    Line(SX+1,SY+1,SX+11,SY-11);
	Line(SX+30,SY+1,SX+40,SY-11);
	Line(SX+40,SY-11,SX+40,SY+20);
	Line(SX+30,SY+30,SX+40,SY+20);
end;
procedure DrawRocket;

begin
    SetColor(GREEN);
	SetBkColor(WHITE);
	ClearDevice;
	Rectangle(10,10,30,14);
    Line(12,6,12,18);
    Line(12,6,14,6);
    Line(12,18,14,18);
    Line(14,6,20,10);
    Line(14,18,20,14);
    Line(30,10,35,12);
    Line(30,14,35,12);
    GetMem(Rocket,ImageSize(9,5,36,19));
    GetImage(9,5,36,19,Rocket^);
    ClearDevice;
end;
procedure DrawAirCraft;
const
	PXS1: array [1..12] of Integer=(5,1,6,23,5,50,59,69,24,24,44,40);
    PYS1: array [1..12] of Integer=(13,1,1,13,13,13,20,24,24,17,17,24);
    PXS2: array [1..6] of Integer=(41,43,52,59,50,41);
    PYS2: array [1..6] of Integer=(13,17,20,20,13,13);
    PXS3: array [1..6] of Integer=(24,19,19,24,24,5);
    PYS3: array [1..6] of Integer=(17,19,22,24,17,13);
var
	i: Integer;
begin
	SetColor(BLUE);
	SetBkColor(WHITE);
	ClearDevice;
	MoveTo(PXS1[1],PYS1[1]);
    for i:=2 to 12 do
    begin
    	LineTo(PXS1[i],PYS1[i]);

    end;
	MoveTo(PXS2[1],PYS2[1]);
    for i:=2 to 6 do
    	LineTo(PXS2[i],PYS2[i]);
	MoveTo(PXS3[1],PYS3[1]);
    for i:=2 to 6 do
    	LineTo(PXS3[i],PYS3[i]);
    GetMem(AirCraft,ImageSize(0,0,70,25));
    GetImage(0,0,70,25,AirCraft^);
    ClearDevice;
end;
procedure MoveAirCraft;
var
	x,y: Integer;
begin
	if t>0 then
    begin
		x:=Round((t-dt)*ASPEED);
    	y:=100;
    	PutImage(x,y,AirCraft^,XORPut);
    end;
	x:=Round(t*ASPEED);
    y:=100;
    PutImage(x,y,AirCraft^,XORPut);
end;
procedure MoveRocket;
var
	x,y: Integer;
begin
	if t>0 then
    begin
		x:=20+Round((t-dt)*RSPEED);
    	y:=Round(G*x*x/(2*RSPEED*RSPEED));
    	PutImage(x,120+y DIV 10,Rocket^,XORPut);
    end;
	x:=20+Round(t*RSPEED);
    y:=Round(G*x*x/(2*RSPEED*RSPEED));
    if (x>SX)AND(y>SY) then
    begin
        SetFillStyle(SOLIDFILL,WHITE);
    	Bar(SX-15,SY-15,SX+45,SY+35);
    	blown:=True
    end
    else
    	PutImage(x,120+ y DIV 10,Rocket^,XORPut);
end;
var
	gd,gm: Integer;
begin
	gd:=DETECT;
    InitGraph(gd,gm,'');
    if GraphResult<>0 then halt ;
    DrawRocket;
    DrawAirCraft;
    blown:=false;
    t:=0;
    ex:=0;
    MoveAirCraft;
    MoveRocket;
    ClearDevice;
    DrawTarget;
	dt:=0.5;
    dir:=1;
    color:=RED;
    while (t<55) do
    begin
    	MoveAirCraft;
        if NOT blown then
			MoveRocket
        else
        	Explode;
        t:=t+dt;
        Delay(50);
    end;
    FreeMem(AirCraft,ImageSize(0,0,70,25));
    FreeMem(Rocket,ImageSize(9,5,36,19));
    CloseGraph;
end.