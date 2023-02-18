
program Ruller;

Uses 
crt,graph;

Procedure r(xc,yc: Integer);
Var 
    b,i :   Integer;
    ch:   string;
Begin
    b := 0;
    i := 0;
    SetColor(15);
    Repeat
        Line(xc+b,yc,xc+b,yc-10);
        b := b+3;
    Until b>620;
    b := 0;
    Repeat
        SetColor(2);
        Line(xc+b,yc,xc+b,yc-15);
        Str(i,ch);
        SetColor(10);
        SetTextJustify(CenterText,CenterText);
        OutTextXY(xc+b,yc-20,ch);
        b := b+30;
        i := i+1;
    Until b>620;
End;

Var 
    gd,gm:   Integer;
Begin
    gd := Detect;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then Halt;
    Rectangle(2,300,625,350);
    r(2,350);
    Readkey;
    CloseGraph;
End.
