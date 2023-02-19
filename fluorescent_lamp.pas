
program Mahtabi;

uses Graph,CRT;

procedure OffLump;
begin
    SetFillStyle(SolidFill,BLACK);
    Bar(100,100,500,140);
end;

procedure OnFlash;
var 
    i,h,d:   integer;
begin
    SetColor(WHITE);
    For i:=10 To 400-10 Do
        begin
            h := Random(40);
            d := (40-h) div 2;
            Line(100+i,100+d,100+i,100+d+h);
        end;
    Delay(Random(100));
    Bar(100,100,500,140);
    DElay(Random(10000));
end;

procedure OnLump;
var 
    n,i:   integer;
begin
    OffLump;
    SetLineStyle(SolidLn,0,NormWidth);
    SetFillStyle(SolidFill,Black);
    n := Random(3)+3;
    For i:=1 To n Do
        OnFlash;
    SetFillStyle(SolidFill,WHITE);
    Bar(100,100,500,140);
end;

procedure DrawLump;
begin
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
end;

var 
    gd,gm:   integer;
    c:   char;
begin
    gd := DETECT;
    InitGraph(gd,gm,'');
    If GraphResult<>0 then halt;
    Randomize;
    OutTextXY(100,300,'Press O to make lump On');
    OutTextXY(100,330,'Press F to make lump Off');
    OutTextXY(100,360,'Press ESC to exit');
    SetBkColor(BLACK);
    DrawLump;
    OffLump;
    Repeat
        c := ReadKey;
        case c of 
            'o','O':   OnLump;
            'f','F':   OffLump;
        end;
    Until c=#27;
    CloseGraph;
end.
