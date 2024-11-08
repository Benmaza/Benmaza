Sub VelMax()
    
    ' verificar si existe la hoja de valores
    Dim ws As Worksheet
    Dim existe As Boolean
    existe = False
    For Each ws In ThisWorkbook.Sheets
        If ws.Name = "valores" Then
            existe = True
            Exit For
        End If
    Next ws
    ' crear la hoja de valores si no existe al final del libro
    If existe = False Then
        Sheets.Add.Name = "valores"
    End If
      
    'define las hojas de trabajo
    Dim ws1, ws2, ws3, ws4, ws5, ws6, ws7, ws8, ws9, ws10, val As Worksheet
    Dim fecha1, fecha2, fecha3, fecha4, fecha5, fecha6, fecha7, fecha8, fecha9, fecha10 As String
    Dim hoja1, hoja2, hoja3, hoja4, hoja5, hoja6, hoja7, hoja8, hoja9, hoja10 As String

    ' Define los rangos de velocidad y aceleración
    Dim velrange1a, velrange1b, velrange2a, velrange2b, velrange3a, velrange3b, velrange4a, velrange4b, velrange5a, velrange5b, velrange6a, velrange6b, velrange7a, velrange7b, velrange8a, velrange8b, velrange9a, velrange9b, velrange10a, velrange10b As Range
    Dim vmax1a, vmax1b, vmax2a, vmax2b, vmax3a, vmax3b, vmax4a, vmax4b, vmax5a, vmax5b, vmax6a, vmax6b, vmax7a, vmax7b, vmax8a, vmax8b, vmax9a, vmax9b, vmax10a, vmax10b As Double
    Dim acelrange1a, acelrange1b,acelrange2a, acelrange2b,acelrange3a, acelrange3b,acelrange4a, acelrange4b,acelrange5a, acelrange5b,acelrange6a, acelrange6b,acelrange7a, acelrange7b,acelrange8a, acelrange8b,acelrange9a, acelrange9b,acelrange10a, acelrange10b As Range
    Dim amax1a, amax1b, amax2a, amax2b, amax3a, amax3b, amax4a, amax4b, amax5a, amax5b, amax6a, amax6b, amax7a, amax7b, amax8a, amax8b, amax9a, amax9b, amax10a, amax10b As Double

    ' Pide el nombre de la hoja con advertencia de poner atencion
    MsgBox "Por favor, escriba el nombre de las hojas con cuidado, ya que si la escribe mal se cancela el programa", vbExclamation, "Advertencia"    

    hoja1 = InputBox("Nombre de la hoja 1")
    hoja2 = InputBox("Nombre de la hoja 2")
    hoja3 = InputBox("Nombre de la hoja 3")
    hoja4 = InputBox("Nombre de la hoja 4")
    hoja5 = InputBox("Nombre de la hoja 5")
    hoja6 = InputBox("Nombre de la hoja 6")
    hoja7 = InputBox("Nombre de la hoja 7")
    hoja8 = InputBox("Nombre de la hoja 8")
    hoja9 = InputBox("Nombre de la hoja 9")
    hoja10 = InputBox("Nombre de la hoja 10")
      
   ' Define las hojas de trabajo con el nombre ingresado
    Set ws1 = ThisWorkbook.Sheets(hoja1)
    Set ws2 = ThisWorkbook.Sheets(hoja2)
    Set ws3 = ThisWorkbook.Sheets(hoja3)
    Set ws4 = ThisWorkbook.Sheets(hoja4)
    Set ws5 = ThisWorkbook.Sheets(hoja5)
    Set ws6 = ThisWorkbook.Sheets(hoja6)
    Set ws7 = ThisWorkbook.Sheets(hoja7)
    Set ws8 = ThisWorkbook.Sheets(hoja8)
    Set ws9 = ThisWorkbook.Sheets(hoja9)
    Set ws10 = ThisWorkbook.Sheets(hoja10)
    Set val = ThisWorkbook.Sheets("valores")

    ' Define las fechas como el nombre de la hoja
    fecha1 = ws1.Name
    fecha2 = ws2.Name
    fecha3 = ws3.Name
    fecha4 = ws4.Name
    fecha5 = ws5.Name
    fecha6 = ws6.Name
    fecha7 = ws7.Name
    fecha8 = ws8.Name
    fecha9 = ws9.Name
    fecha10 = ws10.Name

   ' Define los rangos de velocidad
    Set velrange1a = ws1.Range("E19:E24")
    Set velrange1b = ws1.Range("E25:E30")
    Set velrange2a = ws2.Range("E19:E24")
    Set velrange2b = ws2.Range("E25:E30")
    Set velrange3a = ws3.Range("E19:E24")
    Set velrange3b = ws3.Range("E25:E30")
    Set velrange4a = ws4.Range("E19:E24")
    Set velrange4b = ws4.Range("E25:E30")
    Set velrange5a = ws5.Range("E19:E24")
    Set velrange5b = ws5.Range("E25:E30")
    Set velrange6a = ws6.Range("E19:E24")
    Set velrange6b = ws6.Range("E25:E30")
    Set velrange7a = ws7.Range("E19:E24")
    Set velrange7b = ws7.Range("E25:E30")
    Set velrange8a = ws8.Range("E19:E24")
    Set velrange8b = ws8.Range("E25:E30")
    Set velrange9a = ws9.Range("E19:E24")
    Set velrange9b = ws9.Range("E25:E30")
    Set velrange10a = ws10.Range("E19:E24")
    Set velrange10b = ws10.Range("E25:E30")

    ' Define los rangos de aceleración
    Set acelrange1a = ws1.Range("G19:G24")
    Set acelrange1b = ws1.Range("G25:G30")
    Set acelrange2a = ws2.Range("G19:G24")
    Set acelrange2b = ws2.Range("G25:G30")
    Set acelrange3a = ws3.Range("G19:G24")
    Set acelrange3b = ws3.Range("G25:G30")
    Set acelrange4a = ws4.Range("G19:G24")
    Set acelrange4b = ws4.Range("G25:G30")
    Set acelrange5a = ws5.Range("G19:G24")
    Set acelrange5b = ws5.Range("G25:G30")
    Set acelrange6a = ws6.Range("G19:G24")
    Set acelrange6b = ws6.Range("G25:G30")
    Set acelrange7a = ws7.Range("G19:G24")
    Set acelrange7b = ws7.Range("G25:G30")
    Set acelrange8a = ws8.Range("G19:G24")
    Set acelrange8b = ws8.Range("G25:G30")
    Set acelrange9a = ws9.Range("G19:G24")
    Set acelrange9b = ws9.Range("G25:G30")
    Set acelrange10a = ws10.Range("G19:G24")
    Set acelrange10b = ws10.Range("G25:G30")

    ' Encuentra los valores máximos de velocidad y aceleración
    vmax1a = Application.WorksheetFunction.Max(velrange1a)
    vmax1b = Application.WorksheetFunction.Max(velrange1b)
    vmax2a = Application.WorksheetFunction.Max(velrange2a)
    vmax2b = Application.WorksheetFunction.Max(velrange2b)
    vmax3a = Application.WorksheetFunction.Max(velrange3a)
    vmax3b = Application.WorksheetFunction.Max(velrange3b)
    vmax4a = Application.WorksheetFunction.Max(velrange4a)
    vmax4b = Application.WorksheetFunction.Max(velrange4b)
    vmax5a = Application.WorksheetFunction.Max(velrange5a)
    vmax5b = Application.WorksheetFunction.Max(velrange5b)
    vmax6a = Application.WorksheetFunction.Max(velrange6a)
    vmax6b = Application.WorksheetFunction.Max(velrange6b)
    vmax7a = Application.WorksheetFunction.Max(velrange7a)
    vmax7b = Application.WorksheetFunction.Max(velrange7b)
    vmax8a = Application.WorksheetFunction.Max(velrange8a)
    vmax8b = Application.WorksheetFunction.Max(velrange8b)
    vmax9a = Application.WorksheetFunction.Max(velrange9a)
    vmax9b = Application.WorksheetFunction.Max(velrange9b)
    vmax10a = Application.WorksheetFunction.Max(velrange10a)
    vmax10b = Application.WorksheetFunction.Max(velrange10b)
    amax1a = Application.WorksheetFunction.Max(acelrange1a)
    amax1b = Application.WorksheetFunction.Max(acelrange1b)
    amax2a = Application.WorksheetFunction.Max(acelrange2a)
    amax2b = Application.WorksheetFunction.Max(acelrange2b)
    amax3a = Application.WorksheetFunction.Max(acelrange3a)
    amax3b = Application.WorksheetFunction.Max(acelrange3b)
    amax4a = Application.WorksheetFunction.Max(acelrange4a)
    amax4b = Application.WorksheetFunction.Max(acelrange4b)
    amax5a = Application.WorksheetFunction.Max(acelrange5a)
    amax5b = Application.WorksheetFunction.Max(acelrange5b)
    amax6a = Application.WorksheetFunction.Max(acelrange6a)
    amax6b = Application.WorksheetFunction.Max(acelrange6b)
    amax7a = Application.WorksheetFunction.Max(acelrange7a)
    amax7b = Application.WorksheetFunction.Max(acelrange7b)
    amax8a = Application.WorksheetFunction.Max(acelrange8a)
    amax8b = Application.WorksheetFunction.Max(acelrange8b)
    amax9a = Application.WorksheetFunction.Max(acelrange9a)
    amax9b = Application.WorksheetFunction.Max(acelrange9b)
    amax10a = Application.WorksheetFunction.Max(acelrange10a)
    amax10b = Application.WorksheetFunction.Max(acelrange10b)
    
    ' Imprime los valores máximos en la hoja de valores
    val.Range("A1").Value = "Fecha"
    val.Range("B1").Value = "Vel max A B"
    val.Range("C1").Value = "Vel max C D"
    val.Range("D1").Value = "Acel max A B"
    val.Range("E1").Value = "Acel max C D"
    val.Range("A2").Value = fecha1
    val.Range("A3").Value = fecha2
    val.Range("A4").Value = fecha3
    val.Range("A5").Value = fecha4
    val.Range("A6").Value = fecha5
    val.Range("A7").Value = fecha6
    val.Range("A8").Value = fecha7
    val.Range("A9").Value = fecha8
    val.Range("A10").Value = fecha9
    val.Range("A11").Value = fecha10
    val.Range("B2").Value = vmax1a
    val.Range("C2").Value = vmax1b
    val.Range("D2").Value = amax1a
    val.Range("E2").Value = amax1b
    val.Range("B3").Value = vmax2a
    val.Range("C3").Value = vmax2b
    val.Range("D3").Value = amax2a
    val.Range("E3").Value = amax2b
    val.Range("B4").Value = vmax3a
    val.Range("C4").Value = vmax3b
    val.Range("D4").Value = amax3a
    val.Range("E4").Value = amax3b
    val.Range("B5").Value = vmax4a
    val.Range("C5").Value = vmax4b
    val.Range("D5").Value = amax4a
    val.Range("E5").Value = amax4b
    val.Range("B6").Value = vmax5a
    val.Range("C6").Value = vmax5b
    val.Range("D6").Value = amax5a
    val.Range("E6").Value = amax5b
    val.Range("B7").Value = vmax6a
    val.Range("C7").Value = vmax6b
    val.Range("D7").Value = amax6a
    val.Range("E7").Value = amax6b
    val.Range("B8").Value = vmax7a
    val.Range("C8").Value = vmax7b
    val.Range("D8").Value = amax7a
    val.Range("E8").Value = amax7b
    val.Range("B9").Value = vmax8a
    val.Range("C9").Value = vmax8b
    val.Range("D9").Value = amax8a
    val.Range("E9").Value = amax8b
    val.Range("B10").Value = vmax9a
    val.Range("C10").Value = vmax9b
    val.Range("D10").Value = amax9a
    val.Range("E10").Value = amax9b
    val.Range("B11").Value = vmax10a
    val.Range("C11").Value = vmax10b
    val.Range("D11").Value = amax10a
    val.Range("E11").Value = amax10b

    MsgBox "Proceso terminado"
   
End Sub

