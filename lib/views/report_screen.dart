import 'package:businessappwithmobx/models/transaction_model.dart';
import 'package:businessappwithmobx/printing/pdfview_page.dart';
import 'package:businessappwithmobx/repositories/transaction_saved_repo.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class ReportScreen extends StatelessWidget {
  TransactionSavedRepositories tData=TransactionSavedRepositories();
  @override
  Widget build(BuildContext context) {
    List<TransactionsData> listData=tData.savedTransactions.map((mapData) => TransactionsData.fromJson(mapData)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body:Container(
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (ctx,ind){
            return ListTile(
              leading: CircleAvatar(
                child: Text('${ind+1}'),
              ),
              title: Text(listData[ind].productName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listData[ind].customerName)
                ],
              ),
              onTap: ()async{
                await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format)async{
                    return await PdfReportPage(transactionsData: listData[ind]).buildPdfPage();
                  }
                );
              },
            );
          }
        ),
      ) ,
    );
  }
}