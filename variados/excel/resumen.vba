Sub ExportarResumenConGraficas()
    Dim ws As Worksheet, hojaResumen As Worksheet
    Dim fila As Long, colOffset As Variant
    Dim etiquetas As Variant
    Dim numero As Double
    Dim encabezados2D() As Variant
    Dim datos() As Variant
    Dim i As Long, j As Long, dataIndex As Long
    Dim numPuntos As String
    Dim respuesta As VbMsgBoxResult
    Dim numEtiquetas As Long
    Dim idx As Long
    Dim hojasDisponibles As Long
    Dim numHojasStr As String, numHojas As Long
    Dim hojasAProcesar As Collection, hojasInvertidas As Collection
    Dim chart1 As ChartObject, chart2 As ChartObject
    Dim colVelocidad As Variant, colAceleracion As Variant
    Dim colLetra As Variant, colIndex As Long

    colOffset = Array(3, 5, 7) ' Columnas C, E, G

    etiquetas = Array( _
        "AHD", "AHV", "AHA", "AVD", "AVV", "AVA", "AAD", "AAV", "AAA", _
        "BHD", "BHV", "BHA", "BVD", "BVV", "BVA", "BAD", "BAV", "BAA", _
        "CHD", "CHV", "CHA", "CVD", "CVV", "CVA", "CAD", "CAV", "CAA", _
        "DHD", "DHV", "DHA", "DVD", "DVV", "DVA", "DAD", "DAV", "DAA", _
        "EHD", "EHV", "EHA", "EVD", "EVV", "EVA", "EAD", "EAV", "EAA", _
        "FHD", "FHV", "FHA", "FVD", "FVV", "FVA", "FAD", "FAV", "FAA")

    numPuntos = InputBox("¿Cuántos puntos desea procesar?" & vbCrLf & vbCrLf & _
                         "2 puntos: AH, BH" & vbCrLf & _
                         "4 puntos: AH, BH, CH, DH" & vbCrLf & _
                         "6 puntos: AH, BH, CH, DH, EH, FH", _
                         "Seleccionar cantidad de puntos", " ")

    If numPuntos = "" Then Exit Sub
    If Not IsNumeric(numPuntos) Or (numPuntos <> "2" And numPuntos <> "4" And numPuntos <> "6") Then
        MsgBox "Por favor ingrese 2, 4 o 6 puntos.", vbExclamation
        Exit Sub
    End If

    numEtiquetas = CLng(numPuntos) * 9

    If hojaExiste("resumen") Then
        respuesta = MsgBox("Ya existe una hoja llamada 'resumen'. ¿Desea reemplazarla?", vbYesNo + vbQuestion)
        If respuesta = vbNo Then Exit Sub
        Application.DisplayAlerts = False
        ThisWorkbook.Worksheets("resumen").Delete
        Application.DisplayAlerts = True
    End If

    hojasDisponibles = ThisWorkbook.Worksheets.Count
    If hojaExiste("resumen") Then hojasDisponibles = hojasDisponibles - 1

    numHojasStr = InputBox("¿Cuantas hojas desea procesar?" & vbCrLf & _
                           "(Maximo: " & hojasDisponibles & ")", _
                           "Seleccionar cantidad de hojas", hojasDisponibles)

    If numHojasStr = "" Then Exit Sub
    If Not IsNumeric(numHojasStr) Then
        MsgBox "Por favor ingrese un número válido.", vbExclamation
        Exit Sub
    End If

    numHojas = CLng(numHojasStr)
    If numHojas < 1 Or numHojas > hojasDisponibles Then
        MsgBox "Debe ingresar un número entre 1 y " & hojasDisponibles & ".", vbExclamation
        Exit Sub
    End If

    Set hojaResumen = ThisWorkbook.Worksheets.Add
    hojaResumen.Name = "resumen"

    ReDim encabezados2D(1 To 1, 1 To numEtiquetas + 1)
    encabezados2D(1, 1) = "FECHA"
    For i = 0 To numEtiquetas - 1
        encabezados2D(1, i + 2) = etiquetas(i)
    Next i
    hojaResumen.Range("A1").Resize(1, numEtiquetas + 1).Value = encabezados2D

    Set hojasAProcesar = New Collection
    For idx = ThisWorkbook.Worksheets.Count To 1 Step -1
        Set ws = ThisWorkbook.Worksheets(idx)
        If ws.Name <> "resumen" Then
            hojasAProcesar.Add ws
            If hojasAProcesar.Count = numHojas Then Exit For
        End If
    Next idx

    Set hojasInvertidas = New Collection
    For idx = hojasAProcesar.Count To 1 Step -1
        hojasInvertidas.Add hojasAProcesar(idx)
    Next idx

    ReDim datos(1 To hojasInvertidas.Count, 1 To numEtiquetas + 1)
    i = 1

    For Each ws In hojasInvertidas
        datos(i, 1) = ws.Name
        dataIndex = 2

        For fila = 19 To 19 + (numEtiquetas \ 3) - 1
            For j = 0 To 2
                On Error Resume Next
                numero = CDbl(ws.Cells(fila, colOffset(j)).Value)
                If Err.Number <> 0 Then
                    numero = 0
                    Err.Clear
                End If
                On Error GoTo 0
                datos(i, dataIndex) = Format(numero, "0.00")
                dataIndex = dataIndex + 1
            Next j
        Next fila
        i = i + 1
    Next ws

    hojaResumen.Range("A2").Resize(hojasInvertidas.Count, numEtiquetas + 1).Value = datos
    hojaResumen.Columns.AutoFit

    ' Definir columnas para gráficas según puntos
    Select Case numPuntos
        Case "2"
            colVelocidad = Array("C", "F", "I", "L", "O", "R")
            colAceleracion = Array("D", "G", "J", "M", "P", "S")
        Case "4"
            colVelocidad = Array("C", "F", "I", "L", "O", "R", "U", "X", "AA", "AD", "AG", "AJ")
            colAceleracion = Array("D", "G", "J", "M", "P", "S", "V", "Y", "AB", "AE", "AH", "AK")
        Case "6"
            colVelocidad = Array("C", "F", "I", "L", "O", "R", "U", "X", "AA", "AD", "AG", "AJ", "AM", "AP", "AS", "AV", "AY", "BB")
            colAceleracion = Array("D", "G", "J", "M", "P", "S", "V", "Y", "AB", "AE", "AH", "AK", "AN", "AQ", "AT", "AW", "AZ", "BC")
    End Select

    ' Crear gráfico de Velocidad
    Set chart1 = hojaResumen.ChartObjects.Add(Left:=10, Width:=600, Top:=hojaResumen.Cells(i + 3, 1).Top, Height:=300)
    With chart1.Chart
        .ChartType = xlLine
        .HasTitle = True
        .ChartTitle.Text = "Velocidad"
        .HasLegend = True
        For Each colLetra In colVelocidad
            colIndex = hojaResumen.Range(colLetra & "1").Column
            With .SeriesCollection.NewSeries
                .Values = hojaResumen.Range(hojaResumen.Cells(2, colIndex), hojaResumen.Cells(i - 1, colIndex))
                .XValues = hojaResumen.Range("A2:A" & (i - 1))
                .Name = hojaResumen.Cells(1, colIndex).Value
            End With
        Next colLetra
    End With

    ' Crear gráfico de Aceleración
    Set chart2 = hojaResumen.ChartObjects.Add(Left:=630, Width:=600, Top:=hojaResumen.Cells(i + 3, 1).Top, Height:=300)
    With chart2.Chart
        .ChartType = xlLine
        .HasTitle = True
        .ChartTitle.Text = "Aceleracion"
        .HasLegend = True
        For Each colLetra In colAceleracion
            colIndex = hojaResumen.Range(colLetra & "1").Column
            With .SeriesCollection.NewSeries
                .Values = hojaResumen.Range(hojaResumen.Cells(2, colIndex), hojaResumen.Cells(i - 1, colIndex))
                .XValues = hojaResumen.Range("A2:A" & (i - 1))
                .Name = hojaResumen.Cells(1, colIndex).Value
            End With
        Next colLetra
    End With

    MsgBox "Resumen y graficas generados correctamente en la hoja 'resumen'" & vbCrLf & vbCrLf & _
           "Codigo de la macro por Ben Maza", vbInformation
End Sub

Function hojaExiste(nombreHoja As String) As Boolean
    On Error Resume Next
    hojaExiste = Not ThisWorkbook.Worksheets(nombreHoja) Is Nothing
    On Error GoTo 0
End Function
