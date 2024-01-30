unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  MainModuleData;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    EditTitle: TEdit;
    EditAuthor: TEdit;
    EditGenre: TEdit;
    EditQuantity: TEdit;
    BookIDToUpdate: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label0: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure refreshData;
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

procedure TForm1.refreshData;
begin
  DataModuleMain.SQLQuery1.Close;
  DataModuleMain.SQLQuery1.SQL.Text := 'SELECT * FROM Book';
  DataModuleMain.SQLQuery1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   refreshData();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DataModuleMain.SQLQuery1.Close;
  DataModuleMain.SQLQuery1.SQL.Text := 'INSERT INTO Book (title, author, genre, quantity) VALUES (:title, :author, :genre, :quantity)';
  DataModuleMain.SQLQuery1.Params.ParamByName('title').AsString := EditTitle.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('author').AsString := EditAuthor.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('genre').AsString := EditGenre.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('quantity').AsInteger := StrToInt(EditQuantity.Text);
  DataModuleMain.SQLQuery1.ExecSQL;
  DataModuleMain.SQLTransaction1.Commit;
  refreshData();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DataModuleMain.SQLQuery1.Close;
  DataModuleMain.SQLQuery1.SQL.Text := 'UPDATE Book SET title=:title, author=:author, genre=:genre, quantity=:quantity WHERE id=:id';
  DataModuleMain.SQLQuery1.Params.ParamByName('title').AsString := EditTitle.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('author').AsString := EditAuthor.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('genre').AsString := EditGenre.Text;
  DataModuleMain.SQLQuery1.Params.ParamByName('quantity').AsInteger := StrToInt(EditQuantity.Text);
  // Assume you have the ID of the book you want to update
  DataModuleMain.SQLQuery1.Params.ParamByName('id').AsInteger := StrToInt(BookIDToUpdate.Text);
  DataModuleMain.SQLQuery1.ExecSQL;
  DataModuleMain.SQLTransaction1.Commit;
  refreshData();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DataModuleMain.SQLQuery1.Close;
  DataModuleMain.SQLQuery1.SQL.Text := 'DELETE FROM Book WHERE id=:id';
  // Assume you have the ID of the book you want to delete
  DataModuleMain.SQLQuery1.Params.ParamByName('id').AsInteger := StrToInt(BookIDToUpdate.Text);
  DataModuleMain.SQLQuery1.ExecSQL;
  DataModuleMain.SQLTransaction1.Commit;
  refreshData();
end;

end.

