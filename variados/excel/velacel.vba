Sub Valoresvelacel()
    ' Define las hojas de trabajo y las variables
    Dim fecha(1 To 10) As String, hojas(1 To 10) As String
    Dim val As Worksheet
    Dim velrange(1 To 10, 1 To 2) As Range, vmax(1 To 10, 1 To 2) As Double
    Dim acelrange(1 To 10, 1 To 2) As Range, amax(1 To 10, 1 To 2) As Double

    ' Pide el nombre de la hoja con advertencia de poner atencion
    MsgBox "En este momento se generara una nueva hoja llamada valores y en ella se anexaran los valores junto con su grafica", vbExclamation, "Advertencia"

    ' Asigna los nombres de las hojas a las variables y define los rangos de velocidad y aceleración
    On Error Resume Next
    Dim totalSheets As Integer
    totalSheets = ThisWorkbook.Sheets.Count
    For i = totalSheets To totalSheets - 9 Step -1
        fecha(totalSheets - i + 1) = ThisWorkbook.Sheets(i).Name
        Set velrange(totalSheets - i + 1, 1) = ThisWorkbook.Sheets(i).Range("E19:E24")
        Set velrange(totalSheets - i + 1, 2) = ThisWorkbook.Sheets(i).Range("E25:E30")
        Set acelrange(totalSheets - i + 1, 1) = ThisWorkbook.Sheets(i).Range("G19:G24")
        Set acelrange(totalSheets - i + 1, 2) = ThisWorkbook.Sheets(i).Range("G25:G30")
        vmax(totalSheets - i + 1, 1) = Application.WorksheetFunction.Max(velrange(totalSheets - i + 1, 1))
        vmax(totalSheets - i + 1, 2) = Application.WorksheetFunction.Max(velrange(totalSheets - i + 1, 2))
        amax(totalSheets - i + 1, 1) = Application.WorksheetFunction.Max(acelrange(totalSheets - i + 1, 1))
        amax(totalSheets - i + 1, 2) = Application.WorksheetFunction.Max(acelrange(totalSheets - i + 1, 2))
    Next i
    On Error GoTo 0

    ' Verificar si existe la hoja de valores
    Dim ws(1 To 10) As Worksheet
    Dim wsi As Worksheet
    Dim existe As Boolean
    existe = False
    For Each wsi In ThisWorkbook.Sheets
        If wsi.Name = "valores" Then
            existe = True
            Exit For
        End If
    Next wsi
    ' Crear la hoja de valores si no existe al final del libro
    If existe = False Then
        Set val = ThisWorkbook.Sheets.Add
        val.Name = "valores"
    Else
        Set val = ThisWorkbook.Sheets("valores")
    End If

    ' Imprime los valores máximos en la hoja de valores
    val.Range("A1:E1").Value = Array("Fecha", "Vel max A B", "Vel max C D", "Acel max A B", "Acel max C D")
    For i = 1 To 10
        val.Range("A" & i + 1 & ":E" & i + 1).Value = Array(fecha(i), vmax(i, 1), vmax(i, 2), amax(i, 1), amax(i, 2))
    Next i

    ' Ordenar los datos por fecha de la más antigua a la más reciente
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=Range("A2:A11"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
    .SetRange Range("A1:E11")
    .Header = xlYes
    .MatchCase = False
    .Orientation = xlTopToBottom
    .SortMethod = xlPinYin
    .Apply
    End With

    ' Dar formato a las celdas
    With val.Range("A1:A11")
        .HorizontalAlignment = xlLeft ' Centrar el texto
    End With
    With val.Range("B1:E11")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
    End With

  ' Crear una gráfica de barras a partir de los datos
    Dim chartObj As ChartObject
    Set chartObj = val.ChartObjects.Add(Left:=100, Width:=375, Top:=50, Height:=225)
    With chartObj.Chart
    ' Define la fuente de datos para la gráfica
    .SeriesCollection.NewSeries
    .SeriesCollection(1).Name = "Vel max A B"
    .SeriesCollection(1).Values = val.Range("B2:B11")
    .SeriesCollection(1).XValues = val.Range("A2:A11")
    
    .SeriesCollection.NewSeries
    .SeriesCollection(2).Name = "Vel max C D"
    .SeriesCollection(2).Values = val.Range("C2:C11")
    .SeriesCollection(2).XValues = val.Range("A2:A11")
    
    .SeriesCollection.NewSeries
    .SeriesCollection(3).Name = "Acel max A B"
    .SeriesCollection(3).Values = val.Range("D2:D11")
    .SeriesCollection(3).XValues = val.Range("A2:A11")
    
    .SeriesCollection.NewSeries
    .SeriesCollection(4).Name = "Acel max C D"
    .SeriesCollection(4).Values = val.Range("E2:E11")
    .SeriesCollection(4).XValues = val.Range("A2:A11")

    .ChartType = xlLine ' Cambiar a gráfica de líneas
    .HasTitle = True
    .ChartTitle.Text = "Gr" & ChrW(225) & "fica de Valores M" & ChrW(225) & "ximos"
    .Axes(xlCategory, xlPrimary).HasTitle = True
    .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
    .Axes(xlValue, xlPrimary).HasTitle = True
    .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
    .Axes(xlCategory).CategoryType = xlTimeScale ' Cambiar el tipo de escala del eje X a tiempo
    End With

    MsgBox "Proceso terminado"
End Sub