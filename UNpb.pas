unit UNpb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math, ComCtrls, Menus, Gauges, Buttons, ExtCtrls, WinSkinData;

type
  TFrmContagem = class(TForm)
    Memo1: TMemo;      
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Memo10: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    StatusBar1: TStatusBar;
    Memo11: TMemo;
    MainMenu1: TMainMenu;
    Novo1: TMenuItem;
    Memo12: TMemo;
    Memo13: TMemo;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton1: TSpeedButton;
    Gauge1: TGauge;
    Bevel1: TBevel;
    Bevel2: TBevel;
    About1: TMenuItem;
    SkinData1: TSkinData;
    procedure Novo1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContagem: TFrmContagem;
  aP, fP: Boolean;

implementation

uses Unit1, Unit2;

function TemVirgula5(Valor:Double) :Boolean;
var
  Conta : Double;
begin
  Conta := Ceil(Valor) - Valor;
  if (Conta = 0.0) then Result := true
  else Result := false;
end;

{$R *.DFM}

const
ChrMaiusculas: set of char = ['A'..'Z'];
ChrMinusculas: set of char = ['a'..'z'];
ChrNumeros: set of char = ['0'..'9'];
ChrTraco: set of char = ['-'];
StrLetras = 'ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxywz';

procedure TFrmContagem.Novo1Click(Sender: TObject);
begin
Memo1.Clear;
Memo11.Clear;
StatusBar1.SimpleText:='';
Memo1.SetFocus;
end;

procedure TFrmContagem.SpeedButton1Click(Sender: TObject);
Var
  l,c,cont,i,i_redef,memo1_aux,memo11_aux:integer ;
  Ch, Letra:Char ;
  index,pri_palavra,parentese,numeros, linha: String;
  num1, num2, num3, num4:String;
  virg, barra, doispt, LinhaOK, redef, var_especial, erro_doispt:  boolean;
  ContaP,inicio,fim, aux: Double;
begin
//MUDA O MOUSE PARA AMPULHETA
Screen.Cursor := crHourGlass;

