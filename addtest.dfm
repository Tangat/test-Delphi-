object frmtest: Tfrmtest
  Left = 0
  Top = 0
  Caption = 'frmtest'
  ClientHeight = 608
  ClientWidth = 764
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
    Top = 0
    Width = 764
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -214
    ExplicitWidth = 849
    object Label2: TLabel
      Left = 44
      Top = 19
      Width = 53
      Height = 13
      Caption = #1055#1088#1077#1076#1084#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 16
      Width = 457
      Height = 21
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 764
    Height = 469
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -214
    ExplicitTop = -219
    ExplicitWidth = 849
    ExplicitHeight = 519
    object Label1: TLabel
      Left = 25
      Top = 6
      Width = 64
      Height = 13
      Caption = #1042#1086#1087#1088#1086#1089' '#8470' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 24
      Top = 24
      Width = 641
      Height = 41
      DataField = 'VOPROS'
      DataSource = DM.DStest
      TabOrder = 0
    end
    object DBMemo2: TDBMemo
      Left = 56
      Top = 97
      Width = 609
      Height = 41
      DataField = 'OTVET1'
      DataSource = DM.DStest
      TabOrder = 1
    end
    object DBMemo3: TDBMemo
      Left = 56
      Top = 144
      Width = 609
      Height = 41
      DataField = 'OTVET2'
      DataSource = DM.DStest
      TabOrder = 2
    end
    object DBMemo4: TDBMemo
      Left = 56
      Top = 192
      Width = 609
      Height = 41
      DataField = 'OTVET3'
      DataSource = DM.DStest
      TabOrder = 3
    end
    object DBMemo5: TDBMemo
      Left = 56
      Top = 240
      Width = 608
      Height = 41
      DataField = 'OTVET4'
      DataSource = DM.DStest
      TabOrder = 4
    end
    object DBMemo6: TDBMemo
      Left = 56
      Top = 288
      Width = 608
      Height = 41
      DataField = 'OTVET5'
      DataSource = DM.DStest
      TabOrder = 5
    end
    object BitBtn2: TBitBtn
      Left = 608
      Top = 424
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 534
    Width = 764
    Height = 55
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -214
    ExplicitTop = 245
    ExplicitWidth = 849
    object BitBtn1: TBitBtn
      Left = 280
      Top = 4
      Width = 89
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object DBNavigator1: TDBNavigator
      Left = 40
      Top = 8
      Width = 224
      Height = 25
      DataSource = DM.DStest
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 589
    Width = 764
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = 1
    ExplicitTop = 35
    ExplicitWidth = 847
  end
  object DlgOpen: TOpenDialog
    Left = 264
    Top = 65
  end
  object WordApp: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 216
    Top = 272
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 264
    Top = 272
  end
  object ADOQAddTest: TADOQuery
    Connection = DM.ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from test')
    Left = 440
    Top = 272
  end
end
