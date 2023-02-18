
program Mahtabi;

Uses Graph,CRT;

Procedure OffLump;
Begin
    SetFillStyle(SolidFill,BLACK);
    Bar(100,100,500,140);
End;

Procedure OnFlash;
Var 
    i,h,d:   Integer;
Begin
    SetColor(WHITE);
    For i:=10 To 400-10 Do
        Begin
            h := Random(40);
            d := (40-h) Div 2;
            Line(100+i,100+d,100+i,100+d+h);
        End;
    Delay(Random(100));
    Bar(100,100,500,140);
    DElay(Random(10000));
End;

Procedure OnLump;
Var 
    n,i:   Integer;
Begin
    OffLump;
    SetLineStyle(SolidLn,0,NormWidth);
    SetFillStyle(SolidFill,Black);
    n := Random(3)+3;
    For i:=1 To n Do
        OnFlash;
    SetFillStyle(SolidFill,WHITE);
    Bar(100,100,500,140);
End;

Procedure DrawLump;
Begin
    Rectangle(99,99,501,141);
    SetFillStyle(SolidFill,LightGray);
    Bar(98,99,79,141);
    Bar(502,99,520,141);
    SetFillStyle(SolidFill,DarkGray);
    Bar(77,107,67,180);
    Bar(523,107,533,180);
    Bar(77,180,533,170);
    SetFillStyle(SolidFill,WHITE);
    Bar(220,170,310,167);
    Bar(230,170,300,150);
    Bar(490,170,510,160);
    Bar(495,170,505,150);
    SetLineStyle(SolidLn,0,ThickWidth);
    Line (534,175,560,175);
    Line(560,175,560,250);
    SetFillStyle(SolidFill,LightGray);
    Bar(540,250,580,290);
    SetFillStyle(SolidFill,DarkGray);
    Bar(557,260,563,280);
End;

Var 
    gd,gm:   Integer;
    c:   Char;
Begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then halt;
    Randomize;
    OutTextXY(100,300,'Press O to make lump On');
    OutTextXY(100,330,'Press F to make lump Off');
    OutTextXY(100,360,'Press ESC to exit');
    SetBkColor(BLACK);
    DrawLump;
    OffLump;
    Repeat
        c := ReadKey;
        Case c Of 
            'o','O':   OnLump;
            'f','F':   OffLump;
        End;
    Until c=#27;
    CloseGraph;
End.
