import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _CreateProfileState createState()=> _CreateProfileState(); 

  }
  class _CreateProfileState extends State<CreateProfile>{
    final TextEditingController _textController = TextEditingController();
    final TextEditingController _textController1 = TextEditingController();
    DateTime dateTime = DateTime(2000,2,3,12,20);
    String dropdownValue= "";
    bool? _isChecked = false;
    bool? _isChecked1 = false;
    bool? _isChecked2 = false;
    bool? _isChecked3 = false;
    double _currentValue=50;



    

     @override
     Widget build(BuildContext context) {
      return  Scaffold(

       
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://images.app.goo.gl/mMq82uiSPdFX6zfp8",),
              ),
              SizedBox(height: 10),
              Text(
                "John doe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text("random job")



            ],

          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right:5),
                child: Text(
                "complete your profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                
                
                
                ),
              ),
              Text("(1/4)",
              style: TextStyle(
                color:Color(0xFFD4B07B),
              ),
              
              
              ),
           ],
            
          ),
           const SizedBox(height: 10),
           Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  
                  margin: EdgeInsets.only(right: index==4? 0: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ?Color(0xFFD4B07B) : Colors.black12 ,
                
                
                  ),
                ),
              );

              
            },
            ),
            
           ),
           const SizedBox(height: 10),
           SizedBox(
            height: 180,
            child: Center(
              child: SizedBox(
                width: 400,
                child: Card(
                  color:Color(0xFFC4A373),
                  shadowColor: Colors.black12,
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.upload_file, size: 40),
                        SizedBox(height: 10),
                        Text(
                          "Upload Your picture",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(                  
                          onPressed: () {
                            // Upload action
                          }
                          
                          ,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: 
                          Text("Upload",
                          ),
                          

                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

           ),

           const SizedBox(height: 35),
           Card(
            elevation: 3,
            color:Color(0xFFC4A373),
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 8),
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      
                      hintText: "First name",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),
           Card(
            elevation: 3,
            color:Color(0xFFC4A373),
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 8),
                  TextField(
                    controller: _textController1,
                    decoration: InputDecoration(
                      
                      hintText: "Last name",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children:  [
              Padding(
                padding: EdgeInsets.only(right:5),
                child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                          ),
                  child: Text("choose your age",
                  style: TextStyle(
                     color:Color(0xFFD4B07B),
                  
                  ) ,
                  ),
                  
                   onPressed: (){
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (BuildContext context )=> SizedBox(
                        height: 300,
                        
                        
                        child: CupertinoDatePicker(
                          backgroundColor: const Color.fromARGB(60, 33, 149, 243),     
                          initialDateTime: dateTime,                     
                          onDateTimeChanged: (DateTime newTime){
                            setState ((){
                              dateTime = newTime;
                            });

                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.date,
                          ),
                       ),
                      );                   
                   },        
                  ),
              ),

               DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.person_2_rounded),
                style: const TextStyle(color: Color.fromARGB(255, 193, 181, 163),),
                underline: Container(
                  height: 1,
                  color: const Color.fromARGB(207, 255, 2, 2),
                ),
                onChanged: (String? newValue){
                  setState((){
                    dropdownValue = newValue!;



                  });
                },
                items: const[
                  DropdownMenuItem<String>(
                    value: '',
                    child: Text('Gender'),
                  ),
                   DropdownMenuItem<String>(
                    value: 'MAN',
                    child: Text('MAN'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'WOMAN',
                    child: Text('WOMAN'),
                  ),DropdownMenuItem<String>(
                    value: 'other',
                    child: Text('other'),
                  ),

                ],
              ),
              
              
                


           ],
           
            
          ),
          SizedBox(          
            child:
            
            
            CheckboxListTile(
              
                title: const Text("i want older"),
                value: _isChecked,
                onChanged: (bool? newValue){
                  setState(() {
                    _isChecked = newValue;                    
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.indigo,
                tileColor: Color.fromARGB(255, 193, 181, 163),
                
                controlAffinity: ListTileControlAffinity.leading,
                //tristate: true,              
                ) ,
          ),

          SizedBox(          
            child:
            CheckboxListTile(
                title: const Text("i want younger"),
                value: _isChecked1,
                onChanged: (bool? newValue){
                  setState(() {
                    _isChecked1 = newValue;                    
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.indigo,
                tileColor: Color.fromARGB(255, 193, 181, 163) ,
                
                controlAffinity: ListTileControlAffinity.leading,
                              
                ) ,
          ),

          SizedBox(          
            child:
            CheckboxListTile(
                title: const Text("i need help with"),
                value: _isChecked2,
                onChanged: (bool? newValue){
                  setState(() {
                    _isChecked2 = newValue;                    
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.indigo,
                tileColor: Color.fromARGB(255, 193, 181, 163) ,
                
                controlAffinity: ListTileControlAffinity.leading,
                              
                ) ,
          ),

          SizedBox(          
            child:
            CheckboxListTile(
                title: const Text("i want to help with"),
                value: _isChecked3,
                onChanged: (bool? newValue){
                  setState(() {
                    _isChecked3 = newValue;                    
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.indigo,
                tileColor: Color.fromARGB(255, 193, 181, 163) ,
                
                controlAffinity: ListTileControlAffinity.leading,
                              
                ) ,
          ),

          SizedBox(
            height:60 ,
            child:Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 10),
                child: Text("discover range"),
                ),
                
              Text(_currentValue.toString()+" "+ "kilometers",style: TextStyle(fontSize: 20)),





              ],
            ),
          ),
          SizedBox(
            
          child: Column(
            children: [
              
              Slider(value: _currentValue,
              min: 25,
              max: 125,
              divisions: 100,
              label: _currentValue.toString(),
              activeColor: Color(0xFF9C7B5B),
              thumbColor: Color(0xFFF1E7DA),
              onChanged: (value){

                setState(() {
                  _currentValue = value;
                });
              },             
              
              ),

              Text("your wants and needs"),

              const Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          
          // implement the text field
            child: TextField(
              
              minLines: 1,
              maxLines: 25,
              style: TextStyle(fontSize: 15,
              color: Color(0xFFC4A373),), 
              
              decoration: InputDecoration(border: OutlineInputBorder(),),
            )
        ),

              ),
            ],
            
            


          ),
            
            ),


           
        ],
      ),
      );
    
  }
}


 
 
