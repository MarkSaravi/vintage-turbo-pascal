
Program Normal_Prog;

Uses Graph,CRT;

Procedure Normal(xc,yc,gx,gy,color,ygap: Integer);
Var 
    x,y,ox,oy:   Real;
Begin
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
End;

Var 
    gd,gm:   Integer;
    i,col:   Integer;
    nstate:   Boolean;
Begin
    Randomize;
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    i := 10;
    col := 1;
    nstate := False;
    While Not KeyPressed Do
        Begin
            If nstate=True Then
                Normal(320,240,i Div 3,i,col,i)
            Else
                Begin
                    SetColor(i);
                    Circle(320,240,i);
                End;
            col := Random(16)+1;
            i := i+1;
            If (nstate) And (i>150) Then
                Begin
                    nstate := Not nstate;
                    i := 10;
                End;
            If (Not nstate) And (i>200) Then
                Begin
                    nstate := Not nstate;
                    i := 10;
                End;
        End;
    Pause;
    CloseGraph;
End.
