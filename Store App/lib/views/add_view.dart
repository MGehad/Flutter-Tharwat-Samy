import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../services/add_product_service.dart';
import '../widgets/my_text_form_field.dart';

class AddView extends StatefulWidget {
  static String id = 'add view';

  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  String? name;
  String? description;
  String? price;
  String? image;
  String? category;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<String> categories =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    GlobalKey<FormState> formKey = GlobalKey();

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Add New Product",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
            children: [
              const SizedBox(height: 80),
              MyTextFormField(
                text: 'Product Name',
                onChanged: (value) {
                  name = value;
                },
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 25),
              MyTextFormField(
                text: 'Description',
                onChanged: (value) {
                  description = value;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              MyTextFormField(
                text: 'Price',
                onChanged: (value) {
                  price = value;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 25),
              MyTextFormField(
                text: 'Image Path',
                onChanged: (value) {
                  image = value;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              my_drop_down_text_field(categories, 'Category'),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && category != null) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await addProd(
                            name: name,
                            price: price,
                            description: description,
                            image: image,
                            category: category);
                      } catch (e) {
                        throw Exception(e.toString());
                      }
                      setState(
                        () {
                          isLoading = false;
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'The product has been added successfully'),
                            ),
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    ),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropDownTextField my_drop_down_text_field(
      List<String> categories, String text) {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        label: Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: SingleValueDropDownController(),
      clearOption: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        category = value.name;
      },
      dropDownItemCount: categories.length,
      dropDownList: buildDropDownValueModelList(categories),
    );
  }

  List<DropDownValueModel> buildDropDownValueModelList(
      List<String> categories) {
    List<DropDownValueModel> list = [];
    for (var category in categories) {
      list.add(
        DropDownValueModel(name: category, value: category),
      );
    }
    return list;
  }

  Future addProd(
      {required String? name,
      required String? price,
      required String? description,
      required String? image,
      required String? category}) async {
    await AddProductService().addProduct(
      title: name!,
      price: price!,
      description: description!,
      image: image!,
      category: category!,
    );
  }
}
