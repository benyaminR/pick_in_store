
String generatePickUpBarcodeFor(String invoiceNumber, String price){
  var barcode = "";
  var leader = "8800";
  barcode = leader + invoiceNumber + price;
  return barcode;
}