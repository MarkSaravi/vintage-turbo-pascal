program EllipseChart;
uses Graph,CRT;
var
	ns: Integer;
    sv: array [1..100] of Integer;
procedure DrawSectors;
var
	p,i,sa,ea,ma,x,y,tw,th: Integer;
    s: string;
begin
	SetBkColor(WHITE);
	SetFillStyle(SolidFill,BLUE);
    FillEllipse(320,300,300,150);
    Bar(20,240,100,300);
    Bar(620,240,540,300);
	sa:=0;
    ea:=0;
    p:=4;
    SetTextStyle(SmallFont,0,5);
	for i:=1 to ns do
    begin
    	sa:=ea;
        ea:=ea+Round(sv[i]*3.6);
        ma:=(ea+sa) DIV 2;
    	SetFillStyle(p,i+1);
        SetColor(i);
        Sector(320,240,sa,ea,300,150);
        if p=4 then p:=5 else p:=4;
        Str(sv[i],s);
        s:=s+'%';
        tw:=TextWidth(s);
        th:=TextHeight(s);
        x:=320+Round(100*Cos(ma*PI/180));
        y:=240-Round(100*Sin(ma*PI/180));
        SetColor(BLUE);
        OutTextXY(x-tw DIV 2,y-th DIV 2,s)
    end;
end;
var
	gd,gm: Integer;
    i: Integer;
begin
	ClrScr;
    Write('Enter Num. of Sectors : ');
    Readln(ns);
    for i:=1 to ns do
    begin
    	Write('Sector #',i,' : ');
        Readln(sv[i]);
    end;
	gd:=DETECT;
    InitGraph(gd,gm,'');
    if GraphResult<>0 then halt;
            DrawSectors;
        CloseGraph;
end.