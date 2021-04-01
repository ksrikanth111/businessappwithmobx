
import 'dart:typed_data';

import 'package:businessappwithmobx/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfReportPage{
  final TransactionsData transactionsData;
  PdfReportPage({this.transactionsData});
 
  final pdfDoc=pw.Document();

  Future<Uint8List> buildPdfPage(){
    pdfDoc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,

        build: (pw.Context context){
          return [
            getPdfContent()
          ];
        }
      )
    );
    return pdfDoc.save();
  }
  pw.Widget getPdfContent(){
     final tableHeader=[
       'Customer Name',
       'Branch',
       'Product Name',
       'Quantity',
       'Prcie',
       'Total Amount'
     ];
     List<TransactionsData> transactionList=[];
     transactionList.add(transactionsData);
     return pw.Table.fromTextArray(
       headerStyle: pw.TextStyle(color: PdfColor.fromHex('#000000'),fontSize: 20,fontWeight: pw.FontWeight.bold),
       headers: List<String>.generate(tableHeader.length, (col) => tableHeader[col]),
       data: List<List<String>>.generate(
         1, 
         (row) => List<String>.generate(
           tableHeader.length, 
           (col) => transactionList[row].getIndex(col)
          )
        )
      );
  }

}