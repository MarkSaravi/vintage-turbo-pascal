
program EllipseChart;

uses Graph,CRT;

var 
    ns:   integer;
    sv:   array [1..100] of integer;

procedure DrawSectors;
var 
    p,i,sa,ea,ma,x,y,tw,th:   integer;
    s:   string;
begin
    SetBkColor(WHITE);
    SetFillStyle(SolidFill,BLUE);
    FillEllipse(320,300,300,150);
    Bar(20,240,100,300);
    Bar(620,240,540,300);
    sa := 0;
    ea := 0;
    p := 4;
    SetTextStyle(SmallFont,0,5);
    For i:=1 To ns Do
        begin
            sa := ea;
            ea := ea+Round(sv[i]*3.6);
            ma := (ea+sa) Div 2;
            SetFillStyle(p,i+1);
            SetColor(i);
            Sector(320,240,sa,ea,300,150);
            If p=4 Then p := 5
            Else p := 4;
            Str(sv[i],s);
            s := s+'%';
            tw := TextWidth(s);
            th := TextHeight(s);
            x := 320+Round(100*Cos(ma*PI/180));
            y := 240-Round(100*Sin(ma*PI/180));
            SetColor(BLUE);
            OutTextXY(x-tw Div 2,y-th Div 2,s)
        end;
end;

var 
    gd,gm:   integer;
    i:   integer;
begin
    ClrScr;
    Write('Enter Num. of Sectors : ');
    Readln(ns);
    For i:=1 To ns Do
        begin
            Write('Sector #',i,' : ');
            Readln(sv[i]);
        end;
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    DrawSectors;
    CloseGraph;
end.
