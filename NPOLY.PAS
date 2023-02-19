
program N_Polygon;

uses Graph,CRT;

Const 
    N =   8;
    XC =   320;
    YC =   240;

var 
    x,y:   array [1..N] of integer;

procedure DrawNPoly;
var 
    i:   integer;
begin
    For i:=1 To N Do
        begin
            If i=1 Then
                MoveTo(x[i],y[i])
            Else
                LineTo(x[i],y[i])
        end;
    LineTo(x[1],y[1]);
end;

procedure CalcNewPoly;
var 
    i:   integer;
    xt,yt:   array [1..N] of integer;
begin
    For i:=1 To N-1 Do
        begin
            xt[i] := (x[i]+x[i+1]) Div 2;
            yt[i] := (y[i]+y[i+1]) Div 2;
        end;
    xt[N] := (x[1]+x[N]) Div 2;
    yt[N] := (y[1]+y[N]) Div 2;
    For i:=1 To N Do
        begin
            x[i] := xt[i];
            y[i] := yt[i];
        end;
end;

var 
    radius,color,i:   integer;
    alfa,dalfa:   integer;
    gd,gm:   integer;

begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    alfa := 0;
    While Not KeyPressed Do
        begin
            ClearDevice;
            radius := 200;
            color := 1;
            alfa := alfa+10;
            dalfa := 360 Div N;
            For i:=1 To N Do
                begin
                    x[i] := XC+Round(radius*cos(alfa*PI/180));
                    y[i] := YC+Round(radius*sin(alfa*PI/180));
                    alfa := alfa+dalfa;
                end;
            For i:=1 To 10 Do
                begin
                    SetColor(i);
                    DrawNPoly;
                    CalcNewPoly;
                end;
            Delay(10000);
        end;
    CloseGraph;
end.
