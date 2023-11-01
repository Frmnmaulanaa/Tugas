unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

end.

