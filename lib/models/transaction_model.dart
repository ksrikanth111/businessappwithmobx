class TransactionsData{
  String customerName;
  String branch;
  String productName;
  int qunatity;
  double price;
  double totalAmount;
 TransactionsData();
  TransactionsData.fromJson(Map<String,dynamic> mapData){
    this.customerName=mapData['customerName'];
    this.branch=mapData['branch'];
    this.productName=mapData['productName'];
    this.qunatity=mapData['quantity'];
    this.price=mapData['price'];
    this.totalAmount=mapData['totalAmount'];
  }

 Map<String,dynamic> toMap(){
    Map<String,dynamic> mapData={};
    mapData['customerName']=this.customerName;
    mapData['branch']=this.branch;
    mapData['productName']=this.productName;
    mapData['quantity']=this.qunatity;
    mapData['price']=this.price;
    mapData['totalAmount']=this.totalAmount;

    return mapData;

  }

  String getIndex(int index){
    switch (index) {
      case 0:
       return customerName;  
      break;
      case 1:
       return branch;  
      break;
      case 2:
       return productName;  
      break;
      case 3:
       return qunatity.toString();  
      break;
      case 4:
       return price.toString();  
      break;
      case 5:
       return totalAmount.toString();  
      break;
      
    }
  }


}