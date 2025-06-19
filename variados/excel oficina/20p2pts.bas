Sub Datos20p2pts()
    ' Define las hojas de trabajo y las variables
    Dim fechas(1 To 20) As String
    Dim vmax(1 To 20, 1 To 6) As Double, amax(1 To 20, 1 To 6) As Double
    Dim val As Worksheet
    Dim i As Integer, j As Integer

    MsgBox "Se generará una nueva hoja llamada valores y en ella se anexarán los valores junto con sus gráficas", vbExclamation, "Advertencia"

    ' Obtener nombres de hojas y valores máximos
    Dim totalSheets As Integer
    totalSheets = ThisWorkbook.Sheets.Count
    For i = 1 To 20
        Dim ws As Worksheet
        Set ws = ThisWorkbook.Sheets(totalSheets - 20 + i)
        fechas(i) = ws.Name
        For j = 1 To 6
            vmax(i, j) = ws.Range("E" & (j + 18)).Value
            amax(i, j) = ws.Range("G" & (j + 18)).Value
        Next j
    Next i

    ' Crear o limpiar hoja "valores"
    On Error Resume Next
    Set val = ThisWorkbook.Sheets("valores")
    If val Is Nothing Then
        Set val = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        val.Name = "valores"
    Else
        val.Cells.Clear
    End If
    On Error GoTo 0

    ' Escribir encabezados y datos
    val.Range("A1:G1").Merge
    val.Range("A1").Value = "Velocidades"
    val.Range("A2:G2").Value = Array("Fecha", "AHV", "AVV", "AAV", "BHV", "BVV", "BAV")
    For i = 1 To 20
        val.Range("A" & i + 2 & ":G" & i + 2).Value = Array(fechas(i), vmax(i, 1), vmax(i, 2), vmax(i, 3), vmax(i, 4), vmax(i, 5), vmax(i, 6))
    Next i

    val.Range("A25:G25").Merge
    val.Range("A25").Value = "Aceleraciones"
    val.Range("A26:G26").Value = Array("Fecha", "AHA", "AVA", "AAA", "BHA", "BVA", "BAA")
    For i = 1 To 20
        val.Range("A" & i + 26 & ":G" & i + 26).Value = Array(fechas(i), amax(i, 1), amax(i, 2), amax(i, 3), amax(i, 4), amax(i, 5), amax(i, 6))
    Next i

    ' Formato
    val.Columns("A:G").AutoFit
    val.Range("B3:G22,B27:G46").NumberFormat = "0.00"
    val.Range("A3:A22,A27:A46").HorizontalAlignment = xlLeft
    val.Range("B3:G22,B27:G46").HorizontalAlignment = xlCenter

    ' Ordenar por fecha (asumiendo formato adecuado)
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A3:A22"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange val.Range("A2:G22")
        .Header = xlYes
        .Apply
    End With
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A27:A46"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange val.Range("A26:G46")
        .Header = xlYes
        .Apply
    End With

    ' Crear gráficos
    Call CrearGrafico(val, 3, 22, "Velocidades", Array("AHV", "AVV", "AAV", "BHV", "BVV", "BAV"), 150, 170, 420, 300, "Gráfica de Valores de Velocidad")
    Call CrearGrafico(val, 27, 46, "Aceleraciones", Array("AHA", "AVA", "AAA", "BHA", "BVA", "BAA"), 100, 370, 420, 300, "Gráfica de Valores de Aceleración")

    MsgBox "Proceso terminado"
End Sub

Private Sub CrearGrafico(ws As Worksheet, filaIni As Integer, filaFin As Integer, titulo As String, seriesNames As Variant, left As Integer, top As Integer, width As Integer, height As Integer, chartTitle As String)
    Dim chartObj As ChartObject
    Set chartObj = ws.ChartObjects.Add(Left:=left, Width:=width, Top:=top, Height:=height)
    With chartObj.Chart
        Dim i As Integer
        For i = 1 To 6
            .SeriesCollection.NewSeries
            .SeriesCollection(i).Name = seriesNames(i - 1)
            .SeriesCollection(i).Values = ws.Range(ws.Cells(filaIni, i + 1), ws.Cells(filaFin, i + 1))
            .SeriesCollection(i).XValues = ws.Range(ws.Cells(filaIni, 1), ws.Cells(filaFin, 1))
        Next i
        .ChartType = xlLine
        .HasTitle = True
        .ChartTitle.Text = chartTitle
        .Axes(xlCategory, xlPrimary).HasTitle = True
        .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
        .Axes(xlValue, xlPrimary).HasTitle = True
        .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
        .Axes(xlCategory).CategoryType = xlTimeScale
        .Axes(xlCategory).TickLabels.Orientation = 90
    End With
End Sub


