
program Sine_Wave;

uses 
crt,graph;

procedure Sin1(xc,yc,color: integer);
Const 
    gx =   20;
    gy =   10;

var 
    x,y:   Real;
begin
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
end;

procedure Sin2(xc,yc,color: integer);
Const 
    gx =   20;
    gy =   10;

var 
    x,y:   Real;
begin
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
end;

var 
    gd,gm:   integer;
begin
    gd := Detect;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then Halt;
    Sin1(10,10,2);
    Sin2(10,10,3);
    ReadKey;
    CloseGraph;
end.
