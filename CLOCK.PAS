
program Clock;

Uses Graph,CRT,Dos;

Procedure DrawClock;

Var 
    i,a,b,j,tw,th:   Integer;
    r,alfa:   Real;
    x1,y1,x2,y2,x3,y3:   Integer;
    nstr:   String[10];

    Procedure CalcR2;
    Var 
        k:   Real;
    Begin
        k := Sin(alfa)*Sin(alfa)*(a*a/b/b-1)+1;
        r := Sqrt(a*a/k);
    End;

Begin
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
        Begin
            alfa := i*6*PI/180;
            CalcR2;
            x1 := Round((r-10)*Cos(alfa));
            y1 := Round((r-10)*Sin(alfa));
            x2 := Round(r*Cos(alfa));
            y2 := Round(r*Sin(alfa));
            x3 := Round((r-20)*Cos(alfa));
            y3 := Round((r-20)*Sin(alfa));
            If (i Mod 5)=0 Then
                Begin
                    SetLineStyle(SolidLn,0,ThickWidth);
                    Str(j,nstr);
                    tw := TextWidth(nstr);
                    th := TextHeight(nstr);
                    SetColor(Yellow);
                    OutTextXY(300+x3-tw Div 2,250+y3-th Div 2,nstr);
                    j := j+1;
                    If j>12 Then j := 1;
                End
            Else
                SetLineStyle(SolidLn,0,NormWidth);
            SetColor(Cyan);
            Line(300+x1,250+y1,300+x2,250+y2);
        End;
End;

Procedure AdvanceClock;
Var 
    Hour,Min,Sec,Sec100:   Word;
    Procedure AnalogClock;
        Procedure DrawPointer(alfa,pl: Integer);
        Var 
            a:   Real;
            x,y:   Integer;
        Begin
            a := -alfa*PI/180;
            x := Round(pl*Cos(a));
            y := Round(pl*Sin(a));
            Line(300,250,300+x,250-y);
        End;
    Const 
        hl =   50;
        ml =   70;
        sl =   80;
    Begin
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
    End;

    Procedure DigitalClock(x,y:Integer;t:Word);
    Var 
        tw,th:   Integer;
        s:   string;
    Begin
        SetTextStyle(SmallFont,0,7);
        Str(t,s);
        If t<10 Then s := '0'+s;
        tw := TextWidth(s);
        th := TextHeight(s);
        SetColor(RED);
        SetFillStyle(SolidFill,LightGreen);
        Bar3D(x,y,x+30,y+30,5,TopOn);
        OutTextXY(x+16-tw Div 2,y+10-th Div 2,s);
    End;
Begin
    GetTime(Hour,Min,Sec,Sec100);
    DigitalClock(250,400,Hour);
    DigitalClock(280,400,Min);
    DigitalClock(310,400,Sec);
    AnalogClock;
End;

Var 
    gd,gm:   Integer;
Begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    DrawClock;
    While Not KeyPressed Do
        Begin
            AdvanceClock;
            Delay(1000);
        End;
    CloseGraph;
End.
