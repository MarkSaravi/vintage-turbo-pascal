
program Clock;

uses Graph,CRT,Dos;

procedure DrawClock;

var 
    i,a,b,j,tw,th:   integer;
    r,alfa:   Real;
    x1,y1,x2,y2,x3,y3:   integer;
    nstr:   String[10];

    procedure CalcR2;
    var 
        k:   Real;
    begin
        k := Sin(alfa)*Sin(alfa)*(a*a/b/b-1)+1;
        r := Sqrt(a*a/k);
    end;

begin
    SetBkColor(BLUE);
    SetFillStyle(SolidFill,LightGray);
    Bar3D(100,100,500,450,50,TopOn);
    SetLineStyle(SolidLn,0,ThickWidth);
    Rectangle(100,100,500,450);
    SetFillStyle(SolidFill,DarkGray);
    FillEllipse(300,250,180,120);
    Ellipse(300,250,0,360,190,130);
    SetFillStyle(SolidFill,WHITE);
    FillEllipse(300,250,10,10);
    SetTextStyle(SmallFont,0,5);
    a := 175;
    b := 115;
    j := 3;
    For i:=0 To 59 Do
        begin
            alfa := i*6*PI/180;
            CalcR2;
            x1 := Round((r-10)*Cos(alfa));
            y1 := Round((r-10)*Sin(alfa));
            x2 := Round(r*Cos(alfa));
            y2 := Round(r*Sin(alfa));
            x3 := Round((r-20)*Cos(alfa));
            y3 := Round((r-20)*Sin(alfa));
            If (i Mod 5)=0 Then
                begin
                    SetLineStyle(SolidLn,0,ThickWidth);
                    Str(j,nstr);
                    tw := TextWidth(nstr);
                    th := TextHeight(nstr);
                    SetColor(Yellow);
                    OutTextXY(300+x3-tw Div 2,250+y3-th Div 2,nstr);
                    j := j+1;
                    If j>12 Then j := 1;
                end
            Else
                SetLineStyle(SolidLn,0,NormWidth);
            SetColor(Cyan);
            Line(300+x1,250+y1,300+x2,250+y2);
        end;
end;

procedure AdvanceClock;
var 
    Hour,Min,Sec,Sec100:   Word;
    procedure AnalogClock;
        procedure DrawPointer(alfa,pl: integer);
        var 
            a:   Real;
            x,y:   integer;
        begin
            a := -alfa*PI/180;
            x := Round(pl*Cos(a));
            y := Round(pl*Sin(a));
            Line(300,250,300+x,250-y);
        end;
    Const 
        hl =   50;
        ml =   70;
        sl =   80;
    begin
        SetColor(DarkGray);
        SetFillStyle(SolidFill,DarkGray);
        FillEllipse(300,250,sl+1,sl+1);
        Sec := (Sec-15)*6;
        SetColor(Red);
        SetLineStyle(SolidLn,0,NormWidth);
        DrawPointer(Sec,sl);
        Min := (Min-15)*6;
        SetColor(Green);
        SetLineStyle(SolidLn,0,ThickWidth);
        DrawPointer(Min,ml);
        Hour := (Hour-3)*30;
        SetColor(Brown);
        SetLineStyle(SolidLn,0,ThickWidth);
        DrawPointer(Hour,hl);
        SetFillStyle(SolidFill,Red);
        SetLineStyle(SolidLn,0,NormWidth);
        SetColor(RED);
        FillEllipse(300,250,10,10);
    end;

    procedure DigitalClock(x,y:integer;t:Word);
    var 
        tw,th:   integer;
        s:   string;
    begin
        SetTextStyle(SmallFont,0,7);
        Str(t,s);
        If t<10 Then s := '0'+s;
        tw := TextWidth(s);
        th := TextHeight(s);
        SetColor(RED);
        SetFillStyle(SolidFill,LightGreen);
        Bar3D(x,y,x+30,y+30,5,TopOn);
        OutTextXY(x+16-tw Div 2,y+10-th Div 2,s);
    end;
begin
    GetTime(Hour,Min,Sec,Sec100);
    DigitalClock(250,400,Hour);
    DigitalClock(280,400,Min);
    DigitalClock(310,400,Sec);
    AnalogClock;
end;

var 
    gd,gm:   integer;
begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    DrawClock;
    While Not KeyPressed Do
        begin
            AdvanceClock;
            Delay(1000);
        end;
    CloseGraph;
end.
