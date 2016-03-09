object frmpass: Tfrmpass
  Left = 0
  Top = 0
  Caption = #1042#1093#1086#1076
  ClientHeight = 301
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 282
    Width = 560
    Height = 19
    Panels = <>
    ExplicitLeft = 288
    ExplicitTop = 160
    ExplicitWidth = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 152
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 560
    Height = 241
    Align = alClient
    TabOrder = 2
    ExplicitTop = 47
    object Label1: TLabel
      Left = 120
      Top = 40
      Width = 60
      Height = 26
      Caption = #1051#1086#1075#1080#1085
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 344
      Top = 40
      Width = 71
      Height = 26
      Caption = #1055#1072#1088#1086#1083#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edlogin: TMaskEdit
      Left = 96
      Top = 79
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      Text = 'edlogin'
    end
    object edpass: TMaskEdit
      Left = 320
      Top = 79
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'edpass'
    end
  end
  object btnok: TBitBtn
    Left = 192
    Top = 174
    Width = 153
    Height = 59
    Caption = #1042#1093#1086#1076
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Palatino Linotype'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnokClick
  end
end
