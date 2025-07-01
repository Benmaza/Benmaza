Sub ExportarResumenConGraficas()
    Dim ws As Worksheet, hojaResumen As Worksheet
    Dim fila As Long, colOffset As Variant
    Dim sufijos As Variant, grupos As Variant
    Dim s As Long, grupoIndex As Long
    Dim numero As Double
    Dim encabezados() As String
    Dim datos() As Variant
    Dim i As Long, dataIndex As Long
    Dim numPuntos As String
    Dim headerIndex As Long
    Dim respuesta As VbMsgBoxResult
    Dim chart1 As ChartObject, chart2 As ChartObject
    Dim colVelocidades As Variant, colAceleraciones As Variant
    Dim j As Variant
    Dim numHojasStr As String, numHojas As Long
    Dim hojasDisponibles As Long
    Dim hojasAProcesar As Collection, hojasInvertidas As Collection
    Dim idx As Long

    ' Constantes para columnas base
    Const COL_DISTANCIA As Long = 3 ' Columna C
    Const COL_VELOCIDAD As Long = 5 ' Columna E
    Const COL_ACELERACION As Long = 7 ' Columna G

    ' Solicitar al usuario cuántos puntos quiere procesar
    numPuntos = InputBox("¿Cuántos puntos desea procesar?" & vbCrLf & vbCrLf & _
                        "2 puntos: AH, BH (C19:G24)" & vbCrLf & _
                        "4 puntos: AH, BH, CH, DH (C19:G30)" & vbCrLf & _
                        "6 puntos: AH, BH, CH, DH, EH, FH (C19:G36)", "Seleccionar cantidad de puntos", "2")
    
    If numPuntos = "" Then Exit Sub
    If Not IsNumeric(numPuntos) Or (numPuntos <> "2" And numPuntos <> "4" And numPuntos <> "6") Then
        MsgBox "Por favor ingrese 2, 4 o 6 puntos.", vbExclamation
        Exit Sub
    End If

    ' Definir grupos según la selección del usuario
    Select Case numPuntos
        Case "2": grupos = Array("AH", "BH")
        Case "4": grupos = Array("AH", "BH", "CH", "DH")
        Case "6": grupos = Array("AH", "BH", "CH", "DH", "EH", "FH")
    End Select

    sufijos = Array("D", "V", "A")
    colOffset = Array(COL_DISTANCIA, COL_VELOCIDAD, COL_ACELERACION)

    ' Verificar si existe la hoja "resumen"
    If hojaExiste("resumen") Then
        respuesta = MsgBox("Ya existe una hoja llamada 'resumen'. ¿Desea reemplazarla?", vbYesNo + vbQuestion)
        If respuesta = vbNo Then Exit Sub
        Application.DisplayAlerts = False
        ThisWorkbook.Worksheets("resumen").Delete
        Application.DisplayAlerts = True
    End If

    ' Solicitar cuántas hojas procesar
    hojasDisponibles = ThisWorkbook.Worksheets.Count
    If hojaExiste("resumen") Then hojasDisponibles = hojasDisponibles - 1

    numHojasStr = InputBox("¿Cuántas hojas desea procesar?" & vbCrLf & _
                           "(Máximo: " & hojasDisponibles & ")", _
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

    ' Crear hoja nueva
    Set hojaResumen = ThisWorkbook.Worksheets.Add
    hojaResumen.Name = "resumen"

    ' Construir encabezados
    ReDim encabezados(0 To 1 + (UBound(grupos) + 1) * 3 - 1)
    encabezados(0) = "FECHA"
    headerIndex = 1
    For grupoIndex = 0 To UBound(grupos)
        For s = 0 To 2
            encabezados(headerIndex) = grupos(grupoIndex) & sufijos(s)
            headerIndex = headerIndex + 1
        Next s
    Next grupoIndex
    hojaResumen.Range("A1").Resize(1, UBound(encabezados) + 1).Value = encabezados

    ' Recolectar las hojas más recientes
    Set hojasAProcesar = New Collection
    For idx = ThisWorkbook.Worksheets.Count To 1 Step -1
        Set ws = ThisWorkbook.Worksheets(idx)
        If ws.Name <> "resumen" Then
            hojasAProcesar.Add ws
            If hojasAProcesar.Count = numHojas Then Exit For
        End If
    Next idx

    ' Invertir el orden para que se impriman de la más antigua a la más reciente
    Set hojasInvertidas = New Collection
    For idx = hojasAProcesar.Count To 1 Step -1
        hojasInvertidas.Add hojasAProcesar(idx)
    Next idx

    ' Recolectar datos
    ReDim datos(1 To hojasInvertidas.Count, 1 To UBound(encabezados) + 1)
    i = 1

    For Each ws In hojasInvertidas
        datos(i, 1) = ws.Name
        dataIndex = 2

        For grupoIndex = 0 To UBound(grupos)
            fila = 19 + grupoIndex
            For s = 0 To 2
                On Error Resume Next
                numero = CDbl(ws.Cells(fila, colOffset(s)).Value)
                If Err.Number <> 0 Then
                    numero = 0
                    Err.Clear
                End If
                On Error GoTo 0
                datos(i, dataIndex) = Format(numero, "0.00")
                dataIndex = dataIndex + 1
            Next s
        Next grupoIndex
        i = i + 1
    Next ws

    hojaResumen.Range("A2").Resize(hojasInvertidas.Count, UBound(encabezados) + 1).Value = datos
    hojaResumen.Columns.AutoFit

    ' Definir columnas para gráficas según cantidad de puntos
    Select Case numPuntos
        Case "2"
            colVelocidades = Array(3, 6) ' C, F
            colAceleraciones = Array(4, 7) ' D, G
        Case "4"
            colVelocidades = Array(3, 6, 9, 12) ' C, F, I, L
            colAceleraciones = Array(4, 7, 10, 13) ' D, G, J, M
        Case "6"
            colVelocidades = Array(3, 6, 9, 12, 15, 18) ' C, F, I, L, O, R
            colAceleraciones = Array(4, 7, 10, 13, 16, 19) ' D, G, J, M, P, S
    End Select

    ' Crear gráfico de Velocidades
    Set chart1 = hojaResumen.ChartObjects.Add(Left:=10, Width:=500, Top:=hojaResumen.Cells(i + 3, 1).Top, Height:=300)
    With chart1.Chart
        .ChartType = xlLine
        .HasTitle = True
        .ChartTitle.Text = "Velocidades"
        .HasLegend = True
        For Each j In colVelocidades
            With .SeriesCollection.NewSeries
                .Values = hojaResumen.Range(hojaResumen.Cells(2, j), hojaResumen.Cells(i - 1, j))
                .XValues = hojaResumen.Range("A2:A" & (i - 1))
                .Name = hojaResumen.Cells(1, j).Value
            End With
        Next j
    End With

    ' Crear gráfico de Aceleraciones
    Set chart2 = hojaResumen.ChartObjects.Add(Left:=520, Width:=500, Top:=hojaResumen.Cells(i + 3, 1).Top, Height:=300)
    With chart2.Chart
        .ChartType = xlLine
        .HasTitle = True
        .ChartTitle.Text = "Aceleraciones"
        .HasLegend = True
        For Each j In colAceleraciones
            With .SeriesCollection.NewSeries
                .Values = hojaResumen.Range(hojaResumen.Cells(2, j), hojaResumen.Cells(i - 1, j))
                .XValues = hojaResumen.Range("A2:A" & (i - 1))
                .Name = hojaResumen.Cells(1, j).Value
            End With
        Next j
    End With

    MsgBox "Resumen generado con gráficas en la hoja 'resumen'.", vbInformation
End Sub

Function hojaExiste(nombreHoja As String) As Boolean
    On Error Resume Next
    hojaExiste = Not ThisWorkbook.Worksheets(nombreHoja) Is Nothing
    On Error GoTo 0
End Function