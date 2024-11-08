Sub VelMax()
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
        Sheets.Add.Name = "valores"
    End If
      
    ' Define las hojas de trabajo y las variables
    Dim fecha(1 To 10) As String, hojas(1 To 10) As String
    Dim val As Worksheet: Set val = ThisWorkbook.Sheets("valores")
    Dim velrange(1 To 10, 1 To 2) As Range, vmax(1 To 10, 1 To 2) As Double
    Dim acelrange(1 To 10, 1 To 2) As Range, amax(1 To 10, 1 To 2) As Double

    ' Pide el nombre de la hoja con advertencia de poner atencion
    MsgBox "Por favor, escriba el nombre de las hojas con cuidado, ya que si la escribe mal se cancela el programa", vbExclamation, "Advertencia"

    ' Asigna los nombres de las hojas a las variables y define los rangos de velocidad y aceleración
    On Error Resume Next
    For i = 1 To 10
        Do
            hojas(i) = InputBox("Nombre de la hoja " & i)
            Set ws(i) = ThisWorkbook.Sheets(hojas(i))
            If ws(i) Is Nothing Then
                MsgBox "La hoja " & hojas(i) & " no existe. Por favor, intente de nuevo."
            End If
        Loop Until Not ws(i) Is Nothing
        fecha(i) = ws(i).Name
        Set velrange(i, 1) = ws(i).Range("E19:E24")
        Set velrange(i, 2) = ws(i).Range("E25:E30")
        Set acelrange(i, 1) = ws(i).Range("G19:G24")
        Set acelrange(i, 2) = ws(i).Range("G25:G30")
        vmax(i, 1) = Application.WorksheetFunction.Max(velrange(i, 1))
        vmax(i, 2) = Application.WorksheetFunction.Max(velrange(i, 2))
        amax(i, 1) = Application.WorksheetFunction.Max(acelrange(i, 1))
        amax(i, 2) = Application.WorksheetFunction.Max(acelrange(i, 2))
    Next i
    On Error GoTo 0

    ' Imprime los valores máximos en la hoja de valores
    val.Range("A1:E1").Value = Array("Fecha", "Vel max A B", "Vel max C D", "Acel max A B", "Acel max C D")
    For i = 1 To 10
    val.Range("A" & i + 1 & ":E" & i + 1).Value = Array(CDate(fecha(i)), vmax(i, 1), vmax(i, 2), amax(i, 1), amax(i, 2))
    Next i
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
    .SetSourceData Source:=val.Range("A1:E11")
    .ChartType = xlLine ' Cambiar a gráfica de líneas
    .HasTitle = True
    .ChartTitle.Text = "Gráfica de Valores Máximos"
    .Axes(xlCategory, xlPrimary).HasTitle = True
    .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Valores"
    .Axes(xlValue, xlPrimary).HasTitle = True
    .Axes(xlValue, xlPrimary).AxisTitle.Text = "Fecha"
    End With

    MsgBox "Proceso terminado"
End Sub

