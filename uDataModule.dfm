object dmConexao: TdmConexao
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=sistema_farmaceutico'
      'User_Name=root'
      'Password=@jhuz6937&'
      'Server=localhost'
      'DriverID=mySQL')
    Left = 376
    Top = 248
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'E:\ToolsPharma\Win32\Debug\libmysql.dll'
    Left = 200
    Top = 248
  end
end
