program Ruller;
uses
	crt,graph;
procedure r(xc,yc: Integer);
var
	b,i : Integer;
    ch: string;
begin
	b:=0;
    i:=0;
    SetColor(15);
    repeat
    	Line(xc+b,yc,xc+b,yc-10);
        b:=b+3;
    until b>620;
    b:=0;
    repeat
        SetColor(2);
        Line(xc+b,yc,xc+b,yc-15);
        Str(i,ch);
        SetColor(10);
        SetTextJustify(CenterText,CenterText);
        OutTextXY(xc+b,yc-20,ch);
        b:=b+30;
        i:=i+1;
    until b>620;
end;
var
	gd,gm: Integer;
begin
	gd:=Detect;
    InitGraph(gd,gm,'');
    if GraphResult<>0 then Halt;
    Rectangle(2,300,625,350);
    r(2,350);
    Readkey;
    CloseGraph;
end.