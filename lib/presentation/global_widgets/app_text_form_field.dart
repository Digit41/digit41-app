import 'package:flutter/material.dart';

import '../../utils/strings.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final TextInputType? textInputType;
  final String hint;
  final int maxLine;
  final int? length;
  final bool showLengthFail;
  final FocusNode? nextFocusNode;
  final TextDirection? textDirection;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool hidePrefixAfterTyping;
  final bool obscure;
  final bool enable;
  final FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  AppTextFormField({
    Key? key,
    required this.hint,
    this.maxLine = 1,
    this.textInputType,
    this.length,
    this.showLengthFail = true,
    this.nextFocusNode,
    this.textDirection,
    this.suffixIcon,
    this.prefixIcon,
    this.hidePrefixAfterTyping = false,
    this.obscure = false,
    this.enable = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _filled = true;
  bool _hidePrefix = false;
  final Color _backColor = const Color(0xff292929);

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus && _filled) {
        setState(() {
          _filled = false;
        });
      } else if (widget.controller.text.isEmpty) {
        setState(() {
          _filled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      textDirection: widget.textDirection,
      maxLines: widget.maxLine,
      enabled: widget.enable,
      obscureText: widget.obscure,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: _selfSubmit,
      validator: widget.validator ?? _selfValidator,
      onChanged: widget.onChanged ?? _selfOnChange,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(fontSize: 13.0),
        counterText: '',
        suffixIcon: widget.suffixIcon,
        prefixIcon: _hidePrefix
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: widget.prefixIcon,
              ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 20.0,
          minWidth: 20.0,
        ),
        fillColor: _backColor,
        filled: _filled,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: _backColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  String? _selfValidator(String? value) {
    if (value!.isEmpty) {
      return '${Strings.please} ${Strings.enter} ${widget.hint}';
    } else if (widget.length != null &&
        value.length < widget.length! &&
        widget.showLengthFail) {
      return '${widget.length} ${Strings.number}';
    } else {
      return null;
    }
  }

  void _selfSubmit(String value) {
    widget.focusNode.unfocus();
    if (widget.nextFocusNode != null) widget.nextFocusNode!.requestFocus();
  }

  ValueChanged<String>? _selfOnChange(String val) {
    if (widget.hidePrefixAfterTyping && val.isNotEmpty) {
      setState(() {
        _hidePrefix = true;
      });
    } else if (widget.hidePrefixAfterTyping && val.isEmpty) {
      setState(() {
        _hidePrefix = false;
      });
    }
    return null;
  }
}
