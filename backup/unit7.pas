unit Unit7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, StdCtrls,
  ExtCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    btnClear: TButton;
    btnClose: TButton;
    btnHitung: TButton;
    cbJabatan: TComboBox;
    edtNama: TEdit;
    edtGapok: TEdit;
    edtTunjangan: TEdit;
    edtTotalGaji: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgStatus: TRadioGroup;
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  // Event handler FormCreate
end;

procedure TForm4.cbJabatanChange(Sender: TObject);
var
  gaji: Double;
begin
  case cbJabatan.ItemIndex of
    0: gaji := 5000000;  // Jabatan: Direktur
    1: gaji := 3000000;  // Jabatan: Manager
    2: gaji := 1000000;  // Jabatan: Karyawan
  end;

  // Tampilkan gaji pokok ke dalam komponen edtGapok
  edtGapok.Text := FloatToStr(gaji);
end;

procedure TForm5.btnHitungClick(Sender: TObject);
var
  gol, jkerja, jlembur, gapok, glembur, tun_pengabdian: Integer;
  pajakgapok, pajaklembur, totpajak, gajibersih: Double;
begin
  // Mendapatkan input dari komponen-komponen form
  gol := cbJabatan.ItemIndex + 1; // Menggunakan index ComboBox
  jkerja := StrToIntDef(edtTotalGaji.Text, 0); // Menggunakan StrToIntDef untuk menghindari kesalahan

  // Hitung gaji berdasarkan jabatan yang dipilih
  case gol of
    1: // Direktur
    begin
      gapok := 5000000;
      tun_pengabdian := 0; // Tidak ada tunjangan pengabdian untuk Direktur
    end;
    2: // Manager
    begin
      gapok := 3000000;
      tun_pengabdian := 250000; // Tunjangan pengabdian untuk Manager
    end;
    3: // Karyawan
    begin
      gapok := 1000000;
      tun_pengabdian := 200000; // Tunjangan pengabdian untuk Karyawan
    end;
  end;

  if jkerja > 173 then
    jlembur := jkerja - 173
  else
    jlembur := 0;

  glembur := jlembur * 20000;
  pajakgapok := 0.05 * gapok;
  pajaklembur := 0.05 * glembur;
  totpajak := pajakgapok + pajaklembur;
  gajibersih := ((gapok + tun_pengabdian + glembur) - totpajak);

  // Tampilkan hasil perhitungan pada komponen-komponen form
  edtGapok.Text := FloatToStr(gapok);
  edtTunjangan.Text := FloatToStr(tun_pengabdian);
  edtTotalGaji.Text := FloatToStr(gajibersih); // Menampilkan gajibersih di edtTotalGaji
end;


procedure TForm4.btnClearClick(Sender: TObject);
begin
  // Bersihkan inputan pada komponen-komponen form
  cbJabatan.ItemIndex := -1;
  edtTotalGaji.Clear;
  edtGapok.Clear;
  edtTunjangan.Clear;
  edtNama.Clear;
  rgStatus.ItemIndex := -1;
end;

procedure TForm4.btnCloseClick(Sender: TObject);
begin
  // Tutup form
  Close;
end;

procedure TForm4.rgStatusClick(Sender: TObject);
begin
  // Event handler rgStatusClick
end;

end.

