Sub ExportarTodoElLibroComoCSV()
    Dim ws As Worksheet
    Dim ruta As String
    Dim nombreArchivo As String
    Dim archivo As Integer
    Dim encabezados As String
    Dim datos As String
    Dim fila As Long
    Dim colOffset As Variant
    Dim sufijos As Variant
    Dim grupos As Variant
    Dim s As Long
    Dim grupoIndex As Long
    Dim nombreLibro As String
    Dim valorCelda As Variant
    Dim valorFormateado As String
    Dim numero As Double

    ' Obtener nombre del libro sin extensión
    nombreLibro = Left(ThisWorkbook.Name, InStrRev(ThisWorkbook.Name, ".") - 1)
    ruta = ThisWorkbook.Path & "\"
    nombreArchivo = ruta & nombreLibro & "_csv.csv"
    archivo = FreeFile

    Open nombreArchivo For Output As #archivo

    ' Definiciones
    grupos = Array("AH", "AV", "AA", "BH", "BV", "BA", "CH", "CV", "CA", "DH", "DV", "DA", "EH", "EV", "EA", "FH", "FV", "FA")
    sufijos = Array("D", "V", "A")
    colOffset = Array(3, 5, 7) ' Columnas C, E, G

    ' Encabezado
    encabezados = "FECHA"
    For grupoIndex = 0 To UBound(grupos)
        For s = 0 To 2
            encabezados = encabezados & "," & grupos(grupoIndex) & sufijos(s)
        Next s
    Next grupoIndex
    Print #archivo, encabezados

    ' Recorrer todas las hojas
    For Each ws In ThisWorkbook.Worksheets
        If ws.Name <> "resumen" Then
            datos = """" & ws.Name & """"
            For fila = 19 To 36
                For s = 0 To 2
                    On Error Resume Next
                    numero = CDbl(ws.Cells(fila, colOffset(s)).Value)
                    If Err.Number <> 0 Then
                        numero = 0
                        Err.Clear
                    End If
                    On Error GoTo 0
                    valorFormateado = Format(numero, "0.00")
                    datos = datos & ",""" & valorFormateado & """"
                Next s
            Next fila
            Print #archivo, datos
        End If
    Next ws

    Close #archivo

    MsgBox "Exportación completada: " & nombreArchivo, vbInformation
End Sub