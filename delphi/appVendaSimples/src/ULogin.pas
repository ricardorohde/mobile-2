unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, System.Actions, FMX.ActnList;

type
  TFrmLogin = class(TForm)
    imageRodape: TImage;
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabCadastro: TTabItem;
    labelLinkRodape: TLabel;
    layoutLogin: TLayout;
    imageLogin: TImage;
    layoutEmail: TLayout;
    rectangleEmail: TRectangle;
    StyleBookApp: TStyleBook;
    editEmail: TEdit;
    layoutSenha: TLayout;
    rectangleSenha: TRectangle;
    editSenha: TEdit;
    layoutAcessar: TLayout;
    rectangleAcessar: TRectangle;
    labelAcessar: TLabel;
    labelEsqueciSenha: TLabel;
    labelTituloLogin: TLabel;
    labelTituloNovaConta: TLabel;
    layoutCadastro: TLayout;
    imageCadastro: TImage;
    layoutEmailCad: TLayout;
    rectangleEmailCad: TRectangle;
    editEmailCad: TEdit;
    layoutSenhaCad: TLayout;
    rectangleSenhaCad: TRectangle;
    editSenhaCad: TEdit;
    layoutCriarConta: TLayout;
    rectangleCriarConta: TRectangle;
    labelCriarConta: TLabel;
    layoutNomeCad: TLayout;
    rectangleNomeCad: TRectangle;
    editNomeCad: TEdit;
    ActionList: TActionList;
    ChangeTabLogin: TChangeTabAction;
    ChangeTabCadastro: TChangeTabAction;
    procedure DoExecutarLink(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DefinirLink;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UDM;

procedure TFrmLogin.DefinirLink;
begin
  if (TabControl.ActiveTab = TabLogin) then
    labelLinkRodape.Text := 'N�o tem cadastro? Criar nova conta.'
  else
  if (TabControl.ActiveTab = TabCadastro) then
    labelLinkRodape.Text := 'J� tem um cadastro? Fa�a o login aqui.';
end;

procedure TFrmLogin.DoExecutarLink(Sender: TObject);
begin
  if (TabControl.ActiveTab = TabLogin) then
    ChangeTabCadastro.ExecuteTarget(Sender)
  else
  if (TabControl.ActiveTab = TabCadastro) then
    ChangeTabLogin.ExecuteTarget(Sender);

  DefinirLink;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  TabControl.ActiveTab   := TabLogin;
  TabControl.TabPosition := TTabPosition.None;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  DefinirLink;
end;

end.