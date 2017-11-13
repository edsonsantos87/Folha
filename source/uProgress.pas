unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxAnimate, RxGIFCtrl, ExtCtrls;

type
  TProgress = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxGIFAnimator1: TRxGIFAnimator;
    Shape1: TShape;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Update(Value: string);
  end;


function EMSProgress : TProgress;
var
  Progress: TProgress;

implementation

{$R *.dfm}

function EMSProgress : TProgress;
begin
  if not Assigned(Progress) then
    Progress := TProgress.Create(Application);

  Result := Progress;
end;

procedure TProgress.FormShow(Sender: TObject);
begin
  RxGIFAnimator1.Animate := True;
end;

procedure TProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxGIFAnimator1.Animate := False;
end;

procedure TProgress.Update(Value: string);
begin
  Label2.Caption := Value;
  Label2.Update;
end;

end.
