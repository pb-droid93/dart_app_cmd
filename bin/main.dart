import 'dart:io';

import 'package:test/cart.dart';
import 'package:test/product.dart';



const allProduct = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'mango', price: 0.60),
  Product(id: 3, name: 'coconut', price: 0.30),
  Product(id: 4, name: 'mushroom', price: 1.30),
  Product(id: 5, name: 'rice', price: 1.00),
  Product(id: 6, name: 'potatos', price: 0.20),
  Product(id: 9, name: 'bread', price: 0.10),
  Product(id: 10, name: 'milk', price: 0.70),

];

void main(){
  final cart = Cart();
  while(true){
   stdout.write('What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
   final line = stdin.readLineSync();

   if(line == 'a'){
    final product = chooseProduct();
    if(product != null){
      cart.addProduct(product);
      print(cart);
      //print(product.displayName);
    }
   }else if(line == 'v'){
    print(cart);

   }else if(line == 'c'){
    if(checkout(cart)){
      break;
    }
   }
  }
}


Product? chooseProduct(){
  final productList =
  allProduct.map((product) => product.displayName).join('\n');
  stdout.write('Available products: \n$productList\nYour choice: ');
  final line = stdin.readLineSync();

  for(var product in allProduct){
    if(product.initial == line){
      return product;
    }
  }

  print('not found');
  return null;
}

bool checkout(Cart cart){

  if(cart.isEmpty){
    print('cart is empty');
    return false;
  }

  final total = cart.total();
  print('Total: \$$total');
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();

  if(line == null || line.isEmpty){
    return false;
  }

  final paid = double.tryParse(line);
  if(paid == null){
    return false;
  }
  if (paid >= total){
    final change = paid - total;
    print('change : \$${change.toStringAsFixed(2)}');
    print("finished");
    return true;

  } else{
    print('Not enough cash.');
    return false;
  }

}
