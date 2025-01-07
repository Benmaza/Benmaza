Sub Peaks60()
    ' Define las hojas de trabajo y las variables
    Dim fecha(1 To 60) As String, hojas(1 To 60) As String
    Dim val As Worksheet
    Dim velrange(1 To 60) As Range, vmax(1 To 60) As Double
    Dim acelrange(1 To 60) As Range, amax(1 To 60) As Double
    Dim rng As Range
    Dim cell As Range
    Dim count As Integer

    ' Pide el nombre de la hoja con advertencia de poner atencion
    MsgBox "En este momento se generara una nueva hoja llamada valores y en ella se anexaran los valores junto con su grafica, las graficas aparecen encimadas", vbExclamation, "Advertencia"

    ' Asigna los nombres de las hojas a las variables y define los rangos de velocidad y aceleración
    On Error Resume Next
    Dim totalSheets As Integer
    totalSheets = ThisWorkbook.Sheets.count
    For i = totalSheets To totalSheets - 59 Step -1
        fecha(totalSheets - i + 1) = ThisWorkbook.Sheets(i).Name
        Set velrange(totalSheets - i + 1) = ThisWorkbook.Sheets(i).Range("E38")
        Set acelrange(totalSheets - i + 1) = ThisWorkbook.Sheets(i).Range("G38")
        vmax(totalSheets - i + 1) = Application.WorksheetFunction.Max(velrange(totalSheets - i + 1))
        amax(totalSheets - i + 1) = Application.WorksheetFunction.Max(acelrange(totalSheets - i + 1))
    Next i
    On Error GoTo 0

    ' Verificar si existe la hoja de valores
    Dim wsi As Worksheet
    Dim existe As Boolean
    existe = False
    For Each wsi In ThisWorkbook.Sheets
        If wsi.Name = "PEAKVUES" Then
            existe = True
            Exit For
        End If
    Next wsi

    ' Crear la hoja de valores si no existe al final del libro
    If existe = False Then
        Set val = ThisWorkbook.Sheets.Add
        val.Name = "PEAKVUES"
    Else
        Set val = ThisWorkbook.Sheets("PEAKVUES")
    End If

    ' Imprime los valores máximos en la hoja de valores
    ' Combinar celdas de A1 a C1 y agregar texto de Velocidades
    With val.Range("A1:C1")
        .Merge
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Value = "PEAKVUES"
    End With

    val.Range("A2:C2").Value = Array("Fecha", "AHP", "BHP")
    For i = 1 To 60
        val.Range("A" & i + 2 & ":C" & i + 2).Value = Array(fecha(i), vmax(i), amax(i))
    Next i

    ' Ordenar los datos por fecha de la más antigua a la más reciente
    val.Sort.SortFields.Clear
    val.Sort.SortFields.Add Key:=val.Range("A3:A62"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With val.Sort
        .SetRange Range("A2:C62")
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With

    ' Dar formato a las celdas
    With val.Range("A3:A62")
        .HorizontalAlignment = xlLeft ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With
    With val.Range("B3:C62")
        .NumberFormat = "0.00" ' Formato de dos decimales
        .HorizontalAlignment = xlCenter ' Centrar el texto
        .EntireColumn.AutoFit ' Ajustar el tamaño de la columna
    End With

    ' Crear una gráfica de barras a partir de los datos de Peakvue
    Dim chartObj As ChartObject
    Set chartObj = val.ChartObjects.Add(Left:=100, Width:=420, Top:=370, Height:=300)
    With chartObj.Chart
        ' Define la fuente de datos para la gráfica
        .SetSourceData Source:=val.Range("A2:C62")
        .ChartType = xlLine ' Cambiar a gráfica de líneas
        .HasTitle = True
        .ChartTitle.Text = "Gráfica de Valores de Peakvues"
        .Axes(xlCategory, xlPrimary).HasTitle = True
        .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Fecha"
        .Axes(xlValue, xlPrimary).HasTitle = True
        .Axes(xlValue, xlPrimary).AxisTitle.Text = "Valores"
        .Axes(xlCategory).CategoryType = xlTimeScale ' Cambiar el tipo de escala del eje X a tiempo
        .Axes(xlCategory).TickLabels.Orientation = 90
    End With

    MsgBox "Proceso terminado"
End Sub
