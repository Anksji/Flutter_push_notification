import 'package:flutter/material.dart';
import 'package:login_and_notification/utills/color_const.dart';

class CustomEditTextField extends StatefulWidget {
  CustomEditTextField({Key? key, required this.lableText,  this.prefixIcon,  this.suffixIcon,
    required this.tfController, this.inputType, this.maxNoOfLines,this.isHideText ,this.suffixText, this.validator}) : super(key: key);

  final String lableText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController tfController;
  final TextInputType? inputType;
  final int? maxNoOfLines;
  final String? suffixText;
  final bool? isHideText;
  final String? Function(String?)? validator;

  @override
  State<CustomEditTextField> createState() => _CustomEditTextFieldState();
}

class _CustomEditTextFieldState extends State<CustomEditTextField> {
  late FocusNode _focusNode;

  bool _isFocused = false;

  bool isHide=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.isHideText!=null){
      isHide=widget.isHideText!;
    }else{
      isHide=false;
    }
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }


  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType ?? TextInputType.name,
      maxLines: widget.maxNoOfLines ?? 1,
      controller: widget.tfController,
      focusNode: _focusNode,
      validator: widget.validator,
      cursorColor: COLOR_CONST.primaryColor,
      obscureText: isHide,
      cursorHeight: 24.0,
      cursorWidth: 1.2,
      autovalidateMode: widget.validator!=null?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
      decoration: InputDecoration(
        suffixText: widget.suffixText ?? '',
        labelText: widget.lableText??'',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
              width: 1, color: COLOR_CONST.primarydarkColor
          ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
              width: 1, color: COLOR_CONST.gray300
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
              width: 1, color: Colors.redAccent
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
              width: 1, color: COLOR_CONST.primaryColor
          ),
        ),

        labelStyle: TextStyle(
          color:_isFocused?COLOR_CONST.primaryColor : Colors.grey,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _isFocused ? COLOR_CONST.primaryColor : Colors.grey,
        ),

        suffixIcon: widget.isHideText!=null?IconButton(
          icon: !isHide
              ? const Icon(Icons.visibility_outlined,color:  Colors.grey,)
              : const Icon(Icons.visibility_off_outlined,color:  Colors.grey,),
          onPressed: () {
            setState(() {
              isHide = !isHide;
            });
          },
        ):Icon(
          widget.suffixIcon!=null?(widget.suffixIcon as Icon).icon:null,
          color: _isFocused ? COLOR_CONST.primaryColor : Colors.grey,
        ),
      ),
    );


  }
}
