object DMtblImages: TDMtblImages
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 280
  Width = 496
  object adoConImages: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Nkateko Mnis' +
      'i PAT\propertymanagement.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 416
    Top = 8
  end
  object adotblImages: TADOTable
    Connection = adoConImages
    CursorType = ctStatic
    TableName = 'Images'
    Left = 416
    Top = 64
  end
  object ADOQImages: TADOQuery
    Connection = adoConImages
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Images')
    Left = 416
    Top = 144
  end
  object DSImages: TDataSource
    DataSet = ADOQImages
    Left = 416
    Top = 208
  end
end
