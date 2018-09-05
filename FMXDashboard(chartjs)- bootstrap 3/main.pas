unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.Controls.Presentation ,System.Threading
   {$IFDEF MSWINDOWS}
  ,System.Win.Registry, FMX.Edit
  {$ENDIF}
  ;

type
  TForm4 = class(TForm)
    ToolBar1: TToolBar;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
   {$IFDEF MSWINDOWS}
  procedure SetPermissions;
  procedure webbrowserstart;
  procedure webbrowsernewjs;
  procedure loaddashboard;
procedure GetdoughnutDetail(var clabels,cbackgroundcolor,cdata:string);
procedure GetmixedchartDetail(var mlabels, mdata1, mdata2,
  mabackgroundcolor, madata, mbbackgroundcolor2, mbdata: string);
  {$ENDIF}
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin

 WebBrowser1.URL := 'file://' + GetCurrentDir +
   '\..\..\indexnew.html';
 Webbrowser1.Reload;
 timer2.Enabled:= true; //check if it works with threading better for mobile

  end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  WebBrowser1.URL := 'file://' + GetCurrentDir +
    '\..\..\indexnew.html';
  Webbrowser1.Reload;
  timer1.Enabled:= true; //check if it works with threading better for mobile
end;


procedure TForm4.FormCreate(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  SetPermissions;
{$ENDIF}
//WebBrowser1.LoadFromStrings(cDashboard, '');
WebBrowser1.URL := 'file://' + GetCurrentDir +
    '\..\..\indexnew.html';

end;


procedure TForm4.FormShow(Sender: TObject);
begin
  timer1.Enabled:= true;
end;

procedure TForm4.GetdoughnutDetail(var clabels,cbackgroundcolor,cdata:string);
begin
 clabels:= '["Upstairs", "Outside", "Bedroom3", "Garage", "Dining Room"],';
cbackgroundColor:= '["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], ';
cdata:='[89,300,5,10,100]';
end;




procedure TForm4.GetmixedchartDetail(var mlabels, mdata1, mdata2,
  mabackgroundcolor, madata, mbbackgroundcolor2, mbdata: string);
begin
  mlabels:= ' ["Bedroom", "Bathroom", "Study","Lounge"], ';
  mdata1:=  '[250,140,270,100],';
  mdata2:=  '[830,520,620,380],';
  mabackgroundcolor:= '';
  madata:=  '';
  mbbackgroundcolor2:=  '';
  mbdata:=     '';
 end;

procedure TForm4.loaddashboard;
begin
//
end;

{$IFDEF MSWINDOWS}
procedure TForm4.SetPermissions;
const
  cHomePath = 'SOFTWARE';
  cFeatureBrowserEmulation =
    'Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION\';
  cIE11 = 11001;

var
  Reg: TRegIniFile;
  sKey: string;
begin

  sKey := ExtractFileName(ParamStr(0));
  Reg := TRegIniFile.Create(cHomePath);
  try
    if Reg.OpenKey(cFeatureBrowserEmulation, True) and
      not(TRegistry(Reg).KeyExists(sKey) and (TRegistry(Reg).ReadInteger(sKey)
      = cIE11)) then
      TRegistry(Reg).WriteInteger(sKey, cIE11);
  finally
    Reg.Free;
  end;
 {$ENDIF}
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
   timer1.enabled:= false;
    webbrowserstart;
end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
   timer2.enabled:= false;
    webbrowsernewjs;
end;

procedure TForm4.webbrowsernewjs;
var
clabels,cbackgroundcolor,cdata:string;
mlabels, mdata1, mdata2,mabackgroundcolor, madata,
mbbackgroundcolor2, mbdata:string;
updategraph:string;
begin
 GetdoughnutDetail(clabels,cbackgroundcolor,cdata);
 GetmixedchartDetail(mlabels, mdata1, mdata2,
  mabackgroundcolor, madata, mbbackgroundcolor2, mbdata);

updategraph :=
'new Chart(document.getElementById("doughnut-chart"), {'
+'    type: "doughnut",'
+'    data: {'
+'      labels: '+clabels
+'      datasets: ['
+'        { '
 +'         label: "Rooms",'
 +'         backgroundColor:' +cbackgroundcolor
 +'         data: ' +cdata
 +'       } '
+'      ]  '
 +'   },  '
 +'   options: {   '
 +'     legend: { display: false },  '
 +'     title: {   '
 +'       display: "True",  '
 +'       text: "Total Assets Value"   '
 +'     }  '
 +'   }  '
+'});'

+'new Chart(document.getElementById("mixed-chart"), {  '
 +'   type: "bar",              '
 +'  data: {                    '
 +'     labels: '+ mlabels
+'      datasets: [{            '
+'          label: "Purchased",   '
+'          type: "line",        '
+'          borderColor: "#8e5ea2",   '
+'          data: '+mdata1
+'          fill: false   '
+'        }, {       '
+'          label: "Disposed",    '
+'          type: "line",        '
+'          borderColor: "#3e95cd",    '
+'          data:' +mdata2
+'         fill: false   '
+'        }, {         '
+'          label: "Purchased",  '
+'          type: "bar",        '
 +'         backgroundColor: "rgba(0,120,5,0.2)", '
 +'         data: '+mdata1
+'        }, {                       '
+'          label: "Disposed",       '
+'          type: "bar",         '
+'          backgroundColor: "rgba(0,30,220,0.2)", '
+'          backgroundColorHover: "#3e95cd",    '
+'         data: '+ mdata2
+'        }           '
+'      ]           '
+'    },            '
+'    options: {     '
 +'     title: {     '
+'        display: true, '
+'        text: "Purchased & Disposed Assets"  '
+'      },       '
+'      legend: { display: false }  '
+'    }     '
+'});   '
  ;
    WebBrowser1.EvaluateJavaScript(updategraph);
 end;

procedure TForm4.webbrowserstart;
var
clabels,cbackgroundcolor,cdata,mlabels, mdata1, mdata2,mdata3,mdata4 :string;
updategraph:string;
begin
 clabels:= '["Upstairs", "Outside", "Bedroom3", "Garage", "Dining Room"],';
 cbackgroundColor:= '["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], ';
 cdata:='[890,200,500,100,1000]';
 mlabels:= ' ["Dining Room", "Bedroom", "Garage","Stoep"], ';
 mdata1:=  '[200,140,70,1000],';
 mdata2:=  '[800,720,1220,3800],';

updategraph :=
'new Chart(document.getElementById("doughnut-chart"), {'
+'    type: "doughnut",'
+'    data: {'
+'      labels: '+clabels
+'      datasets: ['
+'        { '
 +'         label: "Rooms",'
 +'         backgroundColor:' +cbackgroundcolor
 +'         data: ' +cdata
 +'       } '
+'      ]  '
 +'   },  '
 +'   options: {   '
 +'     legend: { display: false },  '
 +'     title: {   '
 +'       display: "True",  '
 +'       text: "Total Assets Value"   '
 +'     }  '
 +'   }  '
+'});'

+'new Chart(document.getElementById("mixed-chart"), {  '
 +'   type: "bar",              '
 +'  data: {                    '
 +'     labels: '+ mlabels
+'      datasets: [{            '
+'          label: "Purchased",   '
+'          type: "line",        '
+'          borderColor: "#8e5ea2",   '
+'          data: '+mdata1
+'          fill: false   '
+'        }, {       '
+'          label: "Disposed",    '
+'          type: "line",        '
+'          borderColor: "#3e95cd",    '
+'          data:' +mdata2
+'         fill: false   '
+'        }, {         '
+'          label: "Purchased",  '
+'          type: "bar",        '
 +'         backgroundColor: "rgba(0,120,5,0.2)", '
 +'         data: '+mdata1
+'        }, {                       '
+'          label: "Disposed",       '
+'          type: "bar",         '
+'          backgroundColor: "rgba(0,30,220,0.2)", '
+'          backgroundColorHover: "#3e95cd",    '
+'         data: '+ mdata2
+'        }           '
+'      ]           '
+'    },            '
+'    options: {     '
 +'     title: {     '
+'        display: true, '
+'        text: "Purchased & Disposed Assets"  '
+'      },       '
+'      legend: { display: false }  '
+'    }     '
+'});   '
  ;


  WebBrowser1.EvaluateJavaScript(updategraph);

end;




end.
