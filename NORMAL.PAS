
program Normal_Prog;

uses Graph,CRT;

procedure Normal(xc,yc,gx,gy,color,ygap: integer);
var 
    x,y,ox,oy:   Real;
begin
    ox := -3;
    x := ox;
    oy := Exp(-ox*ox/2)/Sqrt(2*PI);
    {MoveTo(xc+Round(x*gx),GetMaxY-(yc-Round(gy*y)));}
    SetColor(color);
    Repeat
        x := x+0.01;
        y := Exp(-x*x/2)/Sqrt(2*PI);
        Line(xc+Round(ox*gx),GetMaxY-(yc-Round(oy*gy))+ygap,xc+Round(x*gx),
        GetMaxY+ygap-(yc-Round(gy*y)));
        Line(xc+Round(ox*gx),GetMaxY-(yc+Round(oy*gy))-ygap,xc+Round(x*gx),
        GetMaxY-ygap-(yc+Round(gy*y)));
        Line(xc+Round(oy*gy)+ygap,GetMaxY-(yc-Round(ox*gx)),xc+Round(y*gy)+ygap,
        GetMaxY-(yc-Round(gx*x)));
        Line(xc-Round(oy*gy)-ygap,GetMaxY-(yc-Round(ox*gx)),xc-Round(y*gy)-ygap,
        GetMaxY-(yc-Round(gx*x)));
        ox := x;
        oy := y;
    Until x>3;
end;

var 
    gd,gm:   integer;
    i,col:   integer;
    nstate:   Boolean;
begin
    Randomize;
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    i := 10;
    col := 1;
    nstate := False;
    While Not KeyPressed Do
        begin
            If nstate=True Then
                Normal(320,240,i Div 3,i,col,i)
            Else
                begin
                    SetColor(i);
                    Circle(320,240,i);
                end;
            col := Random(16)+1;
            i := i+1;
            If (nstate) And (i>150) Then
                begin
                    nstate := Not nstate;
                    i := 10;
                end;
            If (Not nstate) And (i>200) Then
                begin
                    nstate := Not nstate;
                    i := 10;
                end;
        end;
    Pause;
    CloseGraph;
end.
