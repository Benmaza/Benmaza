
Sub Datos120p2pts()
    ' Define las hojas de trabajo y las variables
    Dim fecha(1 To 120) As String, hojas(1 To 120) As String
    Dim val As Worksheet
    Dim velrange(1 To 120, 1 To 6) As Range, vmax(1 To 120, 1 To 6) As Double
    Dim acelrange(1 To 120, 1 To 6) As Range, amax(1 To 120, 1 To 6) As Double
    Dim rng As Range
    Dim cell As Range
    Dim count As Integer

    ' Lanza advertencia del proceso
    MsgBox "Se generara una nueva hoja llamada valores y en ella se anexaran los valores junto con su grafica, las graficas aparecen encimadas", vbExclamation, "Advertencia"

    ' Asigna los nombres de las hojas a las variables y define los rangos de velocidad y aceleraci�n
    On Error Resume Next
    Dim totalSheets As Integer
    totalSheets = ThisWorkbook.Sheets.count
    For i = totalSheets To totalSheets - 119 Step -1
        fecha(totalSheets - i + 1) = ThisWorkbook.Sheets(i).Name
            For j = 1 To 6
            Set velrange(totalSheets - i + 1, j) = ThisWorkbook.Sheets(i).Range("E" & (j + 18))
            Set acelrange(totalSheets - i + 1, j) = ThisWorkbook.Sheets(i).Range("G" & (j + 18))
            vmax(totalSheets - i + 1, j) = Application.WorksheetFunction.Max(velrange(totalSheets - i + 1, j))
            amax(totalSheets - i + 1, j) = Application.WorksheetFunction.Max(acelrange(totalSheets - i + 1, j))
        Next j
    Next i
    On Error GoTo 0

    ' Verificar si existe la hoja de "valores" y la crea
    Dim wsi As Worksheet
    Dim existe As Boolean
    existe = False
    For Each wsi In ThisWorkbook.Sheets
        If wsi.Name = "valores" Then
        existe = True
        Exit For
    End If
    Next wsi
    If existe = False Then
        Set val = ThisWorkbook.Sheets.Add
        val.Name = "valores"
    Else
        Set val = ThisWorkbook.Sheets("valores")
    End If

    ' Imprime los valores m�ximos en la hoja de valores
    ' Combinar celdas de A1 a M1 y agregar texto de Velocidades
    With val.Range("A1:G1")
    .Merge
    .HorizontalAlignment = xlCenter
    .VerticalAlignment = xlCenter
    .Value = "Velocidades"
    End With

    val.Range("A2:G2").Value = Array("Fecha", "AHV", "AVV", "AAV", "BHV", "BVV", "BAV")
    For i = 1 To 120
    val.Range("A" & i + 2 & ":G" & i + 2).Value = Array(fecha(i), vmax(i, 1), vmax(i, 2), vmax(i, 3), vmax(i, 4), vmax(i, 5), vmax(i, 6))
    Next i

    With val.Range("A125:G125")
    .Merge
    .HorizontalAlignment = xlCenter
    .VerticalAlignment = xlCenter
    .Value = "Aceleraciones"
    End With

    val.Range("A126:G126").Value = Array("Fecha", "AHA", "AVA", "AAA", "BHA", "BVA", "BAA")
    For i = 1 To 120
    val.Range("A" & i + 126 & ":G" & i + 126).Value = Array(fecha(i), amax(i, 1), amax(i, 2), amax(i, 3), amax(i, 4), amax(i, 5), amax(i, 6))
    Next i

    ' Ordenar los datos por fecha de la m�s antigua a la m�s reciente
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A3:A122"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange Range("A2:G122")
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A127:A246"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange Range("A126:G246")
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

    ' Dar formato a las celdas
    With val.Range("A3:A122")
        .HorizontalAlignment = xlLeft ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tama�o de la columna
    End With
    With val.Range("B3:G122")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tama�o de la columna
    End With

    ' Dar formato a las celdas
    With val.Range("A127:A246")
        .HorizontalAlignment = xlLeft ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tama�o de la columna
    End With
    With val.Range("B127:G246")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tama�o de la columna
    End With
    
    ' Identificar el formato de fecha y convertirlo a fecha de Excel
    Set rng = val.Range("A3:A122")
    For Each cell In rng
    count = 0
    If Len(cell.Value) >= 11 Then ' Si la fecha est� en el formato "YYMMDD ***"
        cell.Value = Mid(cell.Value, 3, 2) & Mid(cell.Value, 5, 2) & Mid(cell.Value, 7, 2) & Mid(cell.Value, 9, 3)
    ElseIf Len(cell.Value) = 8 Then ' Si la fecha est� en el formato "YYMMDD"
        cell.Value = Right(cell.Value, 2) & Mid(cell.Value, 3, 2) & Left(cell.Value, 2)
    'Si la celda tiene el mismo valor que la celda anterior, incrementa el contador
    ElseIf cell.Value = cell.Offset(-1, 0).Value Then
        count = count + 1
        ' Agrega un peque�o valor decimal a la celda para hacerla �nica
        cell.Value = cell.Value + count * 0.0001
    End If
    Next cell

    ' Crear una gr�fica de barras a partir de los datos de velocidad
    Dim chartObj As ChartObject
    Set chartObj = val.ChartObjects.Add(Left:=150, Width:=420, Top:=170, Height:=300)
    With chartObj.Chart
    ' Define la fuente de datos para la gr�fica
    Dim seriesNames As Variant
    seriesNames = Array("AHV", "AVV", "AAV", "BHV", "BVV", "BAV")
    
    For i = 1 To 6
        .SeriesCollection.NewSeries
        .SeriesCollection(i).Name = seriesNames(i - 1)
        .SeriesCollection(i).Values = val.Range(Cells(3, i + 1), Cells(122, i + 1))
        .SeriesCollection(i).XValues = val.Range("A3:A122")
    Next i
    
    .ChartType = xlLine ' Cambiar a gr�fica de l�neas
    .HasTitle = True
    .ChartTitle.Text = "Gr" & ChrW(225) & "fica de Valores de Velocidad"
    .Axes(xlCategory, xlPrimary).HasTitle = True
    .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
    .Axes(xlValue, xlPrimary).HasTitle = True
    .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
    .Axes(xlCategory).CategoryType = xlTimeScale ' Cambiar el tipo de escala del eje X a tiempo
    .Axes(xlCategory).TickLabels.Orientation = 90
    End With

    ' Crear una gr�fica de barras a partir de los datos de aceleraci�n
     Set chartObj = val.ChartObjects.Add(Left:=100, Width:=420, Top:=370, Height:=300)
    With chartObj.Chart
        
    seriesNames = Array("AHA", "AVA", "AAA", "BHA", "BVA", "BAA")

    For i = 1 To 6
        .SeriesCollection.NewSeries
        .SeriesCollection(i).Name = seriesNames(i - 1)
        .SeriesCollection(i).Values = val.Range(Cells(127, i + 1), Cells(246, i + 1))
        .SeriesCollection(i).XValues = val.Range("A127:A246")
    Next i

     .ChartType = xlLine ' Cambiar a gr�fica de l�neas
     .HasTitle = True
     .ChartTitle.Text = "Gr" & ChrW(225) & "fica de Valores de Aceleraci" & ChrW(243) & "n"
     .Axes(xlCategory, xlPrimary).HasTitle = True
     .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
     .Axes(xlValue, xlPrimary).HasTitle = True
     .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
     .Axes(xlCategory).CategoryType = xlTimeScale ' Cambiar el tipo de escala del eje X a tiempo
     .Axes(xlCategory).TickLabels.Orientation = 90
     End With
     
     MsgBox "Proceso terminado"
End Sub
    

