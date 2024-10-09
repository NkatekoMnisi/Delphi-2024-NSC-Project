object DMtblAgencies: TDMtblAgencies
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 281
  Width = 487
  object adoConAgencies: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Nkateko Mnis' +
      'i PAT\propertymanagement.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 416
    Top = 8
  end
  object adotblAgencies: TADOTable
    Connection = adoConAgencies
    CursorType = ctStatic
    TableName = 'Agencies'
    Left = 416
    Top = 64
  end
  object ADOQAgencies: TADOQuery
    Connection = adoConAgencies
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from agencies')
    Left = 416
    Top = 144
  end
  object DSAgencies: TDataSource
    DataSet = ADOQAgencies
    Left = 416
    Top = 208
  end
end
