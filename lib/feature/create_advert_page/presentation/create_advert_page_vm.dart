import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateAdvertPageViewModel {
  final costTExtFieldController = AppTextEditingController();
  final Rv<LocalityList> curentLocale = Rv(LocalityList.values[0]);
  final titleTextFieldController = AppTextEditingController();
}
