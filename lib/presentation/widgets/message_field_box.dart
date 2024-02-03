import 'package:flutter/material.dart';

class MesaggeFieldBox extends StatelessWidget {
  
  final ValueChanged<String> onValueChange;

  const MesaggeFieldBox({
    super.key, 
    required this.onValueChange
  });

  @override
  Widget build(BuildContext context) {

    //final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();
    
    final UnderlineInputBorder outlinedBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );


    final InputDecoration inputDecoration = InputDecoration(
      hintText: 'End your message whit "??"',
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: (){
          final value = textController.value.text;
          //emmitir el evento desde el hijo al padre
          onValueChange(value);
          textController.clear();
          focusNode.requestFocus();
        }, 
      ),
      focusedBorder: outlinedBorder,
      enabledBorder: outlinedBorder
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //emmitir el evento desde el hijo al padre
        onValueChange(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) => focusNode.unfocus()
      /*
      onChanged: (value) {
        print('value $value');
      }, 
      */
    );
  }
}