object frmAppoint: TfrmAppoint
  Left = 0
  Top = 0
  Caption = 'frmAppoint'
  ClientHeight = 578
  ClientWidth = 751
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 559
    Width = 751
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 57
    Align = alTop
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 40
      Top = 19
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 383
      Top = 19
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'ComboBox2'
      OnChange = ComboBox2Change
    end
    object BitBtn1: TBitBtn
      Left = 576
      Top = 17
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 191
      Top = 19
      Width = 186
      Height = 21
      Date = 42431.399944375000000000
      Time = 42431.399944375000000000
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 751
    Height = 502
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 749
      Height = 500
      Align = alClient
      DataSource = DSQAppoint
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'grup'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'predmet'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'teacher'
          Width = 200
          Visible = True
        end>
    end
  end
  object ADOQAppoint: TADOQuery
    Active = True
    Connection = DM.ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  tblappoint.Data,'
      '  tblgrup.grup,'
      '  tblpredmet.predmet,'
      '  tblpredmet.teacher'
      'FROM tblgrup'
      '  INNER JOIN tblappoint'
      '    ON tblgrup.id_grup = tblappoint.IDGrup'
      '  INNER JOIN tblpredmet'
      '    ON tblpredmet.id_predmet = tblappoint.IDPredmet')
    Left = 368
    Top = 296
  end
  object DSQAppoint: TDataSource
    DataSet = ADOQAppoint
    Left = 448
    Top = 320
  end
end
