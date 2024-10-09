object DMtblListings: TDMtblListings
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 184
  Width = 273
  object tblListings: TADOTable
    Connection = conListings
    CursorType = ctStatic
    TableName = 'Listings'
    Left = 192
    Top = 96
  end
  object qryListings: TADOQuery
    Connection = conListings
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Listings')
    Left = 112
    Top = 96
  end
  object DSListings: TDataSource
    DataSet = qryListings
    Left = 112
    Top = 40
  end
  object conListings: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Nkateko Mnis' +
      'i PAT\propertymanagement.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 200
    Top = 48
  end
end
