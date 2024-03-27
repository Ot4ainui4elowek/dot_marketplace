import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:reactive_variables/reactive_variables.dart';

class PassTextEditingController extends AppTextEditingController {
  PassTextEditingController({super.text, bool isTextHidden = true})
      : isTextHidden = isTextHidden.rv;

  final Rv<bool> isTextHidden;

  void showPassword() => isTextHidden(false);
  void hidePassword() => isTextHidden(true);
}
