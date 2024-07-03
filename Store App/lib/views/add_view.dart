import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/add_product_cubit/add_product_cubit.dart';
import '../cubits/add_product_cubit/add_product_state.dart';
import '../widgets/my_drop_down_text_field.dart';
import '../widgets/my_text_form_field.dart';

class AddView extends StatelessWidget {
  static String id = 'add view';

  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? description;
    String? price;
    String? image;
    String? category;

    List<String> categories =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    GlobalKey<FormState> formKey = GlobalKey();

    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is AddProductLoadingState,
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
                MyDropDownTextField(
                  categories: categories,
                  text: 'Category',
                  onChanged: (value) {
                    category = value.name;
                  },
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (category == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select the category'),
                            ),
                          );
                        } else {
                          BlocProvider.of<AddProductCubit>(context).addProduct(
                              name: name,
                              price: price,
                              description: description,
                              image: image,
                              category: category);
                          if (state is AddProductSuccessState) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'The product has been added successfully'),
                              ),
                            );
                          } else if (state is AddProductFailureState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errMessage),
                              ),
                            );
                          }
                        }
                      }
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.grey),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
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
      ),
    );
  }




}
