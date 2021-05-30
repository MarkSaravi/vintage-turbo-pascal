
Program Bomb;

Uses Graph,CRT;

Const 
    ASPEED =   10;
    RSPEED =   20;
    G =   9.8;
    SX =   500;
    SY =   400;

Var 
    AirCraft,Rocket:   Pointer;
    blown:   Boolean;
    t,dt:   Real;

Var 
    ex:   Integer;
    dir:   Integer;
    color:   Integer;
Procedure Explode;

Var 
    i:   Integer;
Begin
    For i:=1 To 3 Do
        Begin
            ex := ex+dir;
            If ex>50 Then
                Begin
                    dir := -1;
                    color := WHITE;
                End;
            SetColor(color);
            Circle(SX+15,SY+15,ex);
        End;
End;
Procedure DrawTarget;
Begin
    Rectangle(SX+1,SY+1,SX+30,SY+30);
    Line(SX+11,SY-11,SX+40,SY-11);
    Line(SX+1,SY+1,SX+11,SY-11);
    Line(SX+30,SY+1,SX+40,SY-11);
    Line(SX+40,SY-11,SX+40,SY+20);
    Line(SX+30,SY+30,SX+40,SY+20);
End;
Procedure DrawRocket;

Begin
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
End;
Procedure DrawAirCraft;

Const 
    PXS1:   array [1..12] Of Integer =   (5,1,6,23,5,50,59,69,24,24,44,40);
    PYS1:   array [1..12] Of Integer =   (13,1,1,13,13,13,20,24,24,17,17,24);
    PXS2:   array [1..6] Of Integer =   (41,43,52,59,50,41);
    PYS2:   array [1..6] Of Integer =   (13,17,20,20,13,13);
    PXS3:   array [1..6] Of Integer =   (24,19,19,24,24,5);
    PYS3:   array [1..6] Of Integer =   (17,19,22,24,17,13);

Var 
    i:   Integer;
Begin
    SetColor(BLUE);
    SetBkColor(WHITE);
    ClearDevice;
    MoveTo(PXS1[1],PYS1[1]);
    For i:=2 To 12 Do
        Begin
            LineTo(PXS1[i],PYS1[i]);

        End;
    MoveTo(PXS2[1],PYS2[1]);
    For i:=2 To 6 Do
        LineTo(PXS2[i],PYS2[i]);
    MoveTo(PXS3[1],PYS3[1]);
    For i:=2 To 6 Do
        LineTo(PXS3[i],PYS3[i]);
    GetMem(AirCraft,ImageSize(0,0,70,25));
    GetImage(0,0,70,25,AirCraft^);
    ClearDevice;
End;
Procedure MoveAirCraft;

Var 
    x,y:   Integer;
Begin
    If t>0 Then
        Begin
            x := Round((t-dt)*ASPEED);
            y := 100;
            PutImage(x,y,AirCraft^,XORPut);
        End;
    x := Round(t*ASPEED);
    y := 100;
    PutImage(x,y,AirCraft^,XORPut);
End;
Procedure MoveRocket;

Var 
    x,y:   Integer;
Begin
    If t>0 Then
        Begin
            x := 20+Round((t-dt)*RSPEED);
            y := Round(G*x*x/(2*RSPEED*RSPEED));
            PutImage(x,120+y Div 10,Rocket^,XORPut);
        End;
    x := 20+Round(t*RSPEED);
    y := Round(G*x*x/(2*RSPEED*RSPEED));
    If (x>SX)And(y>SY) Then
        Begin
            SetFillStyle(SOLIDFILL,WHITE);
            Bar(SX-15,SY-15,SX+45,SY+35);
            blown := True
        End
    Else
        PutImage(x,120+ y Div 10,Rocket^,XORPut);
End;

Var 
    gd,gm:   Integer;
Begin
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
        Begin
            MoveAirCraft;
            If Not blown Then
                MoveRocket
            Else
                Explode;
            t := t+dt;
            Delay(50);
        End;
    FreeMem(AirCraft,ImageSize(0,0,70,25));
    FreeMem(Rocket,ImageSize(9,5,36,19));
    CloseGraph;
End.