if Memo1.Lines.Text <> Memo11.Lines.Text then
begin

  Memo2.Clear;
  Memo3.Clear;
  Memo4.Clear;
  Memo5.Clear;
  Memo6.Clear;
  Memo7.Clear;
  Memo8.Clear;
  Memo9.Clear;
  Memo10.Clear;
  Memo11.Clear;
  Memo12.Clear;
  Memo13.Clear;
  Edit1.Clear;
  Gauge1.Progress:=0;

  aux:=0;
  i:=0;
  inicio:=1;
  cont:=0;
  redef:=false;
  i_redef:=0;
  Letra:=' ';

  memo1_aux:=(Memo1.Lines.Count);

  StatusBar1.SimpleText:='';

  //PARA CADA LINHA DE ENTRADA
  for l := 0 to Memo1.Lines.Count-1 do
  begin
        //INICIALMENTE A LINHA ATUAL N√O … UMA LINHA QUE CONT…M C¡LCULO
        LinhaOK := false;

        //PEGA A LINHA
        linha := Memo1.Lines.Strings[l];

        parentese := '';
        aP := false;
        fP := false;

        //SE FOR UMA LINHA COM ALGUMA COISA NELA, COLETA ALGUNS DADOS
        if (Length(linha) > 0) then
        begin
                index := '';
                pri_palavra := '';
                c :=0;
                i :=0;
                Ch := Linha[c];

                //PEGA TUDO QUE FOR NUMERO ATE ACHAR UMA LETRA (INDEX)
                while(  not(Ch in ChrMaiusculas) and
                        not(Ch in ChrMinusculas) and
                           (c <= Length(linha))
                     )
                do
                begin

                        if (Ch in ChrNumeros) then
                        index := index + Ch;

                c := c+1;
                Ch := Linha[c];
                end;

                //COLETA O NOME DA VARI¡VEL NA LINHA
                if ((index <> '') and (c<=Length(Linha))) then
                begin
                        while(  (Ch in ChrMaiusculas) or
                                (Ch in ChrMinusculas) or
                                (Ch in ChrTraco)      or
                                (Ch in ChrNumeros)    and
                                (c <= Length(linha))
                             )
                        do
                        begin
                                pri_palavra := pri_palavra + Ch;
                                c := c+1;
                                Ch := Linha[c];
                        end;

                end;

                //ESSA VARI¡VEL REPRESENTA O '01' ANTES DE DECLARAR A VARI¡VEL DO NATURAL
                if (index <> '') then
                i := StrToInt(index);

                Memo12.Lines.Add('['+IntToStr(i)+']');
                Memo13.Lines.Add('['+pri_palavra+']');

        end;

        //PARA CADA CARACTER DA LINHA, COLETA O CONTE⁄DO DO PARENTESES
        for c := 1 to Length(linha) do
        begin
                Ch := Linha[c];

                if Ch = '(' then
                aP := true
                else if Ch = ')' then
                fP := true;

                if ((aP = true) and (fP = false) and (Ch <> '('))then
                        parentese := parentese + Ch;
        end;

        //VERIFICA SE FECHOU O ULTIMO PARENTESE
        if ((aP = true) and (fP = false)) then
        begin
                Memo11.Clear;
                Edit1.Text:='';
                StatusBar1.SimpleText:='ERROR...';
                MessageDlg(#13+'Please close the sentence in the variable '+AnsiUpperCase(pri_palavra)+'.', mtError, [mbOk], 0);

                  //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                  memo1.SetFocus ;
                   if pos(pri_palavra,memo1.Lines.Text)<>0 then
                   begin
                   memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                   memo1.SelLength :=length(pri_palavra);
                   end;
                break;
        end;

       //SE UMA REDEFINI«√O FOI ABERTA, VERIFICA SE ELA FECHOU
       if ((redef = true) and (i > i_redef)) then
       begin
                LinhaOK := false;
       end
       else
                redef := false;

       //CASO SEJA DIGITADO 'REDEFINES' (COBOL) NO LUGAR DE 'REDEFINE' (NATURAL)
       if ((redef = false) and (LowerCase(pri_palavra) = 'redefines')) then
       begin
                Memo11.Clear;
                Edit1.Text:='';
                StatusBar1.SimpleText:='ERROR...';
                MessageDlg(#13+'Do not exist REDEFINES in Natural Codes.', mtError, [mbOk], 0);

                  //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                  memo1.SetFocus ;
                   if pos('redefines',memo1.Lines.Text)<>0 then
                   begin
                   memo1.SelStart := pos('redefines',memo1.Lines.Text)-1;
                   memo1.SelLength :=length('redefines');
                   end;
                break;
       end;


       //VERIFICA SE EXISTE ALGUM 'REDEFINE' NA ESTRUTURA
       if ((redef = false) and (LowerCase(pri_palavra) = 'redefine')) then
       begin
                redef := true;
                i_redef := i;
       end;

       //CASO TENHA CONTEUDO DENTRO DO PARENTESES E NAO SEJA DENTRO DO BLOCO DE REDEFINE
       if ( (aP = true) and (fP = true) and (redef =  false) ) then
       begin

                //CASO ESTEJA VAZIO DENTRO DOS PARENTESES
                if (parentese = '') then
                begin
                        Memo11.Clear;
                        Edit1.Text:='';
                        StatusBar1.SimpleText:='ERROR...';
                        MessageDlg(#13+'The type of variable '+AnsiUpperCase(pri_palavra)+' is empty.', mtError, [mbOk], 0);

                           //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                           memo1.SetFocus ;
                             if pos(pri_palavra,memo1.Lines.Text)<>0 then
                             begin
                             memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                             memo1.SelLength :=length(pri_palavra);
                             end;
                        break;
                end
                else
                Letra := parentese[1];


                //COLETA O NUMERO QUE VEM DEPOIS DO TIPO DE VARI¡VEL
                numeros := Copy(parentese,2,Length(parentese));

                   var_especial := false;

                  //PEGA AS VARI¡VEIS QUE N√O PRECISAM TER O TAMANHO DEFINIDO
                  //EX: 01 TESTE (L)
                  if (numeros = '') and ((Letra = 'L') or (Letra = 'l') or
                                         (Letra = 'D') or (Letra = 'd') or
                                         (Letra = 'T') or (Letra = 't') or
                                         (Letra = 'C') or (Letra = 'c')
                                        )
                  then
                  begin
                  var_especial := true;
                  end;

                                //CASO NAO SEJA DIGITADO UMA LETRA PARA O TIPO DE VARIAVEL
                                if not ((Letra in ChrMaiusculas) or (Letra in ChrMinusculas)) then
                                begin
                                        Memo11.Clear;
                                        Edit1.Text:='';
                                        StatusBar1.SimpleText:='ERROR...';
                                        MessageDlg(#13+'This type of variable do not exist in Natural Codes.'+#13+'Please check: '+AnsiUpperCase(pri_palavra)+' ('+AnsiUpperCase(Letra)+AnsiUpperCase(numeros)+')', mtError, [mbOk], 0);

                                           //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                                           memo1.SetFocus ;
                                             if pos(pri_palavra,memo1.Lines.Text)<>0 then
                                             begin
                                             memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                                             memo1.SelLength :=length(pri_palavra);
                                             end;
                                        break;
                                end;


                                //CASO SEJA DIGITADO UM TIPO DE VARI¡VEL INEXISTENTE NO NATURAL
                                if ((Letra <> 'A') and (Letra <> 'a')) and
                                   ((Letra <> 'N') and (Letra <> 'n')) and
                                   ((Letra <> 'P') and (Letra <> 'p')) and
                                   ((Letra <> 'I') and (Letra <> 'i')) and
                                   ((Letra <> 'D') and (Letra <> 'd')) and
                                   ((Letra <> 'T') and (Letra <> 't')) and
                                   ((Letra <> 'L') and (Letra <> 'l')) and
                                   ((Letra <> 'B') and (Letra <> 'b')) and
                                   ((Letra <> 'C') and (Letra <> 'c')) and
                                   ((Letra <> 'F') and (Letra <> 'f'))
                                then
                                begin
                                        Memo11.Clear;
                                        Edit1.Text:='';
                                        StatusBar1.SimpleText:='ERROR...';
                                        MessageDlg(#13+'This type of variable do not exist in Natural Codes.'+#13+'Please check: '+AnsiUpperCase(pri_palavra)+' ('+AnsiUpperCase(Letra)+AnsiUpperCase(numeros)+')', mtError, [mbOk], 0);

                                           //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                                           memo1.SetFocus ;
                                             if pos(pri_palavra,memo1.Lines.Text)<>0 then
                                             begin
                                             memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                                             memo1.SelLength :=length(pri_palavra);
                                             end;
                                        break;
                                end;


                        //VERIFICA SE FOI ADICIONADO NUMEROS DEPOIS DO TIPO DE VARI¡VEL
                        if ( ((Length(numeros) = 0) or (Pos(numeros,StrLetras) <> 0)) and (var_especial = false) ) then
                        begin
                               Memo11.Clear;
                               Edit1.Text:='';
                               StatusBar1.SimpleText:='ERROR...';
                               MessageDlg(#13+'This type of variable do not exist in Natural Codes.'+#13+'Please check: '+AnsiUpperCase(pri_palavra)+' ('+AnsiUpperCase(Letra)+AnsiUpperCase(numeros)+')', mtError, [mbOk], 0);

                                 //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                                 memo1.SetFocus ;
                                   if pos(pri_palavra,memo1.Lines.Text)<>0 then
                                   begin
                                   memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                                   memo1.SelLength :=length(pri_palavra);
                                   end;
                               break;
                        end
                        //CASO TENHA SIDO ADICIONADO NUMEROS DEPOIS DO TIPO DE VARI¡VEL
                        else
                        begin

                                //SE FOR UMA VARI¡VEL QUE N√O PRECISA ESPECIFICAR O TAMANHO, CONTA COMO TAMANHO DE 1
                                if (var_especial = true) then
                                num1 := '1'
                                else
                                num1 := '';

                                num2 := '';
                                num3 := '';
                                num4 := '';
                                virg := false;
                                barra := false;
                                doispt := false;
                                erro_doispt := false;

                                //COLETA O N⁄MERO OU N⁄MEROS
                                for c := 1 to Length(numeros) do
                                begin

                                        if (numeros[c] = ',') then
                                        virg := true
                                        else
                                        if (numeros[c] = '/') then
                                        barra := true
                                        else
                                        if (numeros[c] = ':') then
                                        doispt := true
                                        else
                                        if (numeros[c] in ChrNumeros) then
                                        begin

                                                if ((barra = false) and (doispt=true)) then
                                                erro_doispt := true
                                                else
                                                if ((virg = false) and (barra=false) and (doispt=false)) then
                                                        num1 := num1 + numeros[c]
                                                else
                                                if ((barra = false) and (doispt=false)) then
                                                        num2 := num2 + numeros[c]
                                                else
                                                if (doispt = false) then
                                                        num3 := num3 + numeros[c]
                                                else
                                                        num4 := num4 + numeros[c];

                                        end;
                                end;

                                //SE TIVER O VALOR DE 2 PONTOS MAS SEM O VALOR DE BARRA
                                if (erro_doispt = true) then
                                begin
                                        Memo11.Clear;
                                        Edit1.Text:='';
                                        StatusBar1.SimpleText:='ERROR...';
                                        MessageDlg(#13+'This type of variable do not exist in Natural Codes.'+#13+'Please check: '+AnsiUpperCase(pri_palavra)+' ('+AnsiUpperCase(Letra)+AnsiUpperCase(numeros)+')', mtError, [mbOk], 0);

                                            //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                                            memo1.SetFocus ;
                                              if pos(pri_palavra,memo1.Lines.Text)<>0 then
                                              begin
                                              memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                                              memo1.SelLength :=length(pri_palavra);
                                              end;
                                        break;
                                end;

                                //VERIFICA SE EXISTIA UM N⁄MERO PELO MENOS
                                if(num1 <> '') then
                                begin

                                  if num2 = '' then
                                  num2:='0';

                                  //VARI¡VEL QUE VEM DEPOIS DA BARRA (MEMO8)
                                  if num3 = '' then
                                  num3:='0';

                                  //VARI¡VEL QUE VEM DEPOIS DE 2 PONTOS (MEMO9)
                                  if num4 = '' then
                                  num4:='0';

                                        //VERIFICA SE O TIPO DE VARI¡VEL … DO TIPO P (COMPACTADO)
                                        if ((Letra = 'P') or (Letra = 'p')) then
                                        begin
                                                ContaP := (StrToInt(num1)+StrToInt(num2));
                                                ContaP := ((ContaP)/2.0);
                                                 if (TemVirgula5(ContaP)) then
                                                 //SE N√O TIVER ',5' SOMA + 1
                                                 ContaP := ContaP + 1
                                                 else
                                                 //SE TIVER ',5' ARREDONDA PARA CIMA
                                                 ContaP := Ceil(ContaP);
                                        end
                                        else
                                        ContaP := (StrToInt(num1)+StrToInt(num2));

                                        //SE TIVER A BARRA, MULTIPLICA PELO NUMERO QUE TIVER DEPOIS DA BARRA
                                        if ((num3 <> '0')) then
                                        ContaP := (ContaP)*StrToInt(num3);

                                        //CASO TENHA OS 2 PONTOS
                                        if ((num4 <> '0')) then
                                        begin
                                            //FINALIZA SE TIVER BARRA MAIOR QUE 2 PONTOS
                                            if (StrtoInt(num3)) > (StrtoInt(num4)) then
                                            begin
                                                Memo11.Clear;
                                                Edit1.Text:='';
                                                StatusBar1.SimpleText:='ERROR...';
                                                MessageDlg(#13+'This type of variable do not exist in Natural Codes.'+#13+'Please check: '+AnsiUpperCase(pri_palavra)+' ('+AnsiUpperCase(Letra)+AnsiUpperCase(numeros)+')', mtError, [mbOk], 0);

                                                    //SELECIONA O TEXTO DA VARI¡VEL QUE DEU ERRO
                                                    memo1.SetFocus ;
                                                     if pos(pri_palavra,memo1.Lines.Text)<>0 then
                                                     begin
                                                     memo1.SelStart := pos(pri_palavra,memo1.Lines.Text)-1;
                                                     memo1.SelLength :=length(pri_palavra);
                                                     end;
                                                break;
                                            end
                                              else
                                                ContaP := ( ((StrToInt(num1))+(StrToInt(num2)))*(StrToInt(num4)) - (StrToInt(num3)) +1);
                                        end;

                                        Memo2.Lines.Add(Letra);
                                        Memo3.Lines.Add('['+numeros+']');
                                        Memo4.Lines.Add('['+num1+']');
                                        Memo5.Lines.Add('['+num2+']');
                                        Memo8.Lines.Add('['+num3+']');
                                        Memo9.Lines.Add('['+num4+']');
                                        Memo6.Lines.Add('['+FloatTostr(ContaP)+']');

                                        aux := aux + ContaP;

                                        Edit1.Text:=FloatToStr(aux);

                                        fim := inicio + (ContaP) -1 ;
                                        Memo7.Lines.Add(FormatFloat('000',(inicio)));

                                        inicio := fim +1;
                                        Memo10.Lines.Add(FormatFloat('000',(fim)));

                                        //CASO TUDO TENHA OCORRIDO BEM, ESTA … A LINHA DE C¡LCULO COM FLAG 'OK'
                                        LinhaOK := true;

                                end;

                        end;

       end;

       //CASO SEJA UMA LINHA DE CALCULO, IMPRIME O RESULTADO E CONTABILIZA A PROXIMA LINHA PARA O PROXIMO CALCULO
       if (LinhaOK = true) then
       begin
                Memo11.Lines.Add(Memo1.Lines[l] + '  /* ' + Memo7.Lines[cont] + ' - ' + Memo10.Lines[cont]);
                cont := cont+1;
       end
       //CASO CONTR¡RIO, IMPRIME APENAS A LINHA ORIGINAL
       else
                Memo11.Lines.Add(Memo1.Lines[l]);

       //GERA A BARRA DE PROGRESSO
       memo11_aux := (Memo11.Lines.Count * 100);
       SpeedButton1.Visible:=False;
       Gauge1.Visible:=True;
       Gauge1.Progress:=Trunc(memo11_aux / memo1_aux);

end;

if (Trim(Edit1.Text) <> '') then
StatusBar1.SimpleText:='SIZE: ' + Edit1.Text + ' BYTES';

//VOLTA O MOUSE PARA NORMAL
Screen.Cursor := crDefault;

if (Memo11.Lines.Text <> '') then
MessageDlg(#13+'Processed successfully!', mtInformation, [mbOk], 0);

Gauge1.Visible:=False;
SpeedButton1.Visible:=True;
SpeedButton1.Enabled:=False;
end;

end;
procedure TFrmContagem.Memo1Change(Sender: TObject);
begin
SpeedButton1.Enabled:=True;
end;

procedure TFrmContagem.About1Click(Sender: TObject);
begin
AboutBox.Visible:=True;
FrmContagem.Enabled:=False;
end;

procedure TFrmContagem.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//PARA SELECIONAR TUDO QUANDO DER CTRL + A
if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
Memo1.SelectAll;
end;

procedure TFrmContagem.Memo11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//PARA SELECIONAR TUDO QUANDO DER CTRL + A
if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
Memo11.SelectAll;
end;

procedure TFrmContagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//PARA LIMPAR O PROGRAMA DA MEM”RIA
FrmContagem.Release;
FrmContagem := Nil;
end;

procedure TFrmContagem.Memo1KeyPress(Sender: TObject; var Key: Char);
Const
//CARACTERES PARA NAO SEREM ACEITOS
especiais = '!@$%ß®&.∞+={}[]?;|\"~^¥`®«Á‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';
Var
Str : String;
begin
inherited;
Str := key;
   if (Pos(Str,especiais) <> 0) Then
   begin
        key:= #0;
   end
   else if key = #0 then
   begin
        Memo1.SetFocus;
   end;
end;

end.

