object frmUserNotf: TfrmUserNotf
  Left = 0
  Top = 0
  Caption = 'User Notifications'
  ClientHeight = 308
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -5
    Width = 633
    Height = 318
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 4
      Width = 515
      Height = 33
      Caption = 'NEW Properies that match your criteria'
      Color = clMenuHighlight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Century'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 24
      Top = 43
      Width = 593
      Height = 262
      TabOrder = 0
    end
  end
end
