unit Penjualan;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    Hitung: TButton;
    Ulang: TButton;
    Keluar: TButton;
    CbKode: TComboBox;
    ENama: TEdit;
    EHarga: TEdit;
    ESubTotal: TEdit;
    EDiskon: TEdit;
    ETotal: TEdit;
    EJumlahBarang: TEdit;
    Label1: TLabel;
    KodeBarang: TLabel;
    NamaBarang: TLabel;
    Harga: TLabel;
    SubTotal: TLabel;
    Diskon: TLabel;
    TotalBay: TLabel;
    Label8: TLabel;
    procedure UlangClick(Sender: TObject);
    procedure HitungClick(Sender: TObject);
    procedure CbKodeChange(Sender: TObject);
    procedure EJumlahBarangChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    harga_barang: Double;
    function hitungSubtot(jumlah: Integer): Double;
    function hitungDiskon(subtot: Double): Double;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.UlangClick(Sender: TObject);
begin
  // Reset the form by clearing input fields and resetting labels
  CbKode.Text := '';
  ENama.Text := '';
  EHarga.Text := '';
  ESubTotal.Text := '';
  EDiskon.Text := '';
  ETotal.Text := '';
  EJumlahBarang.Text := '';
end;

procedure TForm1.HitungClick(Sender: TObject);
var
  jumlah: Integer;
  subtot, disk, total_bayar: Double;
begin
  // Read the quantity
  jumlah := StrToIntDef(EJumlahBarang.Text, 0);

  // Calculate subtotal
  subtot := hitungSubtot(jumlah);

  // Calculate discount
  disk := hitungDiskon(subtot);

  // Calculate total payment
  total_bayar := subtot - disk;

  // Display the results in the appropriate text fields
  ESubTotal.Text := FormatFloat('#,##0.00', subtotal);
  EDiskon.Text := FormatFloat('#,##0.00', disk);
  ETotal.Text := FormatFloat('#,##0.00', total_bayar);
end;

procedure TForm1.CbKodeChange(Sender: TObject);
begin
  // When the product code changes, update the displayed product name and price
  case CbKode.Text of
    'A01', 'a01':
    begin
      ENama.Text := 'Speaker';
      harga_barang := 50000;
      EHarga.Text := FormatFloat('#,##0.00', harga_barang);
    end;
    'B02', 'b02':
    begin
      ENama.Text := 'Mouse';
      harga_barang := 25000;
      EHarga.Text := FormatFloat('#,##0.00', harga_barang);
    end;
    'C03', 'c03':
    begin
      ENama.Text := 'Harddisk';
      harga_barang := 7500000;
      EHarga.Text := FormatFloat('#,##0.00', harga_barang);
    end;
    'D04', 'd04':
    begin
      ENama.Text := 'Mouse Pad';
      harga_barang := 5000;
      EHarga.Text := FormatFloat('#,##0.00', harga_barang);
    end;
    else
    begin
      ENama.Text := '';
      EHarga.Text := '';
    end;
  end;
end;

procedure TForm1.EJumlahBarangChange(Sender: TObject);
begin
  // When the quantity changes, update the subtotal and discount fields
  if CbKode.Text <> '' then
  begin
    // Read the quantity
    var jumlah: Integer := StrToIntDef(EJumlahBarang.Text, 0);

    // Calculate subtotal
    var subtotal: Double := hitungSubtotal(jumlah);

    // Calculate discount
    var diskon: Double := hitungDiskon(subtot);

    // Display the results in the appropriate text fields
    ESubTotal.Text := FormatFloat('#,##0.00', subtotal);
    EDiskon.Text := FormatFloat('#,##0.00', disk);
  end;
end;

function TForm1.hitungSubtotal(jumlah: Integer): Double;
begin
  Result := harga_barang * jumlah;
end;

function TForm1.hitungDiskon(subtot: Double): Double;
begin
  var disk: Double := 0;
  if subtot >= 100000 then
    disk := 0.15
  else if subtot >= 50000 then
    disk := 0.10
  else if subtot >= 25000 then
    disk := 0.05;
  Result := subtot * disk;
end;

end.

