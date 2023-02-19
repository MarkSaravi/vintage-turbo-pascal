
program Miz;

Uses 
crt,graph;

Var 
    gd,gm:   Integer;
Begin
    gd := Detect;
    InitGraph(gd,gm,'');
    If GraphResult<>0 Then Halt;
    SetColor(1);
    SetFillStyle(1,14);
    Bar3D(120,300,100,400,10,TopOn);
    FloodFill(125,300,1);
    SetFillStyle(1,14);
    FloodFill(120,300,1);
    Bar3D(400,300,380,400,10,TopOn);
    FloodFill(405,350,1);
    Bar3D(200,230,180,330,10,TopOn);
    FloodFill(205,280,1);
    Bar3D(480,230,460,330,10,TopOn);
    FloodFill(485,280,1);
    SetColor(2);
    Bar3D(100,290,400,310,90,TopOn);
    SetFillStyle(1,14);
    FloodFill(300,250,2);
    FloodFill(480,240,2);
    FloodFill(340,300,2);
    SetColor(12);
    Ellipse(300,200,0,360,30,10);
    Ellipse(300,200,0,360,25,7);
    Ellipse(300,250,180,360,20,7);
    Line(270,200,280,250);
    Line(330,200,320,250);
    SetFillStyle(1,12);
    FloodFill(320,240,12);
    ReadKey;
    CloseGraph;
End.
