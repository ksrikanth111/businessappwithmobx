import 'package:businessappwithmobx/models/transaction_model.dart';
import 'package:businessappwithmobx/stores/transactionpage_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
TransactionPageStore trnStore=TransactionPageStore();
class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController customerNameController=TextEditingController();
  TextEditingController branchController=TextEditingController();
  TextEditingController productNameController=TextEditingController();
  TextEditingController qunatityController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController totalAmountController=TextEditingController();
  FocusNode _focus = new FocusNode();
  bool isSaving=false;
  
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
       _focus.addListener(_onFocusChange);
    }
    void _onFocusChange(){
      if(priceController.text!=null&&priceController.text.trim()!='')
   trnStore.setPrice(double.parse(priceController.text).toString());
  }
   
updatingStoreValues(){
  totalAmountController.text=trnStore.totalAmount!=null?trnStore.totalAmount.toString():'0.0';
  trnStore.setCustomerName(customerNameController.text);
  trnStore.setBranch(branchController.text);
  trnStore.setProdcutName(productNameController.text);
  if(qunatityController.text!=null && qunatityController.text.trim()!=''){
    trnStore.setQuantity(int.parse(qunatityController.text));
  }
  if (priceController.text!=null && priceController.text.trim()!='') {
    
  }
  trnStore.setPrice(priceController.text);
  trnStore.getTotalAmount();
  

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),

      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.7,
          width: MediaQuery.of(context).size.height*0.7,
          child: Card(
            color: Colors.blueGrey[200],
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Observer(
                    builder:(ctx) 
                    {
                      customerNameController.text=trnStore.customerName;
                      //customerNameController.selection = TextSelection.fromPosition(TextPosition(offset: customerNameController.text.length));
                     return  TextFormField(
                     controller:customerNameController ,
                     //initialValue: trnStore.customerName,
                      decoration: InputDecoration(
                        labelText: 'Customer Name'   
                      ),
                      
                      onFieldSubmitted:(val)=>updatingStoreValues()
                     );
                    }
                  ),
                  Observer(
                    builder:(ctx) 
                    {
                      branchController.text=trnStore.branch;
                      //branchController.selection = TextSelection.fromPosition(TextPosition(offset: branchController.text.length));
                     return  TextFormField(
                      controller: branchController,
                     //initialValue: trnStore.branch,
                      decoration: InputDecoration(
                        labelText: 'Branch'   
                      ),
                     onFieldSubmitted:(val)=>updatingStoreValues()
                     );
                    }
                  ),
                  Observer(
                    builder:(ctx) 
                    {
                      productNameController.text=trnStore.productName;
                     // productNameController.selection = TextSelection.fromPosition(TextPosition(offset: productNameController.text.length));
                     return  TextFormField(
                      controller: productNameController,
                     // initialValue: trnStore.productName,
                      decoration: InputDecoration(
                        labelText: 'Product Name'   
                      ),
                      onFieldSubmitted:(val)=>updatingStoreValues()
                     );
                    }
                  ),
                  Observer(
                    builder:(ctx) 
                    {
                      qunatityController.text=(trnStore.qunatity!=null||trnStore.qunatity==0)?trnStore.qunatity.toString():'';
                     // qunatityController.selection = TextSelection.fromPosition(TextPosition(offset: qunatityController.text.length));
                     return  TextFormField(
                      controller: qunatityController,
                     //initialValue: (trnStore.qunatity!=null||trnStore.qunatity==0)?trnStore.qunatity.toString():'',
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '0'
                      ),
                      onFieldSubmitted: (val){
                        if(val.trim()!=''){
                        trnStore.setQuantity(int.parse(val));
                        }
                      
                        updatingStoreValues();
                       
                      }
                     );
                    }
                  ),
                  Observer(
                    builder:(ctx) 
                    {
                      priceController.text=(trnStore.price!=null)?trnStore.price:'';
                      //priceController.selection = TextSelection.fromPosition(TextPosition(offset: priceController.text.length));
                     return  TextFormField(
                       focusNode: _focus,
                      controller: priceController,
                     //initialValue: (trnStore.price!=null||trnStore.price==0.0)?trnStore.price.toString():'',
                      decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: '0.0'   
                      ),
                      onEditingComplete: (){
                          FocusScope.of(context).requestFocus(FocusNode());
                          trnStore.setPrice(double.parse(priceController.text).toString());
                      },
                      onFieldSubmitted: (val){
                        if(val.trim()!=''&&val!=null){
                            trnStore.setPrice(val);
                        }
                        updatingStoreValues();
                        // trnStore.getTotalAmount();
                        // totalAmountController.text=trnStore.totalAmount.toString()??'0.0';
                      }
                     );
                    }
                  ),            
                    Observer(
                      builder:(ctx){  
                        totalAmountController.text=trnStore.totalAmount!=null?trnStore.totalAmount.toString():'0.0';
                        return TextFormField(
                        controller: totalAmountController,
                        //initialValue: trnStore.getTotalAmount.toString(),
                        readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Total Amount'   
                          ),
                        );
                       }
                    ),
                  
                  Center(
                    child: MaterialButton(
                      onPressed: (){
                       
                       showDialog(context: context, builder: (ctx)=>Center(child: CircularProgressIndicator()));
                       Future.delayed(
                         Duration(seconds: 2)
                        ).then((value){
                          Navigator.pop(context);
                          trnStore.transactionSave();
                          showDialog(
                            context: context,
                            builder: (ctx){
                              return CupertinoAlertDialog(
                                title: Text('Message'),
                                content: Text('Transaction saved Succesfully'),
                                actions: [
                                  TextButton(onPressed: ()=>Navigator.pop(context), child: Text('ok'))
                                ],
                              );
                            }
                          );
                         // trnStore.customerName;
                        });
                       
                       
                      },
                      child: Text('Save',style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}