unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, jpeg,
  Buttons;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cckecil: TLabel;
    ccbesar: TLabel;
    spdcpt: TLabel;
    spdlmbt: TLabel;
    hrgmahal: TLabel;
    predic: TLabel;
    hrgmurahh: TLabel;
    cht1: TChart;
    fstlnsrsSeries1: TFastLineSeries;
    fstlnsrsSeries2: TFastLineSeries;
    cht2: TChart;
    fstlnsrs1: TFastLineSeries;
    fstlnsrs2: TFastLineSeries;
    cht3: TChart;
    fstlnsrs3: TFastLineSeries;
    fstlnsrs4: TFastLineSeries;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    img1: TImage;
    btn2: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cckcl ,ccbsr : Real;
  mahal : array[0..1] of Real = (0,0);
  murah : array[0..1] of Real = (0,0);
  hpkcl,hpbsr : Real;
  mhl,mrh : Real;
  harga : Real;
  sumRndh : Integer;
  sumTnggi: Integer;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
   if StrToInt(Form1.edt1.Text)<=1000 then begin
    cckcl := 1;
    ccbsr := 0;
  end
  else if StrToInt(Form1.edt1.Text)>=2500 then begin //hp terbesar 2320
    cckcl := 0;
    ccbsr := 1;
  end
  else begin
    cckcl := (2500- StrToInt(Form1.edt1.Text)) /1500;
    ccbsr := (StrToInt(Form1.edt1.Text) -1000) /1500;
  end;

  Form1.cckecil.Caption:= FloatToStr(cckcl);
  Form1.ccbesar.Caption:= FloatToStr(ccbsr);

  if StrToInt(Form1.edt2.Text)<=100 then begin
    hpkcl := 1;
    hpbsr := 0;
  end
  else if StrToInt(Form1.edt2.Text)>=200 then begin //hp terbesar 250
    hpkcl := 0;
    hpbsr := 1;
  end
  else begin
    hpkcl := (200- StrToInt(Form1.edt2.Text)) /100;
    hpbsr := (StrToInt(Form1.edt2.Text) -100) /100;
  end;

  Form1.spdcpt.Caption:= FloatToStr(hpbsr);
  Form1.spdlmbt.Caption:= FloatToStr(hpkcl);
///RULES
  if hpkcl <= cckcl then murah[0]:=hpkcl else murah[0]:= cckcl;
  if hpbsr <= cckcl then murah[1]:=hpbsr else murah[1]:= cckcl;
  if hpkcl <= ccbsr then mahal[0]:=hpkcl else mahal[0]:= ccbsr;
  if hpbsr <= ccbsr then mahal[1]:=hpbsr else mahal[1]:= ccbsr;

  if murah[0] >= murah[1] then mrh:=murah[0] else mrh:=murah[1];
  if mahal[0] >= mahal[1] then mhl:=mahal[0] else mhl:=mahal[1];


  form1.hrgmahal.Caption := FloatToStr(mhl);
  Form1.hrgmurahh.Caption := FloatToStr(mrh);

  sumRndh := 141050000 + 260000000 + 190000000 ;
  sumTnggi:= 387000000 + 300000000 + 290000000 ;
  harga := Round(((sumRndh*mrh)+(sumTnggi*mhl))/((3*mrh)+(3*mhl)));
  Form1.predic.Caption := 'Rp. ' +FloatToStr(harga);

  form1.cht1.Series[0].AddX(ccbsr,'ccbesar', clRed);
  form1.cht1.Series[0].AddX(cckcl,'cckecil', clBlue);

  form1.cht2.Series[0].AddX(hpbsr,'hpbesar', clRed);
  form1.cht2.Series[0].AddX(hpkcl,'hpkecil', clBlue);

  form1.cht1.Series[0].AddX(mrh,'Murah', clRed);
  form1.cht1.Series[0].AddX(mhl,'Mahal', clBlue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
cckcl:=0;
ccbsr:=0;
end;

end.
