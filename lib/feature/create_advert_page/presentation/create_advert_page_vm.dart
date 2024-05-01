import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/create_advert_page/presentation/create_pages_image_card_widget.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateAdvertPageViewModel {
  final costTExtFieldController = AppTextEditingController();
  final Rv<LocalityList> curentLocale = Rv(LocalityList.values[0]);
  final titleTextFieldController = AppTextEditingController();
  final List<CreatePagesImageItem> imagesList =
      List<CreatePagesImageItem>.generate(
          5,
          (index) => CreatePagesImageItem(
              src: 'assets/image/macbook.webp', id: index.toString()));
}
