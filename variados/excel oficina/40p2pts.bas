Attribute VB_Name = "Module3"
Sub Datos40p2pts()
    ' Define las hojas de trabajo y las variables
    Dim fecha(1 To 40) As String, hojas(1 To 40) As String
    Dim val As Worksheet
    Dim velrange(1 To 40, 1 To 6) As Range, vmax(1 To 40, 1 To 6) As Double
    Dim acelrange(1 To 40, 1 To 6) As Range, amax(1 To 40, 1 To 6) As Double
    Dim rng As Range
    Dim cell As Range
    Dim count As Integer

    ' Lanza advertencia del proceso
    MsgBox "Se generara una nueva hoja llamada valores y en ella se anexaran los valores junto con su grafica, las graficas aparecen encimadas", vbExclamation, "Advertencia"

    ' Asigna los nombres de las hojas a las variables y define los rangos de velocidad y aceleración
    On Error Resume Next
    Dim totalSheets As Integer
    totalSheets = ThisWorkbook.Sheets.count
    For i = totalSheets To totalSheets - 39 Step -1
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

    ' Imprime los valores máximos en la hoja de valores
    ' Combinar celdas de A1 a M1 y agregar texto de Velocidades
    With val.Range("A1:G1")
    .Merge
    .HorizontalAlignment = xlCenter
    .VerticalAlignment = xlCenter
    .Value = "Velocidades"
    End With

    val.Range("A2:G2").Value = Array("Fecha", "AHV", "AVV", "AAV", "BHV", "BVV", "BAV")
    For i = 1 To 40
    val.Range("A" & i + 2 & ":G" & i + 2).Value = Array(fecha(i), vmax(i, 1), vmax(i, 2), vmax(i, 3), vmax(i, 4), vmax(i, 5), vmax(i, 6))
    Next i

    With val.Range("A45:G45")
    .Merge
    .HorizontalAlignment = xlCenter
    .VerticalAlignment = xlCenter
    .Value = "Aceleraciones"
    End With

    val.Range("A46:G46").Value = Array("Fecha", "AHA", "AVA", "AAA", "BHA", "BVA", "BAA")
    For i = 1 To 40
    val.Range("A" & i + 46 & ":G" & i + 46).Value = Array(fecha(i), amax(i, 1), amax(i, 2), amax(i, 3), amax(i, 4), amax(i, 5), amax(i, 6))
    Next i

    ' Ordenar los datos por fecha de la más antigua a la más reciente
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A3:A42"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange Range("A2:G42")
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A47:A86"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange Range("A46:G86")
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

    ' Dar formato a las celdas
    With val.Range("A3:A42")
        .HorizontalAlignment = xlLeft ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With
    With val.Range("B3:G42")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With

    ' Dar formato a las celdas
    With val.Range("A47:A86")
        .HorizontalAlignment = xlLeft ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With
    With val.Range("B47:G86")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With
    
    ' Identificar el formato de fecha y convertirlo a fecha de Excel
    Set rng = val.Range("A3:A42")
    For Each cell In rng
    count = 0
    If Len(cell.Value) >= 11 Then ' Si la fecha está en el formato "YYMMDD ***"
        cell.Value = Mid(cell.Value, 3, 2) & Mid(cell.Value, 5, 2) & Mid(cell.Value, 7, 2) & Mid(cell.Value, 9, 3)
    ElseIf Len(cell.Value) = 8 Then ' Si la fecha está en el formato "YYMMDD"
        cell.Value = Right(cell.Value, 2) & Mid(cell.Value, 3, 2) & Left(cell.Value, 2)
    'Si la celda tiene el mismo valor que la celda anterior, incrementa el contador
    ElseIf cell.Value = cell.Offset(-1, 0).Value Then
        count = count + 1
        ' Agrega un pequeño valor decimal a la celda para hacerla única
        cell.Value = cell.Value + count * 0.0001
    End If
    Next cell

    ' Crear una gráfica de barras a partir de los datos de velocidad
    Dim chartObj As ChartObject
    Set chartObj = val.ChartObjects.Add(Left:=150, Width:=420, Top:=170, Height:=300)
    With chartObj.Chart
    ' Define la fuente de datos para la gráfica
    Dim seriesNames As Variant
    seriesNames = Array("AHV", "AVV", "AAV", "BHV", "BVV", "BAV")
    
    For i = 1 To 6
        .SeriesCollection.NewSeries
        .SeriesCollection(i).Name = seriesNames(i - 1)
        .SeriesCollection(i).Values = val.Range(Cells(3, i + 1), Cells(42, i + 1))
        .SeriesCollection(i).XValues = val.Range("A3:A42")
    Next i
    
    .ChartType = xlLine ' Cambiar a gráfica de líneas
    .HasTitle = True
    .ChartTitle.Text = "Gr" & ChrW(225) & "fica de Valores de Velocidad"
    .Axes(xlCategory, xlPrimary).HasTitle = True
    .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
    .Axes(xlValue, xlPrimary).HasTitle = True
    .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
    .Axes(xlCategory).CategoryType = xlTimeScale ' Cambiar el tipo de escala del eje X a tiempo
    .Axes(xlCategory).TickLabels.Orientation = 90
    End With

    ' Crear una gráfica de barras a partir de los datos de aceleración
     Set chartObj = ws.ChartObjects.Add(Left:=100, Width:=420, Top:=370, Height:=300)
     With chartObj.Chart
        
    seriesNames = Array("AHA", "AVA", "AAA", "BHA", "BVA", "BAA")

    For i = 1 To 40
    .SeriesCollection.NewSeries
    .SeriesCollection(i).Name = seriesNames(i - 1)
    .SeriesCollection(i).Values = ws.Range(ws.Cells(27, i + 1), ws.Cells(46, i + 1))
    .SeriesCollection(i).XValues = ws.Range("A27:A46")
    Next i

     .ChartType = xlLine ' Cambiar a gráfica de líneas
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
    
