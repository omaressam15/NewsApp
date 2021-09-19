import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/NewApp/WebviewScreen/web_screen.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType textInputType,
  @required Function validator,
  @required String label,
  @required IconData iconData,
  bool isPassword = false,
  Function onTap,
  IconData suffix,
  Function isPressed,
  Function onChange,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: (String value) {
      },
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(iconData),

        suffixIcon: suffix != null
            ? InkWell(onTap: isPressed, child: Icon(suffix)) : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );

/*
 Widget buildTaskItem(Map model,context,)=> Dismissible(
   
   key: Key(model['id'].toString()),

   onDismissed: (direction){

     AppCubit.get(context).deleteDatabase(id: model['id'],);

   },

   child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(

        children: [

          CircleAvatar(
            radius: 35,
            child: Text(model['time']),

          ),

          SizedBox(
            width: 15,
          ),

          Expanded(
            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text('${model['title']}',style: TextStyle(fontSize: 20,color: Colors.black,
                    fontWeight: FontWeight.bold),),
                Text('${model['date']}',style: TextStyle(color: Colors.grey),),

              ],

            ),
          ),
          IconButton(

            key: Key(model['id'].toString()),


            onPressed: (){
            
            if(AppCubit.get(context).select){
              AppCubit.get(context).changeIcon(iconData: Icons.check_box_outline_blank,selected: false);
              AppCubit.get(context).updateDatabase(states:'new', id: model['id']);


            }else {
              AppCubit.get(context).updateDatabase(states:'done', id: model['id']);
              AppCubit.get(context).changeIcon(iconData: Icons.check_box,selected: true);
            }
            
          }, icon: Icon(AppCubit.get(context).icon),

           

          ),

          */

/*Checkbox(

              value:AppCubit.get(context).checkBox ,
              onChanged: (value){

               AppCubit.get(context).checkBox =value;
                AppCubit.get(context).updateDatabase(states:'done', id: model['id']);
          }),*/

/*


          SizedBox(
            width: 20,
          ),
          IconButton(onPressed: (){

            AppCubit.get(context).updateDatabase(states:'achieved', id: model['id']);

          },

              icon: Icon(Icons.archive),

            color: Colors.grey,

          ),

        ],

      ),
    ),
 );
*/

/*
 Widget conditionalItem({@required List<Map>tasks })=> ConditionalBuilder(
   builder:(context)=> ListView.separated(
       itemBuilder: (context, index) =>
           buildTaskItem(tasks[index], context),
       separatorBuilder: (context, index) => myDivider(),

       itemCount: tasks.length,),
   condition:tasks.length >0 ,
   fallback:(context)=>Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(Icons.event_note_outlined,color: Colors.grey,size: 90,),
         SizedBox(
           height: 15,
         ),
         Text('Task is Empty!',style: TextStyle(color: Colors.grey,fontSize: 23,fontWeight: FontWeight.bold),)
       ],
     ),
   ),



 );
*/

 Widget buildArticleItem (article,context) =>InkWell(
   onTap: (){
     navigate(WepViewScreen(article['url']), context);

   },
   child: Padding(
     padding: const EdgeInsets.all(20),
     child: Row(

       children: [

         Container(

           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             image: DecorationImage(
                 image: NetworkImage('${article['urlToImage']}'),

                 fit: BoxFit.cover

             ),
           ),

           width: 120,
           height: 120,

         ),

         const SizedBox(width: 10,),

         Expanded(
           child: SizedBox(
             height: 120,
             child: Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,

               children: [

                 Expanded(
                   child: Text('${article['title']}',

                     style: Theme.of(context).textTheme.bodyText1,
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,

                   ),
                 ),

                 Text('${article['publishedAt']}',style: Theme.of(context).textTheme.bodyText2,),

               ],

             ),
           ),
         ),


       ],

     ),
   ),
 );

 Widget myDivider()=>Padding(
   padding: EdgeInsets.all(10),
   child: Container(
     width: double.infinity,
     color: Colors.grey,
     height: 0.5,
   ),
 );

 Widget articalBulider(list)=> ConditionalBuilder(
   builder: (BuildContext context) =>ListView.separated(
       physics: BouncingScrollPhysics(),

       itemBuilder: (context,index)=>buildArticleItem(list[index],context),
       separatorBuilder:(context,index)=> myDivider(),
       itemCount: list.length),

   condition:list.length>0,

   fallback:(context)=> Center(child: CircularProgressIndicator(),),

 );

 void navigate(Widget page,context)=> Navigator.push(
   context,
   MaterialPageRoute(
     builder: (context) =>page,
   ),
 );
