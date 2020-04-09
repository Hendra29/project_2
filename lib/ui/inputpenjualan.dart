import 'package:flutter/material.dart';
import 'package:penjualan_motor/models/penjualan.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class InputPenjualan extends StatefulWidget {
 final Penjualan penjualan;
 InputPenjualan(this.penjualan);
 @override
 _InputPenjualanState createState() => _InputPenjualanState(this.penjualan);
}
class _InputPenjualanState extends State<InputPenjualan> {
 Penjualan penjualan;
 _InputPenjualanState(this.penjualan);

 TextEditingController nameController=TextEditingController();
 TextEditingController keteranganController =TextEditingController();
 TextEditingController jumlahController = TextEditingController();
 TextEditingController tanggalController = TextEditingController();
 final format=DateFormat('yyyy-MM-dd');
List<String> options = <String>[
  'BMW K100', 
  'Monoshock CB 750 ', 
  'Yamaha RD 350', 
  'BMW R80 Cafe Racer ',
  'Yamaha RD400 '];
 String dropdownValue = 'BMW K100';
 @override
 Widget build(BuildContext context) {
 if(penjualan != null){
 nameController.text=penjualan.name;
 keteranganController.text=penjualan.keterangan;
 jumlahController.text=penjualan.jumlah;
 tanggalController.text=penjualan.tanggal;
 }
 return Scaffold(
 appBar: AppBar(
 title: penjualan==null?Text("Transaksi Baru"):Text("Update Transaksi"),
 leading: Icon(Icons.keyboard_arrow_left),
 ),
 body: Padding(

 padding: EdgeInsets.only(
 top: 15.0,left: 10.0, right: 10.0
 ),
 child: ListView(
 children: <Widget>[

new Text("Pilih Jenis Motor"),
Padding(
 padding: EdgeInsets.all(10.0),
 child: DropdownButton<String>(
hint: new Text("Pilih Jenis Motor"),
 value: dropdownValue,
 icon: Icon(Icons.arrow_drop_down),
 style: TextStyle(
 color: Colors.lightBlueAccent
 

 ),
 onChanged: (String newValue) {
 setState(() {
 dropdownValue = newValue;
 });
 },
 items: options.map<DropdownMenuItem<String>>((String value) {
 return DropdownMenuItem<String>(
 value: value,
child: Text(value),
 );
 }).toList(),
 ),
 ),
 Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
      controller: nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Nama Pembeli',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.0)
    ),
 ),
 onChanged: (value){
 },
 ),
 ),
 Padding(
 padding: EdgeInsets.all(10.0),
 child: TextField(
 controller: jumlahController,
 keyboardType: TextInputType.number,
 decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: 'Harga Motor',
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(3.0)
 ),
 ),
 onChanged: (value){
 },
 ),
 ),
 
 
 Padding(
 padding: const EdgeInsets.all(10.0),
 child: Column(
 children: <Widget>[
 DateTimeField( 
 controller: tanggalController,
format: format,
onShowPicker: (context, currentValue){
 return showDatePicker(
 //setting datepicker
context: context,
firstDate: DateTime(2020),
 initialDate: currentValue??DateTime.now(),
 lastDate: DateTime(2045)
 );
 },
decoration: InputDecoration(
        icon: Icon(Icons.date_range),
        labelText: 'Tanggal Pembelian',
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(3.0)
 ),
 )
 )
 ],
 ),
 ),
 Padding(
 padding: EdgeInsets.all(10.0),
 child: Row(
 children: <Widget>[
 Expanded(
child: RaisedButton(
 color: Theme.of(context).primaryColorDark,
 textColor: Theme.of(context).primaryColorLight,
 child: Text("Simpan", textScaleFactor: 1.5,),
 onPressed: (){
 if(penjualan == null){
 penjualan=Penjualan(nameController.text, keteranganController.
text, jumlahController.text, tanggalController.text);
 }else{
 penjualan.name=nameController.text;
penjualan.keterangan=keteranganController.text;
penjualan.jumlah=jumlahController.text;
penjualan.tanggal=tanggalController.text;
print("Update Data");
 }
Navigator.pop(context, penjualan);
 },
 ),
 ),
 Container(width: 5.0,),
 Expanded(
child: RaisedButton(
 color: Theme.of(context).primaryColorDark,
 textColor: Theme.of(context).primaryColorLight,
child: Text("Batal", textScaleFactor: 1.5,),
 onPressed: (){
 Navigator.pop(context);
 },
 ),
 )
 ],
 ),
 )
 ],
 ),
 ),
 );
 }
}