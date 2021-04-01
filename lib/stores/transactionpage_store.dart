



import 'package:businessappwithmobx/models/transaction_model.dart';
import 'package:businessappwithmobx/repositories/transaction_saved_repo.dart';
import 'package:businessappwithmobx/views/transaction_screen.dart';
import 'package:mobx/mobx.dart';
part 'transactionpage_store.g.dart';

 class TransactionPageStore = _TransactionPageStore with _$TransactionPageStore;
  abstract class _TransactionPageStore with Store{
    @observable
    String customerName;
    @observable
    String branch;
    @observable
    String productName;
    @observable
    int qunatity;
    @observable
    String price;
    @observable
    double totalAmount;
    
    @action 
    void getTotalAmount(){
      if(qunatity!=null && price!=null){
        totalAmount=double.parse(price)*qunatity;
      }
      else{
        totalAmount=0.0;
      }
     
    }
    @action
    void transactionSave(){
      TransactionsData tData=TransactionsData();
      tData.customerName=this.customerName;
      tData.branch=this.branch;
      tData.productName=this.productName;
      tData.price=double.parse(this.price);
      tData.qunatity=this.qunatity;
      tData.totalAmount=this.totalAmount;
      TransactionSavedRepositories trnSave=TransactionSavedRepositories();
      trnSave.savedTransactions.add(tData.toMap());
     
      print(trnSave.savedTransactions);
       this.customerName='';
       this.branch='';
       this.qunatity=null;
       this.price='';
       this.productName='';
       this.totalAmount=null;
      print(trnSave.savedTransactions[0]);
    }
    
    @action
      void setCustomerName(String value)=>customerName=value;
    @action
      void setBranch(String value)=>branch=value;
    @action 
      void setProdcutName(String value)=>productName=value;
    @action
      void setPrice(String value)=>price=value;
    @action
      void setQuantity(int value)=>qunatity=value;
    
  }