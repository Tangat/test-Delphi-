object frmglav: Tfrmglav
  Left = 0
  Top = 0
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' '#1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 404
  ClientWidth = 747
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
    Top = 385
    Width = 747
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 747
    Height = 344
    Align = alClient
    TabOrder = 2
    object btngruppa: TBitBtn
      Left = 104
      Top = 24
      Width = 75
      Height = 25
      Caption = #1043#1088#1091#1087#1087#1099
      TabOrder = 0
      OnClick = btngruppaClick
    end
    object btnstudent: TBitBtn
      Left = 104
      Top = 88
      Width = 75
      Height = 25
      Caption = #1057#1090#1091#1076#1077#1085#1090#1099
      TabOrder = 1
      OnClick = btnstudentClick
    end
    object btnpredmet: TBitBtn
      Left = 416
      Top = 24
      Width = 75
      Height = 25
      Caption = #1055#1088#1077#1076#1084#1077#1090#1099
      TabOrder = 2
      OnClick = btnpredmetClick
    end
    object btntest: TBitBtn
      Left = 416
      Top = 88
      Width = 75
      Height = 25
      Caption = #1058#1077#1089#1090#1099
      TabOrder = 3
      OnClick = btntestClick
    end
    object btnreport: TBitBtn
      Left = 104
      Top = 160
      Width = 75
      Height = 25
      Caption = #1054#1090#1095#1077#1090
      TabOrder = 4
      OnClick = btnreportClick
    end
    object btnAppoint: TBitBtn
      Left = 416
      Top = 160
      Width = 75
      Height = 25
      Caption = 'btnAppoint'
      TabOrder = 5
      OnClick = btnAppointClick
    end
  end
end
