
program N_Polygon;

Uses Graph,CRT;

Const 
    N =   8;
    XC =   320;
    YC =   240;

Var 
    x,y:   array [1..N] Of Integer;

Procedure DrawNPoly;
Var 
    i:   Integer;
Begin
    For i:=1 To N Do
        Begin
            If i=1 Then
                MoveTo(x[i],y[i])
            Else
                LineTo(x[i],y[i])
        End;
    LineTo(x[1],y[1]);
End;

Procedure CalcNewPoly;
Var 
    i:   Integer;
    xt,yt:   array [1..N] Of Integer;
Begin
    For i:=1 To N-1 Do
        Begin
            xt[i] := (x[i]+x[i+1]) Div 2;
            yt[i] := (y[i]+y[i+1]) Div 2;
        End;
    xt[N] := (x[1]+x[N]) Div 2;
    yt[N] := (y[1]+y[N]) Div 2;
    For i:=1 To N Do
        Begin
            x[i] := xt[i];
            y[i] := yt[i];
        End;
End;

Var 
    radius,color,i:   Integer;
    alfa,dalfa:   Integer;
    gd,gm:   Integer;

Begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    alfa := 0;
    While Not KeyPressed Do
        Begin
            ClearDevice;
            radius := 200;
            color := 1;
            alfa := alfa+10;
            dalfa := 360 Div N;
            For i:=1 To N Do
                Begin
                    x[i] := XC+Round(radius*cos(alfa*PI/180));
                    y[i] := YC+Round(radius*sin(alfa*PI/180));
                    alfa := alfa+dalfa;
                End;
            For i:=1 To 10 Do
                Begin
                    SetColor(i);
                    DrawNPoly;
                    CalcNewPoly;
                End;
            Delay(10000);
        End;
    CloseGraph;
End.
