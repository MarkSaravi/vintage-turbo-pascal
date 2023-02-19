
program Bomb;

uses Graph,CRT;

Const 
    ASPEED =   10;
    RSPEED =   20;
    G =   9.8;
    SX =   500;
    SY =   400;

var 
    AirCraft,Rocket:   Pointer;
    blown:   Boolean;
    t,dt:   Real;

var 
    ex:   integer;
    dir:   integer;
    color:   integer;

procedure Explode;
var 
    i:   integer;
begin
    For i:=1 To 3 Do
        begin
            ex := ex+dir;
            If ex>50 Then
                begin
                    dir := -1;
                    color := WHITE;
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
Const 
    PXS1:   array [1..12] of integer =   (5,1,6,23,5,50,59,69,24,24,44,40);
    PYS1:   array [1..12] of integer =   (13,1,1,13,13,13,20,24,24,17,17,24);
    PXS2:   array [1..6] of integer =   (41,43,52,59,50,41);
    PYS2:   array [1..6] of integer =   (13,17,20,20,13,13);
    PXS3:   array [1..6] of integer =   (24,19,19,24,24,5);
    PYS3:   array [1..6] of integer =   (17,19,22,24,17,13);

var 
    i:   integer;
begin
    SetColor(BLUE);
    SetBkColor(WHITE);
    ClearDevice;
    MoveTo(PXS1[1],PYS1[1]);
    For i:=2 To 12 Do
        begin
            LineTo(PXS1[i],PYS1[i]);

        end;
    MoveTo(PXS2[1],PYS2[1]);
    For i:=2 To 6 Do
        LineTo(PXS2[i],PYS2[i]);
    MoveTo(PXS3[1],PYS3[1]);
    For i:=2 To 6 Do
        LineTo(PXS3[i],PYS3[i]);
    GetMem(AirCraft,ImageSize(0,0,70,25));
    GetImage(0,0,70,25,AirCraft^);
    ClearDevice;
end;

procedure MoveAirCraft;
var 
    x,y:   integer;
begin
    If t>0 Then
        begin
            x := Round((t-dt)*ASPEED);
            y := 100;
            PutImage(x,y,AirCraft^,XORPut);
        end;
    x := Round(t*ASPEED);
    y := 100;
    PutImage(x,y,AirCraft^,XORPut);
end;

procedure MoveRocket;
var 
    x,y:   integer;
begin
    If t>0 Then
        begin
            x := 20+Round((t-dt)*RSPEED);
            y := Round(G*x*x/(2*RSPEED*RSPEED));
            PutImage(x,120+y Div 10,Rocket^,XORPut);
        end;
    x := 20+Round(t*RSPEED);
    y := Round(G*x*x/(2*RSPEED*RSPEED));
    If (x>SX)And(y>SY) Then
        begin
            SetFillStyle(SOLIDFILL,WHITE);
            Bar(SX-15,SY-15,SX+45,SY+35);
            blown := True
        end
    Else
        PutImage(x,120+ y Div 10,Rocket^,XORPut);
end;

var 
    gd,gm:   integer;
begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt ;
    DrawRocket;
    DrawAirCraft;
    blown := false;
    t := 0;
    ex := 0;
    MoveAirCraft;
    MoveRocket;
    ClearDevice;
    DrawTarget;
    dt := 0.5;
    dir := 1;
    color := RED;
    While (t<55) Do
        begin
            MoveAirCraft;
            If Not blown Then
                MoveRocket
            Else
                Explode;
            t := t+dt;
            Delay(50);
        end;
    FreeMem(AirCraft,ImageSize(0,0,70,25));
    FreeMem(Rocket,ImageSize(9,5,36,19));
    CloseGraph;
end.
