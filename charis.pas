{$r+}
unit charis;
interface

const animation: boolean = true;
const filename:string = 'charis.in';
{
Input source, if need console change above filename := 'con'/'charis.out'
(*READ_FILE
(*READ_GUI*)

Switch GUI
(*GUI_TRUE*)
(*GUI_FALSE

Kind of GUI
(*GUI_TURBO*)
(*GUI_ABC

Write answer to charis.out
(*WRITE_FILE

Turbo no supported
(*FINALIZED_UNIT

}

procedure Left;
procedure Lefts(Count:integer);
procedure Right;
procedure Rights(Count:integer);
procedure Up;
procedure Ups(Count:integer);
procedure Down;
procedure Downs(Count:integer);
procedure RightUp;
procedure RightUps(Count:integer);
procedure RightDown;
procedure RightDowns(Count:integer);
procedure LeftUp;
procedure LeftUps(Count:integer);
procedure LeftDown;
procedure LeftDowns(Count:integer);
{swap names}
procedure UpRight;
procedure UpRights(Count:integer);
procedure DownRight;
procedure DownRights(Count:integer);
procedure UpLeft;
procedure UpLefts(Count:integer);
procedure DownLeft;
procedure DownLefts(Count:integer);


procedure Circle;
procedure Bar;
procedure Jump;
procedure Jumps(Count:integer);
procedure JumpDown;
procedure JumpDowns(Count:integer);
procedure JumpZero;
procedure Worm;
procedure Turttle;
procedure Pause;
procedure Finish;
procedure Draw(s:string);
function getCRC:longint;
function getLen:longint;
procedure Turt;



procedure B;
procedure P;
procedure C;
{procedure W;   }
procedure T;

procedure U;
procedure D;
procedure R;
procedure L;

procedure Us(Count:integer);
procedure Ds(Count:integer);
procedure Rs(Count:integer);
procedure Ls(Count:integer);

procedure J;
procedure Js(Count:integer);
procedure JD;
procedure JDs(Count:integer);
procedure JZ;


procedure UR;
procedure URs(Count:integer);
procedure DR;
procedure DRs(Count:integer);
procedure UL;
procedure ULs(Count:integer);
procedure DL;
procedure DLs(Count:integer);
procedure RU;
procedure RUs(Count:integer);
procedure RD;
procedure RDs(Count:integer);
procedure LU;
procedure LUs(Count:integer);
procedure LD;
procedure LDs(Count:integer);

procedure Point;
procedure Debug;
procedure NoDebug;
procedure SetDebug(delay:integer);

(*GUI_ABC
procedure MakePicture(s:string);
procedure MakePicture(s:string;width:integer);
(**)

var
  i,i1,i2,i3:longint;

function N:longint;
function M:longint;
function K:longint;
function X1:longint;
function Y1:longint;
function X2:longint;
function Y2:longint;
function Z:longint; {for array A[z,z]}
function W:longint; {for array DX[W], DY[W]}

var a:array[1..20,1..20] of integer;
var dx:array[1..100] of integer;
var dy:array[1..100] of integer;


Type Proc = Procedure;

procedure F;
procedure Flag;

procedure ForN(pr:proc;counter:integer);


implementation
(*GUI_TURBO*)
uses graph, crt;
(**)
(*GUI_ABC
uses graphABC;
(**)


var
  TimeDelay:longint;
  finalpresent:boolean;
  picSizeX:integer;
  makePic:boolean;

var
  needRedraw:boolean;
  scount:integer;
  isWorm : integer;
  crcjpz:boolean;
  crcjpd:boolean;
var 
  FlagCount:integer;


  
  var
    Xpos,Ypos:integer;
    prevXpos,prevYpos:integer;

    crcWorm:longint;
    crcTurttle:longint;

    crcO:longint;

    crc2:longint;

    {flags for CRC turttle}
    const smax = 10000;
    var
    fl:array[0..smax] of byte;

    {flags for CRC worm}
    flwx:array[0..smax] of integer;
    flwy:array[0..smax] of integer;
    flwc:integer;


    {array for store program}
    var
    s:array[0..smax] of byte;
    
  
  

var valZ,valW,valN,valM,valK,ValX1,ValX2,ValY1,ValY2:longint;

function getCRC2:longint;forward;

procedure ClrWrite(s:string); forward;

procedure WriteAnswer;
var out:text;
    s:string;
Begin
(*WRITE_FILE
  assign(out,'charis.out');rewrite(out);
  writeln(out,getCrc2);
  close(out);
  assign(out,'charsize.out');rewrite(out);
  writeln(out,getCrc2,' ',getLen);
  close(out);

  if (crcjpz and crcjpd) then s:='TRUE' else s:='FALSE';
  assign(out,'charnojp.out');rewrite(out);
  writeln(out,getCrc2,' ',s);
  close(out);

  if (crcjpz) then s:='TRUE' else s:='FALSE';
  assign(out,'charnojz.out');rewrite(out);
  writeln(out,getCrc2,' ',s);
  close(out);
(**)
end;


(*READ_FILE
procedure readNM;
var ft:text;
begin
  assign(ft,filename);reset(ft);
  if(not eof(ft)) then read(ft,valN);
  if(not eof(ft))and(not eoln(ft)) then read(ft,valM);
  if(not eof(ft))and(not eoln(ft)) then read(ft,valK);
end;

procedure readXY;
var ft:text;
begin
  assign(ft,filename);reset(ft);
  if(not eof(ft)) then read(ft,valX1);
  if(not eof(ft))and(not eoln(ft)) then read(ft,valY1);
  if(not eof(ft))and(not eoln(ft)) then read(ft,valX2);
  if(not eof(ft))and(not eoln(ft)) then read(ft,valY2);
end;

procedure readArrayA;
var ft:text;
var i,j:integer;
begin
  assign(ft,filename);reset(ft);
  if(not eof(ft)) then read(ft,valZ);
  for j:=1 to valZ do
  for i:=1 to valZ do
    begin
      Read(ft,a[i,j]);
    end;
  close(ft);
end;

procedure readArrayXY;
var ft:text;
var i:integer;
begin
  assign(ft,filename);reset(ft);
  if(not eof(ft)) then read(ft,valW);
  for i:=1 to valW do
    begin
      Read(ft,dx[i],dy[i]);
    end;
  close(ft);
end;

function N:longint;
begin
  if(valN<0)then
    readNM;
  N:=valN;
end;

function M:longint;
begin
  if(valM<0)then
    readNM;
  M:=valM;
end;

function K:longint;
begin
  if(valK<0)then
    readNM;
  K:=valK;
end;

function X1:longint;
begin
  if(valX1<0)then
    readXY;
  X1:=valX1;
end;

function Y1:longint;
begin
  if(valY1<0)then
    readXY;
  Y1:=valY1;
end;

function X2:longint;
begin
  if(valX2<0)then
    readXY;
  X2:=valX2;
end;

function Y2:longint;
begin
  if(valY2<0)then
    readXY;
  Y2:=valY2;
end;

function Z:longint;
begin
  if(valZ<0)then
    readArrayA;
  Z:=valZ;
end;

function W:longint;
begin
  if(valW<0)then
    readArrayXY;
  W:=valW;
end;
(**)

(*READ_GUI*)
function N:longint;
begin
  if(valN<0)then
  begin
    ClrWrite('Enter value N:'); Read(valN);
    needRedraw := true;
  end;
  N:=valN;
end;


function M:longint;
begin
  if(valM<0)then
  begin
    N;
    ClrWrite('Enter value M:'); Read(valM);
    NeedRedraw:=true;
  end;
  M:=valM;
end;

function K:longint;
begin
  if(valK<0)then
  begin
    M;
    ClrWrite('Enter value K:'); Read(valK);
    NeedRedraw:=true;
  end;
  K:=valK;
end;

function X1:longint;
begin
  if(valX1<0)then
  begin
    ClrWrite('Enter value X1:'); Read(valX1);
    NeedRedraw:=true;
  end;
  X1:=valX1;
end;

function Y1:longint;
begin
  if(valY1<0)then
  begin
    X1;
    ClrWrite('Enter value Y1:'); Read(valY1);
    NeedRedraw:=true;
  end;
  Y1:=valY1;
end;

function X2:longint;
begin
  if(valX2<0)then
  begin
    Y1;
    ClrWrite('Enter value X2:'); Read(valX2);
    NeedRedraw:=true;
  end;
  X2:=valX2;
end;

function Y2:longint;
begin
  if(valY2<0)then
  begin
    X2;
    ClrWrite('Enter value Y2:'); Read(valY2);
    NeedRedraw:=true;
  end;
  Y2:=valY2;
end;

function Z:longint;
var i,j:integer;
    si,sj:string;
begin
  if(valZ<0)then
  begin
    ClrWrite('Enter value Z:'); Read(valZ);
    for j:=1 to valZ do
    for i:=1 to valZ do
    begin
      str(i,si);
      str(j,sj);
      ClrWrite('Enter A['+si+','+sj+']:');
      Read(a[i,j]);
    end;
    NeedRedraw:=true;
  end;
  Z:=valZ;
end;

function W:longint;
var i,j:integer;
  si:string;
begin
  if(valW<0)then
  begin
    ClrWrite('Enter value W:'); Read(valW);
    for i:=1 to valW do
    begin
      str(i,si);
      ClrWrite('Enter DX['+si+']:');
      Read(dx[i]);
      ClrWrite('Enter DY['+si+']:');
      Read(dy[i]);
    end;
    NeedRedraw:=true;
  end;
  W:=valW;
end;
(**)


(*GUI_TRUE*)
{uses graph,crt;{}
procedure SavePic;forward;
procedure redraw;forward;

var
  deltaX,deltaY,maxx,maxy,barSizeX,barSizeY:integer;
  startDy:integer;
  debugCount:integer;
  FlagPresent:boolean;

procedure prepareLine;forward;
procedure DrawGrid; forward;
procedure finishLine;forward;

procedure ReDraw;
var i,j:integer;
begin

  needRedraw := false;

  while (xPos>=maxX) do maxX:=maxX+8;
  while (yPos>=maxy) do if(maxY<8) then maxY:=8 else maxY:=maxY+8;

  isWorm := 0;
  xpos := 0;
  ypos := 0;

  DrawGrid;
  {for set line style}
  prepareLine;
  finishLine;
  
  isWorm := 0;

  j := scount;
  scount := 0;

  crcO:=0;
  crc2:=0;
  crcWorm:=0;
  crcTurttle:=0;
  flagCount:=0;

  for i:=0 to smax do fl[i]:=0;
  for i:=0 to smax do flwx[i]:=0;
  for i:=0 to smax do flwy[i]:=0;
  flwc:=0;



  for i:=1 to j do
  case s[i] of
    1: Right;
    2: Left;
    3: Up;
    4: Down;
    5: RightUp;
    6: RightDown;
    7: LeftUp;
    8: LeftDown;
    9: Circle;
    10: Jump;
    11: Worm;
    12: Turttle;
    13: Bar;
    14: JumpDown;
    15: JumpZero;
    18: Point;
    19: Flag;
  end;
end;

function getLineWidth:integer;
var r:integer;
begin
  r:=(barsizex div 20)*2+1;
  if (r=1) then r:=3;
  getLineWidth := r;
end;
(**)




(*GUI_ABC

procedure MakePicture(s:string);
begin
  makePicture(s,160);
end;

procedure MakePicture(s:string;width:integer);
begin
  makePic := true;
  picSizeX := width;
  TimeDelay := 0;
  redraw;
  Window.Save(s);
  
  makePic := false; 
end;

procedure initVideo;
var gd,gm:integer;
begin
  //gd := detect;
  //initgraph(gd,gm,'');
  //DirectVideo := false;
  
  if (paramcount>1)and((paramstr(1)='pic')or(paramstr(1)='picBig')) then
  begin
    makePic := true;
    picSizeX := 160;
    if((paramstr(1)='picBig')) then picSizeX:=320;
  end;
end;


Procedure ResizeWindow(w:integer;h:integer);
begin
  window.SetSize(w,h);
end;

procedure savePic;
begin
  if(not FlagPresent)and(maxy<8) then begin maxy:=8; redraw; end;

  Window.Save(paramstr(2));
end;

procedure delay(i:integer);
begin
  sleep(i);
end;


function getmaxx:integer;
begin
  if makePic then
    if(maxx<=8)and(not FlagPresent) then
      getmaxx := picSizeX
    else
      if (maxx>8) and FlagPresent then
        getmaxx := picSizeX*4
      else
        getmaxx := picSizeX*2
  else
    getmaxx := 800;
end;

function getmaxy:integer;
begin
  getmaxy := 600; {Window.Height;}
end;

procedure mybar(x1,y1,x2,y2:integer);
begin
  //bar(x1,y1,x2,y2);
  FillRectangle(x1,y1,x2+1,y2+1);
  DrawRectangle(x1,y1,x2+1,y2+1);
end;

procedure mycircle(x1,y1,x2:integer);
begin
  circle(x1,y1,x2);
end;

procedure drawLineEnd(x1,y1:integer);
var r:integer;
begin
  brush.Color := pen.color;
  r:= getLineWidth div 2;
  if r>1 then FillCircle(x1,y1,r);
end;

procedure drawstep(i:integer);
begin
  //gotoxy(1,1);
  //writeln(scount,#13);

   TextOut(0,0,i.ToString);
end;

procedure myFillEllipse(x1,y1,x2,y2:integer);
begin
  //FillEllipse(x1,y1,x2,y2);
  FillEllipse(x1-x2,y1-y2,x1+x2,y1+y2);
end;

procedure setLineColor;
begin
    //graph.setcolor(blue);
    //graph.SetLineStyle(0,0,3);
    pen.Color := clBlue;
    pen.Width := 3;
    pen.Width := getLineWidth;
    //if getmaxx <100 then pen.Width := 2;
end;

procedure setGridColor;
begin
  //setcolor(lightgray);
  //setfillstyle(1,white);
  //SetLineStyle(0,0,1);

  if makePic then
    pen.Color := clGray
  else 
    pen.Color := clLightGray;
  pen.Width := (getLineWidth div 4)*2+1;
  brush.Color := clWhite;
end;

procedure setBarColor;
begin
	setGridColor;
  Brush.Color := clBlue;
end;

procedure setFlagColor;
begin
  //graph.setColor(3);
  //SetLineStyle(0,0,(barsizeY div 20)*+1);
  pen.Color := clDarkCyan;
  pen.Width := ((getLineWidth-1)*8) div 10;
end;

procedure setFlagTextColor(w:integer);
begin
  //graph.setColor(4);
  pen.Color := clRed;

  //SetLineStyle(0,0, w);
  pen.Width := w;
end;

procedure setCircleColor;
begin
  pen.Color := clBlue;
  pen.Width := getLineWidth;
  brush.Color := clWhite; 
end;

procedure setPointColor;
begin
	  {graph.setcolor(Green);}
	  //graph.setfillstyle(1,2);
  
  brush.Color := clGreen;
  pen.Color := clBlue;
  pen.Width := 1;
end;

procedure setTextColor;
begin
  font.Color := clBlack;
  brush.Color := clWhite;
end;

procedure ClrWrite(s:string);
begin
  setTextColor;
  Window.Clear;
  TextOut(0,0,s);
  //write(s);
end;

Procedure DrawPause;
begin
  {point;}
  //if(TimeDelay>0) then writeln('End');
  if not makePic then readln;
  //readkey;
  //closegraph;
end;


procedure Clear;
begin
  window.Clear;
end;
(**)


(*GUI_TURBO*)

const clBlue: integer = Blue;
const clWhite: integer = White;


procedure initVideo;
var gd,gm:integer;
begin
  gd := detect;
  initgraph(gd,gm,'');
  DirectVideo := false;
end;

procedure savePic;
begin
end;

Procedure ResizeWindow(w:integer;h:integer);
begin
end;

procedure mybar(x1,y1,x2,y2:integer);
begin
  graph.bar(x1,y1,x2,y2);
end;

procedure mycircle(x1,y1,x2:integer);
begin
  graph.circle(x1,y1,x2);
end;

procedure drawLineEnd(x1,y1:integer);
var r:integer;
begin
{  //brush.Color := pen.color;
  //r:= getLineWidth div 2;
  //if r>1 then FillCircle(x1,y1,r);
}
end;

procedure drawstep(i:integer);
begin
  gotoxy(1,1);
  writeln(i);
end;

procedure myFillEllipse(x1,y1,x2,y2:integer);
begin
  FillEllipse(x1,y1,x2,y2);
  {FillEllipse(x1-x2,y1-y2,x1+x2,y1+y2);}
end;

procedure setBarColor;
begin
	setfillstyle(1,blue);
end;

procedure setGridColor;
begin
  setcolor(lightgray);
  setfillstyle(1,white);
  SetLineStyle(0,0,1);
end;

procedure setFlagColor;
var c:integer;
begin
  graph.setColor(3);
  c:=(getLineWidth-1)*8 div 10;
  if(c>3) then c:=3;
  SetLineStyle(0,0,c);
end;

procedure setLineColor;
var c:integer;
begin
    graph.setcolor(blue);
  c:=(getLineWidth);
  if(c>3) then c:=3;
  SetLineStyle(0,0,c);
end;


procedure setFlagTextColor(w:integer);
begin
  graph.setColor(4);

  SetLineStyle(0,0, w);
end;

procedure setCircleColor;
begin
  setLineColor;
end;

procedure setPointColor;
begin
	graph.setcolor(Green);
	graph.setfillstyle(1,Green);
end;

procedure setTextColor;
begin
end;

procedure ClrWrite(s:string);
begin
  write(s);
end;

Procedure DrawPause;
begin
  {point;}
  {if(TimeDelay>0) then writeln('End');}
  readkey;
  {closegraph;}
end;

procedure Clear;
begin

end;
(**)

(*GUI_TRUE*)
procedure WormDraw(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
var r,x1,x2,x,y,y1,y2:integer;
begin
    setLineColor;

    if(animation and (TimeDelay >=100)) and (scount>=debugCount)then
    begin

      x1:=(prevxpos+0)*barsizex+deltaX;
      y1:=(prevypos+0)*barsizey+deltaY;
      x2:=(xpos+0)*barsizex+deltaX;
      y2:=(ypos+0)*barsizey+deltaY;

      moveto(x1,y1);
      DrawLineEnd(x1,y1);


      for i:=1 to 10 do
      begin

        x:=(x2-x1)*i div 10+x1;
        y:=(y2-y1)*i div 10+y1;
        lineto(x,y);
        DrawLineEnd(x,y);
        putpixel(x,y,clWhite);
        delay(TimeDelay div 10);
        putpixel(x,y,clBlue);
      end;
    end
    else
    begin

    moveto((prevxpos+0)*barsizex+deltaX,(prevypos+0)*barsizey+deltaY);
    lineto((xpos+0)*barsizex+deltaX,(ypos+0)*barsizey+deltaY);

    DrawLineEnd((prevxpos+0)*barsizex+deltaX,(prevypos+0)*barsizey+deltaY);
    DrawLineEnd((xpos+0)*barsizex+deltaX,(ypos+0)*barsizey+deltaY);

    end;
{
    moveto((prevxpos+0)*barsizex+deltaX-1,(prevypos+0)*barsizey+deltaY-1);
    lineto((xpos+0)*barsizex+deltaX    -1,(ypos+0)*barsizey+deltaY    -1);

    moveto((prevxpos+0)*barsizex+deltaX+1,(prevypos+0)*barsizey+deltaY+1);
    lineto((xpos+0)*barsizex+deltaX    +1,(ypos+0)*barsizey+deltaY    +1);

    moveto((prevxpos+0)*barsizex+deltaX+1,(prevypos+0)*barsizey+deltaY-1);
    lineto((xpos+0)*barsizex+deltaX    +1,(ypos+0)*barsizey+deltaY    -1);

    moveto((prevxpos+0)*barsizex+deltaX-1,(prevypos+0)*barsizey+deltaY+1);
    lineto((xpos+0)*barsizex+deltaX    -1,(ypos+0)*barsizey+deltaY    +1);
}
end;


procedure TurttleDraw(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
begin
  setBarColor;

	mybar((prevxpos+0)*barsizex+deltaX+1,(prevypos+0)*barsizey+deltaY+1,
    	(prevxpos+1)*barsizex+deltaX-1,(prevypos+1)*barsizey+deltaY-1);
	mybar((xpos+0)*barsizex+deltaX+1,(ypos+0)*barsizey+deltaY+1,
    	(xpos+1)*barsizex+deltaX-1,(ypos+1)*barsizey+deltaY-1);
end;

procedure FinalProc;
begin
  if makePic then
    SavePic;
  writeAnswer;
end;

Procedure AfterStep(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
Begin
  if (TimeDelay >10) and (scount>debugCount) then
  begin
    drawStep(scount);
    if not animation then
    begin
      putpixel((prevxpos+0)*barsizex+deltaX,(prevypos+0)*barsizey+deltaY,clBlue);
      putpixel((xpos+0)*barsizex+deltaX,(ypos+0)*barsizey+deltaY,clWhite);
      delay(TimeDelay);
    end;
    debugCount := scount;
  end;
  if(xpos+isWorm>maxx) or (ypos+isWorm>maxy) then redraw;
end;


var flagX:integer;
    flagY:integer;
    flagD:integer;


procedure lt(x:integer;y:integer);
begin
  lineto(flagx+x*flagd,flagy+y*flagd);
end;

procedure mt(x:integer;y:integer);
begin
  moveto(flagx+x*flagd,flagy+y*flagd);
end;

procedure drc(i:integer);
begin
  if(i>=10) then
  begin
    drc(i div 10);
    flagx:=flagx+flagd+2;
    drc(i mod 10);
  end;
  mt(0,0);
  if i=0 then begin lt(1,0);lt(1,2);lt(0,2);lt(0,0);end;
  if i=1 then begin mt(0,1);lt(1,0);lt(1,2);end;
  if i=2 then begin lt(1,0);lt(1,1);lt(0,2);lt(1,2);end;
  if i=3 then begin lt(1,0);lt(0,1);lt(1,1);lt(1,2);lt(0,2);end;
  if i=4 then begin lt(0,1);lt(1,1);lt(1,0);lt(1,2);end;
  if i=5 then begin lt(1,0);mt(0,0);lt(0,1);lt(1,1);lt(1,2);lt(0,2);end;
  if i=6 then begin mt(1,0);lt(0,1);lt(1,1);lt(1,2);lt(0,2);lt(0,1);end;
  if i=7 then begin lt(1,0);lt(0,2);end;
  if i=8 then begin lt(1,0);lt(1,2);lt(0,2);lt(0,0);mt(0,1);lt(1,1);end;
  if i=9 then begin lt(1,0);lt(1,1);lt(0,2);mt(0,0);lt(0,1);lt(1,1); end;

end;


procedure DrawFlag(xpos:integer;ypos:integer;flagCount:integer);
	var prevxpos:integer;
		prevypos:integer;
begin
	
	
	prevxpos:=xpos;
	prevypos:=ypos;
  
  setFlagColor;

  moveTo((prevxpos+0)*barsizex+deltaX+barsizex*0 div 10,(prevypos+0)*barsizey+deltaY+barsizey*0 div 10);
  lineTo((prevxpos+0)*barsizex+deltaX+barsizex*0 div 10,(prevypos+0)*barsizey+deltaY+barsizey*-8 div 10);
  drawLineEnd((prevxpos+0)*barsizex+deltaX+barsizex*0 div 10,(prevypos+0)*barsizey+deltaY+barsizey*-8 div 10);
  lineTo((prevxpos+0)*barsizex+deltaX+barsizex*5 div 10,(prevypos+0)*barsizey+deltaY+barsizey*-5 div 10);
  drawLineEnd((prevxpos+0)*barsizex+deltaX+barsizex*5 div 10,(prevypos+0)*barsizey+deltaY+barsizey*-5 div 10);
  lineTo((prevxpos+0)*barsizex+deltaX+barsizex*0 div 10,(prevypos+0)*barsizey+deltaY+barsizey*-2 div 10);
  flagd:=barsizey div 10+1;


  if flagd<2 then flagd:=2;

  flagx := (prevxpos+0)*barsizex+deltaX+barsizex*1 div 10+1;
  flagy := (prevypos+0)*barsizey+deltaY+barsizey*-5 div 10- flagd;

  setFlagTextColor(flagd div 5 + 1);

  drc(flagcount);

  if (not FlagPresent)and(ypos=0) then
  begin
    deltaY:=deltaY+barSizeY;
    flagPresent := true;
    needredraw:=true;
  end;

end;



procedure DrawPoint(xpos:integer;ypos:integer);
begin

   setPointColor;
	 myfillellipse(
	    (xpos+0)*barsizex+deltaX,(ypos+0)*barsizey+deltaY,
	    barsizex div 10+1, barsizey div 10+1);
	
end;


Procedure DrawCircle(xpos:integer;ypos:integer);
begin
  setCircleColor;
  mycircle(
    (xpos+0)*barsizex+deltaX+barsizex div 2,
    (ypos+0)*barsizey+deltaY+barsizey div 2,
    (((barsizex-getLineWidth) div 3)and $FFE)+1);
end;

Procedure DrawBar(xpos:integer;ypos:integer);
begin
    setBarColor;
    mybar((xpos+0)*barsizex+deltaX+1,(ypos+0)*barsizey+deltaY+1,
        (xpos+1)*barsizex+deltaX-1,(ypos+1)*barsizey+deltaY-1);
end;


procedure DrawGrid;
var i,j:integer;
begin
  barSizex := 3;
  barSizey := 3;

  deltaY:= startdy;

  if FlagPresent or (TimeDelay>=100) then
    barSizex := (getmaxy-deltaY-deltaY) div (maxy+1)
  else
    barSizex := (getmaxy-deltaY-deltaY) div (maxy);


  i := (getmaxX-deltaX-deltaX) div (maxx);

  if(i<barSizeX) then barSizeX := i;

  barsizey := barsizex;

  if FlagPresent or (TimeDelay>=100) then
  begin
    deltaY:=startdy+barSizeY;
  end;
  
  i:=getmaxy;

  if(getmaxx=639) and(getmaxy=479) then barSizex:=longint(barSizeX)*1000 div 1200;

  ResizeWindow(maxx*barSizex+startdy*2,maxy*barsizeY+deltaY+startdY);

{
  for i:=0 to getmaxy do
  begin
    moveto(0,i);
    lineto(getmaxx,i);
  end;
}

  setGridColor;
  mybar(0,0,getmaxx,getmaxy);
  clear;
  
  for i:=0 to maxx-1 do
  for j:=0 to maxy-1 do
  begin
    moveto((i+0)*barsizex+deltaX,(j+0)*barsizey+deltaY);
    lineto((i+0)*barsizex+deltaX,(j+1)*barsizey+deltaY);
    lineto((i+1)*barsizex+deltaX,(j+1)*barsizey+deltaY);
    lineto((i+1)*barsizex+deltaX,(j+0)*barsizey+deltaY);
    lineto((i+0)*barsizex+deltaX,(j+0)*barsizey+deltaY);
  end;

end;


Procedure PrepareDraw;
var gm,gd:integer;
begin

  deltaX := 10;
  startdy := 10;

  deltaY:=startDy;

  timeDelay := 0;
  needredraw:=false;
  FlagPresent:=false;

  InitVideo;
  maxx := 8;
  if(makepic) then 
    maxy := 1
  else
    maxy := 8;

  DrawGrid;

end;
(**)


(*GUI_FALSE
procedure ClrWrite(s:string);
begin
end;


procedure WormDraw(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
begin
end;

procedure TurttleDraw(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
begin
end;

Procedure AfterStep(prevxpos:integer;prevypos:integer;xpos:integer;ypos:integer);
Begin
end;

Procedure FinalProc;
Begin
  WriteAnswer;
end;

procedure DrawFlag(xpos:integer;ypos:integer;flagCount:integer);
begin
end;

procedure DrawPoint(xpos:integer;ypos:integer);
begin
end;

Procedure DrawCircle(xpos:integer;ypos:integer);
begin
end;

Procedure DrawBar(xpos:integer;ypos:integer);
begin
end;

Procedure DrawPause;
begin
end;

Procedure PrepareDraw;
begin
end;

procedure ReDraw;
begin
  needRedraw := false;
end;
(**)



procedure F;
begin
  Flag;
end;


procedure T;                      Begin Turttle;          End;
{procedure W;                      Begin Worm;          End;}
procedure C;                      Begin Circle;          End;
procedure P;                      Begin Bar;          End;
procedure B;                      Begin Bar;          End;


procedure U;                      Begin Up;          End;
procedure D;                      Begin Down;          End;
procedure R;                      Begin Right;          End;
procedure L;                      Begin Left;          End;

procedure Us(Count:integer);      Begin Ups(Count);  End;
procedure Ds(Count:integer);      Begin Downs(Count);  End;
procedure Rs(Count:integer);      Begin Rights(Count);  End;
procedure Ls(Count:integer);      Begin Lefts(Count);  End;


procedure UR;                      Begin RightUp;          End;
procedure URs(Count:integer);      Begin RightUps(Count);  End;
procedure DR;                      Begin RightDown;        End;
procedure DRs(Count:integer);      Begin RightDowns(Count) End;
procedure UL;                      Begin LeftUp;           End;
procedure ULs(Count:integer);       Begin LeftUps(Count);   End;
procedure DL;                      Begin LeftDown;         End;
procedure DLs(Count:integer);      Begin LeftDowns(Count); End;
procedure RU;                      Begin RightUp;          End;
procedure RUs(Count:integer);      Begin RightUps(Count);  End;
procedure RD;                      Begin RightDown;        End;
procedure RDs(Count:integer);      Begin RightDowns(Count) End;
procedure LU;                      Begin LeftUp;           End;
procedure LUs(Count:integer);       Begin LeftUps(Count);   End;
procedure LD;                      Begin LeftDown;         End;
procedure LDs(Count:integer);      Begin LeftDowns(Count); End;
procedure J;                       Begin Jump;           End;
procedure Js(Count:integer);       Begin Jumps(Count);   End;
procedure JD;                      Begin JumpDown;         End;
procedure JDs(Count:integer);      Begin JumpDowns(Count); End;
procedure JZ;                      Begin JumpZero;         End;






procedure UpRight;                      Begin RightUp;          End;
procedure UpRights(Count:integer);      Begin RightUps(Count);  End;
procedure DownRight;                    Begin RightDown;        End;
procedure DownRights(Count:integer);    Begin RightDowns(Count) End;
procedure UpLeft;                       Begin LeftUp;           End;
procedure UpLefts(Count:integer);       Begin LeftUps(Count);   End;
procedure DownLeft;                     Begin LeftDown;         End;
procedure DownLefts(Count:integer);     Begin LeftDowns(Count); End;






procedure ForN(pr:proc;counter:integer);
var i:integer;
Begin
  for i:=1 to counter do pr;
end;


procedure PrepareLine;
begin
  if(needRedraw) then ReDraw;
  prevXpos := Xpos;
  prevYpos := Ypos;
end;

procedure FinishLine;
var a1,a2,i,j:longint;
begin

  a1 := prevxpos*100+prevypos;
  a2 := xpos*100+ypos;

  if(a2<a1) then
  begin
    i:=a1;
    a1:=a2;
    a2:=i;
  end;

  if(isWorm=0) then
  begin


    if a1<>a2 then
    begin
      j:=0;
      i:=1;
      while i<=flwc do
      begin
        if(flwx[i]=a1) and (flwy[i]=a2) then
        begin
          j:=j+1;
        end;
        i:=i+1;
      end;

      if(j=0) then
      begin
        crcWorm := crcWorm + (a1+7)*(a2+7)+a1+a2;
        crc2 :=  crc2 + a1 + a2;
        flwc:=flwc+1;
        flwx[flwc]:=a1;
        flwy[flwc]:=a2;

{        writeln((a1+7)*(a2+7)+a1+a2,' ',a1,' ',a2,'=',crcWorm);}



      end;
    end;


    WormDraw(prevxpos, prevypos,xpos, ypos);
  end
  else
  begin

    if fl[a1]=0 then begin crcTurttle:=crcTurttle+31*(a1+7); crc2:=crc2 + a1; end;
    fl[a1]:=1;
    if fl[a2]=0 then begin crcTurttle:=crcTurttle+31*(a2+7); crc2:=crc2 + a2; end;
    fl[a2]:=1;

    TurttleDraw(prevxpos, prevypos,xpos, ypos);
  end


end;

function getLen:longint;
var i,j:longint;
begin
  j:=0;
  for i:=1 to scount do
    if (s[i]=0)or(s[i]=11)or(s[i]=12) then else j:=j+1;
  getLen := j;
end;

function getCRC2:longint;
begin
  getCRC2 := ((crcTurttle+crcWorm+crcO + crc2) mod 10000000+47)*31;
end;



procedure checkSize(i:integer);
begin
  scount:= scount + 1;
  if(scount>smax-2) then halt;
  s[scount] := i;
  AfterStep(prevxpos, prevypos,xpos, ypos);
  if(not finalPresent) then begin finalProc; writeAnswer;end;
end;


procedure Left;
begin
  prepareLine;
  xpos:=xpos-1;
  finishLine;

  checkSize(2);

end;

procedure Lefts(Count:integer);
var i:integer;
begin
  for i:=1 to count do left;
end;

procedure Right;
begin
  prepareLine;
  xpos:=xpos+1;
  finishLine;

  checkSize(1);

end;

procedure Rights(Count:integer);
var i:integer;
begin
  for i:=1 to count do Right;
end;

procedure Up;
begin
  prepareLine;
  ypos:=ypos-1;
  finishLine;

  checkSize(3);
end;

procedure Ups(Count:integer);
var i:integer;
begin
  for i:=1 to count do Up;
end;

procedure Down;
begin
  prepareLine;
  ypos:=ypos+1;
  finishLine;

  checkSize(4);
end;

procedure Downs(Count:integer);
var i:integer;
begin
  for i:=1 to count do Down;
end;

procedure RightUp;
begin
  prepareLine;
  ypos:=ypos-1;
  xpos:=xpos+1;
  finishLine;

  checkSize(5);
end;

procedure RightUps(Count:integer);
var i:integer;
begin
  for i:=1 to count do RightUp;
end;

procedure RightDown;
begin
  prepareLine;
  ypos:=ypos+1;
  xpos:=xpos+1;
  finishLine;

  checkSize(6);

end;

procedure RightDowns(Count:integer);
var i:integer;
begin
  for i:=1 to count do RightDown;
end;



procedure LeftUp;
begin
  prepareLine;
  ypos:=ypos-1;
  xpos:=xpos-1;
  finishLine;

  checkSize(7);
end;

procedure LeftUps(Count:integer);
var i:integer;
begin
  for i:=1 to count do LeftUp;
end;

procedure LeftDown;
begin
  prepareLine;
  ypos:=ypos+1;
  xpos:=xpos-1;
  finishLine;

  checkSize(8);
end;

procedure LeftDowns(Count:integer);
var i:integer;
begin
  for i:=1 to count do LeftDown;
end;

procedure Debug;
begin
  setDebug(500);
end;

procedure SetDebug(delay:integer);
begin
  if(not MakePic) then
  begin
    if(TimeDelay=0)or(delay=0) then
      NeedRedraw := true;
    TimeDelay := delay;
  end;
end;

procedure NoDebug;
begin
  TimeDelay := 0;
  NeedRedraw := true;
end;


procedure Flag;
var a1:longint;
begin
  prepareLine;
  finishLine;
  FlagCount:=FlagCount+1;

  a1 := prevxpos*100+prevypos;

  crcTurttle := crcTurttle + (a1+13)*FlagCount;
  crcWorm := crcWorm + (a1+13)*FlagCount;
  crc2 := crc2 + a1*FlagCount;


  DrawFlag(xpos,ypos,flagCount);
  
  checkSize(19);

  if needredraw then ReDraw;
  
end;



procedure point;
begin
  prepareLine;
  finishLine;


  DrawPoint(xpos, ypos);
  checkSize(18);


end;

procedure Circle;
var a1,a2:longint;
begin
  prepareLine;
  finishLine;

  a1 := prevxpos*100+prevypos;
  a2 := xpos*100+ypos;

  crcO := crcO + (a1+7)*(a2+7)+a1+a2+1;


  DrawCircle(xpos,ypos);

  checkSize(9);
end;

procedure Bar;
var a2:longint;
begin

	DrawBar(xpos, ypos);

    a2 := xpos*100+ypos;
    if fl[a2]=0 then begin crcTurttle:=crcTurttle+31*(a2+7); crc2:=crc2+a2; end;
    fl[a2]:=1;


  checkSize(13);
end;







procedure Jump;
var i:integer;
begin

  i:=isWorm;

  isWorm:=0;
  prepareLine;
  finishLine;
  isWorm:=i;
  xpos:=xpos+1;

  checkSize(10);
end;

procedure Jumps(Count:integer);
var i:integer;
begin
  for i:=1 to count do Jump;
end;

procedure JumpDown;
var i:integer;
begin

  crcjpd:=true;

  i:=isWorm;

  isWorm:=0;
  prepareLine;
  finishLine;
  isWorm:=i;
  ypos:=ypos+1;

  checkSize(14);
end;

procedure JumpZero;
var i:integer;
begin
  crcjpz:=true;

  i:=isWorm;

  isWorm:=0;
  prepareLine;
  finishLine;
  isWorm:=i;
  ypos:=0;
  xpos:=0;

  checkSize(15);
end;

procedure JumpDowns(Count:integer);
var i:integer;
begin
  for i:=1 to count do JumpDown;
end;


procedure Worm;
begin
  checkSize(11);
  isWorm:=0;
end;

procedure Turttle;
begin
  checkSize(12);
  isWorm:=1;
end;

procedure Turt;
begin
  Turttle;
end;

procedure Finish;
begin
  Pause;
end;

procedure Pause;
begin
  DrawPause;
  checksize(0);
end;






procedure prepareSpace;
begin

  scount := 0;
  crcO:=0;
  crcWorm:=0;
  crcTurttle:=0;
  FlagCount := 0;

  isWorm := 0;
  xpos := 0;
  ypos := 0;

  PrepareDraw;

end;


procedure Draw(s:string);
var d:string;
    count:integer;
begin
  d:='';
  while(length(s)>0) do
  begin
    count := 1;
    d:=s[1];
    if(d='(') and (length(s)>3) and (s[4]=')') then
    begin
      d := copy(s,2,2);
      delete(s,1,4);
    end
    else
	{(RD)12=(RDs)12}
    if(d='(') and (length(s)>4) and (s[4]='s')and(s[5]=')') then
    begin
      d := copy(s,2,2);
      delete(s,1,5);
    end
    else
    begin
      delete(s,1,1);
    end;


    { Rx7 = R7 }
    if(length(s)>0) and (s[1]='x') then
    begin
      delete(s,1,1);
    end;

    { Rs7 = R7 }
    if(length(s)>0) and (s[1]='x') then
    begin
      delete(s,1,1);
    end;

    {R12}
    if(length(s)>0) and (s[1]>'0') and (s[1]<='9') then
	begin
	  count := 0;
      while(length(s)>0) and (s[1]>'0') and (s[1]<='9') do
      begin
        count := count*10+ byte(s[1])-byte('0');
        delete(s,1,1);
      end;
	end;

	{RxN = RN = Rn   RnDnLnUn}
    if(length(s)>0) and ((s[1]='N')or(s[1]='n')) then
    begin
      count := N;
      delete(s,1,1);
    end;
    if(length(s)>0) and ((s[1]='M')or(s[1]='m')) then
    begin
      count := M;
      delete(s,1,1);
    end;

    if(d='C') then Circle;
    if(d='J') then Jumps(count);
    if(d='R') then Rights(count);
    if(d='L') then Lefts(count);
    if(d='U') then Ups(count);
    if(d='D') then Downs(count);
    if(d='RU') then RightUps(count);
    if(d='RD') then RightDowns(count);
    if(d='LU') then LeftUps(count);
    if(d='LD') then LeftDowns(count);
    if(d='UR') then RightUps(count);
    if(d='DR') then RightDowns(count);
    if(d='UL') then LeftUps(count);
    if(d='DL') then LeftDowns(count);
    if(d='W') then Worm;
    if(d='T') then Turttle;
    if(d='P') then Bar;
    if(d='B') then Bar;
    if(d='F') then Flag;

    if(d='JD') then JumpDowns(count);
    if(d='JZ') then JumpZero;



  end;
  if(needRedraw) then redraw;
end;

function getCRC:longint;
var i,j:longint;
begin
  i := ((crcTurttle+crcWorm) mod 90000) + 10000;

{  writeln(i);
  writeln(crco);
}
  j:= ((i+crcO) mod 9)+1;
  if(crcO=0) then  j := i mod 10;

  i := (i div 10)*10 + j;

  getCRC := i;

end;



procedure init;
begin
  picSizeX := 320;
  valN:=-1;
  valM:=-1;
  valK:=-1;
  valX1:=-1;
  valY1:=-1;
  valX2:=-1;
  valY2:=-1;
  valZ:=-1;
  valW:=-1;
  
  crcjpz:=false;
  crcjpd:=false;

  FlagCount:= 0;

  PrepareSpace;

end;

(*FINALIZED_UNIT*)
begin
  init;
  finalpresent:=false;
{
(**)
initialization
  init;
  finalpresent:=true;
finalization
  finalProc;
  writeAnswer;
  if(makePic)or((paramcount>0)and(paramstr(1)='ans')) then halt;
{}
end.
