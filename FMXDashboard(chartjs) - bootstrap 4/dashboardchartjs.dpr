program dashboardchartjs;

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {Form4},
  dashboard in 'dashboard.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
