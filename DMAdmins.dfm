object DMtblAdmins: TDMtblAdmins
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 187
  Width = 247
  object conAdmins: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Nkateko Mnis' +
      'i PAT\propertymanagement.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 184
    Top = 48
  end
  object tblAdmins: TADOTable
    Connection = conAdmins
    CursorType = ctStatic
    TableName = 'Administators'
    Left = 192
    Top = 96
  end
  object DSAdmins: TDataSource
    DataSet = qryAdmins
    Left = 112
    Top = 40
  end
  object qryAdmins: TADOQuery
    Connection = conAdmins
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from administators')
    Left = 112
    Top = 96
  end
end
