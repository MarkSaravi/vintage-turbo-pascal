
program Sine_Wave;

Uses 
crt,graph;

Procedure Sin1(xc,yc,color: Integer);
Const 
    gx =   20;
    gy =   10;

Var 
    x,y:   Real;
Begin
    Repeat
        x := 0;
        y := Sin(x);
        MoveTo(Round(xc+gx*x),Round(GetMaxY-(yc-gy*y)));
        SetColor(color);
        Repeat
            x := x+0.01;
            y := Sin(x);
            LineTo(Round(xc+gx*x),Round(GetMaxY-(yc-gy*y)));
        Until x>10*PI;
        yc := yc+50;
    Until yc>600;
End;

Procedure Sin2(xc,yc,color: Integer);
Const 
    gx =   20;
    gy =   10;

Var 
    x,y:   Real;
Begin
    Repeat
        x := 0;
        y := Sin(x);
        MoveTo(Round(yc+gy*y),Round((xc+gx*x)));
        SetColor(color);
        Repeat
            x := x+0.01;
            y := Sin(x);
            LineTo(Round(yc+gy*y),Round((xc+gx*x)));
        Until x>10*PI;
        yc := yc+50;
    Until yc>600;
End;

Var 
    gd,gm:   Integer;
Begin
    gd := Detect;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then Halt;
    Sin1(10,10,2);
    Sin2(10,10,3);
    ReadKey;
    CloseGraph;
End.
