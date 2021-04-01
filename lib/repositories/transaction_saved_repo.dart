class TransactionSavedRepositories{
  List<Map<String,dynamic>> savedTransactions=[];
  TransactionSavedRepositories._createInstance();
  static final TransactionSavedRepositories trans=TransactionSavedRepositories._createInstance();
  factory TransactionSavedRepositories(){
    return trans;
  }
}