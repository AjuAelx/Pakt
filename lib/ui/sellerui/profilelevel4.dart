import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:pakt/ui/sellerui/profilelevel3.dart';

class ProfileLevel4 extends StatefulWidget {
  const ProfileLevel4({Key? key}) : super(key: key);

  @override
  _ProfileLevel4State createState() => _ProfileLevel4State();
}

class _ProfileLevel4State extends State<ProfileLevel4> {
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.custom;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: ['pdf', 'jpg'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Complete Your Profile',
            style: TextStyle(fontSize: 16, fontFamily: 'RobotoM'),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account Information Progress",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MyCustomContainer(
                  progress: 1,
                  size: MediaQuery.of(context).size.width - 30,
                  backgroundColor: Colors.grey,
                  progressColor: Color(0xffFFCC00),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("4/4 Steps"),
              SizedBox(
                height: 30,
              ),
              Stack(children: [
                Center(
                  child: Card(
                    elevation: 7,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: MediaQuery.of(context).size.height / 1.7,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4.7,
                      ),
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 50,
                        color: Color(0xffFFCF30),
                      ),
                      Text(
                        "Upload Company Documents",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoB',
                            fontSize: 16),
                      ),
                      Text("Jpg or PDF",
                          style: TextStyle(
                              color: Color(0xff4E4D4D),
                              fontFamily: 'RobotoM',
                              fontSize: 12)),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                          color: Colors.black,
                          height: 39,
                          minWidth: 193,
                          child: Text("Click here to Upload",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RobotoM',
                                  fontSize: 11)),
                          onPressed: () {
                            _openFileExplorer();
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                )
                              : _directoryPath != null
                                  ? ListTile(
                                      title: const Text('Directory path'),
                                      subtitle: Text(_directoryPath!),
                                    )
                                  : _paths != null
                                      ? Container(
                                          height: 100,
                                          child: Scrollbar(
                                              child: ListView.separated(
                                                    itemCount: _paths != null &&
                                                            _paths!.isNotEmpty
                                                        ? _paths!.length
                                                        : 1,
                                                    itemBuilder: (BuildContext context,
                                                        int index) {
                                                      final bool isMultiPath =
                                                          _paths != null &&
                                                              _paths!.isNotEmpty;
                                                      final String name =
                                                          'File $index: ' +
                                                              (isMultiPath
                                                                  ? _paths!
                                                                      .map(
                                                                          (e) => e.name)
                                                                      .toList()[index]
                                                                  : _fileName ?? '...');
                                                      final path = _paths!
                                                          .map((e) => e.path)
                                                          .toList()[index]
                                                          .toString();

                                                      return ListTile(
                                                        title: Text(
                                                          name,
                                                        ),
                                                        subtitle: Text(path),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                                int index) =>
                                                            const Divider(),
                                          )),
                                        )
                                      : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  color: Color(0xffFFCC00),
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width - 30,
                  child: Text("Next",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoM',
                          fontSize: 11)),
                  onPressed: () {})
            ],
          ),
        ));
  }
}
