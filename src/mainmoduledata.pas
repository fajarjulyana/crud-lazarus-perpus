unit MainModuleData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, SQLDB, DB;

type

  { TDataModuleMain }

  TDataModuleMain = class(TDataModule)
    DataSource1: TDataSource;
    MySQL57Connection1: TMySQL57Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private

  public

  end;

var
  DataModuleMain: TDataModuleMain;

implementation

{$R *.lfm}

end.

