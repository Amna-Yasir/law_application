import 'package:flutter/material.dart';

class dialogueboxes {
  Future<void> personalInformation(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Personal Information'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  // controller: locationcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Add address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // controller: phonecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Add Phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            // actions: [
            //   TextButton(
            //     onPressed: () {
            //       ref
            //           .child(SessionController().userid.toString())
            //           .child('personalinfo')
            //           .set({
            //         'Address': locationcontroller.text,
            //         'Phone number': phonecontroller.text,
            //       }).then((value) {
            //         utils.toastmessage('Task added');
            //         setState(() {
            //           loading = false;
            //         });
            //       }).onError((error, stackTrace) {
            //         error.toString();
            //       }).then((value) {
            //         Navigator.pop(context);
            //         phonecontroller.clear();
            //         locationcontroller.clear();
            //       });
            //     },
            //     child: Text('Add'),
            //   ),
            //   TextButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       child: Text('Cancel'))
            // ],
          );
        });
  }
}
