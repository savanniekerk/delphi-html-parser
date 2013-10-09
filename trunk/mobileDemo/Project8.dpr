program Project8;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit7 in 'Unit7.pas' {Form7},
  HtmlParser_XE3UP in '..\HtmlParser_XE3UP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
