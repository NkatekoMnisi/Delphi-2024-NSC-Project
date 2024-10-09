object DMtblUsers: TDMtblUsers
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 281
  Width = 491
  object adoConUsers: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\Pa' +
      't\Nkateko Mnisi PAT\propertymanagement.mdb;Mode=Share Deny None;' +
      'Persist Security Info=False;Jet OLEDB:System database="";Jet OLE' +
      'DB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Eng' +
      'ine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Pa' +
      'rtial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:' +
      'New Database Password="";Jet OLEDB:Create System Database=False;' +
      'Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on ' +
      'Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet' +
      ' OLEDB:SFP=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 408
    Top = 8
  end
  object adotblUsers: TADOTable
    Connection = adoConUsers
    CursorType = ctStatic
    TableName = 'Users'
    Left = 416
    Top = 64
  end
  object ADOQUsers: TADOQuery
    Connection = adoConUsers
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from users')
    Left = 416
    Top = 144
  end
  object DSUsers: TDataSource
    DataSet = ADOQUsers
    Left = 416
    Top = 208
  end
end
