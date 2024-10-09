object DMtblSuburbs: TDMtblSuburbs
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 149
  Width = 182
  object conSuburbs: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Nkateko Mnis' +
      'i PAT\propertymanagement.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 16
  end
  object tblSuburbs: TADOTable
    Connection = conSuburbs
    CursorType = ctStatic
    TableName = 'Suburbs'
    Left = 104
    Top = 64
  end
  object DSSuburbs: TDataSource
    DataSet = tblSuburbs
    Left = 24
    Top = 8
  end
  object qrySuburbs: TADOQuery
    Connection = conSuburbs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from suburbs')
    Left = 24
    Top = 64
  end
end
