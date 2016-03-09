object frmreport: Tfrmreport
  Left = 0
  Top = 0
  Caption = 'frmreport'
  ClientHeight = 571
  ClientWidth = 967
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
    Width = 967
    Height = 57
    Align = alTop
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 184
      Top = 18
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object BitBtn1: TBitBtn
      Left = 448
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 552
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn3'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 552
    Width = 967
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 967
    Height = 495
    Align = alClient
    TabOrder = 2
    object BitBtn2: TBitBtn
      Left = 1
      Top = 440
      Width = 965
      Height = 54
      Align = alBottom
      Caption = 'BitBtn2'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 965
      Height = 439
      Align = alClient
      DataSource = DSReport
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id_grup'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SNP'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zachnom'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'predmet'
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rezult'
          Width = 150
          Visible = True
        end>
    end
  end
  object ADOQRepost: TADOQuery
    Connection = DM.ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  tblgrup.id_grup,'
      '  tblstudent.SNP,'
      '  tblstudent.zachnom,'
      '  tblpredmet.predmet,'
      '  tblrezult.rezult'
      'FROM tblstudent'
      '  LEFT OUTER JOIN tblrezult'
      '    ON tblstudent.id_student = tblrezult.idstudent'
      '  RIGHT OUTER JOIN tblpredmet'
      '    ON tblpredmet.id_predmet = tblrezult.idpredmet'
      '  RIGHT OUTER JOIN tblgrup'
      '    ON tblgrup.id_grup = tblrezult.id_grup'
      '    AND tblgrup.id_grup = tblstudent.grup'
      'WHERE tblgrup.id_grup = 1')
    Left = 416
    Top = 192
    object ADOQRepostid_grup: TAutoIncField
      FieldName = 'id_grup'
      ReadOnly = True
    end
    object ADOQRepostSNP: TWideStringField
      FieldName = 'SNP'
      Size = 255
    end
    object ADOQRepostzachnom: TWideStringField
      FieldName = 'zachnom'
      Size = 10
    end
    object ADOQRepostpredmet: TWideStringField
      FieldName = 'predmet'
      Size = 255
    end
    object ADOQRepostrezult: TIntegerField
      FieldName = 'rezult'
    end
  end
  object DSReport: TDataSource
    DataSet = ADOQRepost
    Left = 552
    Top = 288
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 480
    Top = 288
  end
  object JvADOQuery1: TJvADOQuery
    Connection = DM.ADOConn
    Parameters = <>
    SQL.Strings = (
      'TRANSFORM Sum(rer.rezult) AS [Sum-rezult]'
      'SELECT tblgrup.id_grup, rer.SNP, tblstudent.zachnom'
      
        'FROM (tblpredmet INNER JOIN ((tblgrup INNER JOIN tblstudent ON t' +
        'blgrup.id_grup = tblstudent.grup) INNER JOIN rer ON tblstudent.S' +
        'NP = rer.SNP) ON tblpredmet.predmet = rer.predmet) INNER JOIN tb' +
        'lrezult ON rer.rezult = tblrezult.rezult'
      'GROUP BY tblgrup.id_grup, rer.SNP, tblstudent.zachnom'
      'PIVOT rer.predmet;')
    DialogOptions.FormStyle = fsNormal
    Left = 392
    Top = 256
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id_report=id_report'
      'grup=grup'
      'FIO=FIO'
      'zachnom=zachnom'
      'bilet=bilet'
      'predmet1=predmet1'
      'predmet2=predmet2'
      'predmet3=predmet3'
      'ball=ball'
      'procent=procent'
      'book=book')
    DataSource = DM.DSReport
    BCDToCurrency = True
    Left = 160
    Top = 329
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42438.468213588000000000
    ReportOptions.LastChange = 42438.490695949080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 304
    Top = 329
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 19.677180000000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1SNP: TfrxMemoView
          Left = 30.236240000000000000
          Top = 0.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
        object frxDBDataset1zachnom: TfrxMemoView
          Left = 219.212740000000000000
          Top = 0.779530000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'zachnom'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            '[frxDBDataset1."zachnom"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Memo2: TfrxMemoView
        Left = 215.433210000000000000
        Top = -3.779530000000000000
        Width = 604.724800000000000000
        Height = 52.913420000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Palatino Linotype'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          #1057'.'#1041#1241#1081#1110#1096#1077#1074' '#1072#1090#1099#1085#1076#1072#1171#1099' '#1040#1179#1090#1257#1073#1077' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090#1110
          #1055#1077#1076#1072#1075#1086#1075#1080#1082#1072' '#1078#1241#1085#1077' '#1078#1072#1088#1072#1090#1099#1083#1099#1089#1090#1072#1085#1091' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1110
          
            #1045#1084#1090#1080#1093#1072#1085' '#1074#1077#1076#1086#1084#1086#1089#1099' ('#1052#1072#1084#1072#1085#1076#1099#1179' '#1073#1086#1081#1099#1085#1096#1072' '#1084#1077#1084#1083#1077#1082#1077#1090#1090#1110#1082' '#1077#1084#1090#1080#1093#1072#1085') '#1072#1087#1077#1083#1083#1103#1094#1080 +
            #1103#1089#1099#1079)
        ParentFont = False
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 124.724490000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Width = 26.456710000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 30.236240000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1060#1048#1054)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 219.212740000000000000
          Width = 98.267780000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1047#1072#1095#1077#1090#1085#1099#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1predmet1: TfrxMemoView
          Left = 317.480520000000000000
          Width = 86.929190000000000000
          Height = 34.015770000000000000
          DataField = 'predmet1'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            '[frxDBDataset1."predmet1"]')
          ParentFont = False
        end
      end
    end
  end
end
