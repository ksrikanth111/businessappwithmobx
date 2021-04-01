// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionpage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionPageStore on _TransactionPageStore, Store {
  final _$customerNameAtom = Atom(name: '_TransactionPageStore.customerName');

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  final _$branchAtom = Atom(name: '_TransactionPageStore.branch');

  @override
  String get branch {
    _$branchAtom.reportRead();
    return super.branch;
  }

  @override
  set branch(String value) {
    _$branchAtom.reportWrite(value, super.branch, () {
      super.branch = value;
    });
  }

  final _$productNameAtom = Atom(name: '_TransactionPageStore.productName');

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  final _$qunatityAtom = Atom(name: '_TransactionPageStore.qunatity');

  @override
  int get qunatity {
    _$qunatityAtom.reportRead();
    return super.qunatity;
  }

  @override
  set qunatity(int value) {
    _$qunatityAtom.reportWrite(value, super.qunatity, () {
      super.qunatity = value;
    });
  }

  final _$priceAtom = Atom(name: '_TransactionPageStore.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$totalAmountAtom = Atom(name: '_TransactionPageStore.totalAmount');

  @override
  double get totalAmount {
    _$totalAmountAtom.reportRead();
    return super.totalAmount;
  }

  @override
  set totalAmount(double value) {
    _$totalAmountAtom.reportWrite(value, super.totalAmount, () {
      super.totalAmount = value;
    });
  }

  final _$_TransactionPageStoreActionController =
      ActionController(name: '_TransactionPageStore');

  @override
  void getTotalAmount() {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.getTotalAmount');
    try {
      return super.getTotalAmount();
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void transactionSave() {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.transactionSave');
    try {
      return super.transactionSave();
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomerName(String value) {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.setCustomerName');
    try {
      return super.setCustomerName(value);
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBranch(String value) {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.setBranch');
    try {
      return super.setBranch(value);
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProdcutName(String value) {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.setProdcutName');
    try {
      return super.setProdcutName(value);
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(int value) {
    final _$actionInfo = _$_TransactionPageStoreActionController.startAction(
        name: '_TransactionPageStore.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_TransactionPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customerName: ${customerName},
branch: ${branch},
productName: ${productName},
qunatity: ${qunatity},
price: ${price},
totalAmount: ${totalAmount}
    ''';
  }
}
