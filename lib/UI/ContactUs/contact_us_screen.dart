import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/ContactUs/contact_us_view_model.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contact us")),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Consumer<ContactUsViewModel>(
                    builder: (context, viewModel, child) {
                  return Column(children: [
                    Card(
                        color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: TextField(
                            controller: viewModel.messageController,
                            maxLines: 8,
                            decoration: InputDecoration.collapsed(
                                hintText: "Enter your text here"),
                          ),
                        )),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.sendMessage();
                        },
                        child: Text("Send message",
                            style: TextStyle(color: Colors.teal)))
                  ]);
                }))
          ],
        ));
  }
}
