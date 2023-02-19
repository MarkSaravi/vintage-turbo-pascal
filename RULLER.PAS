
program Ruller;

uses 
crt,graph;

procedure r(xc,yc: integer);
var 
    b,i :   integer;
    ch:   string;
begin
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
end;

var 
    gd,gm:   integer;
begin
    gd := Detect;
    InitGraph(gd,gm,'');
    If GraphResult<>0 then Halt;
    Rectangle(2,300,625,350);
    r(2,350);
    Readkey;
    CloseGraph;
end.
