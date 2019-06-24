import 'package:mustache/mustache.dart' show Template;
import 'dart:io' show File;

class View {
  Template template;
  Template footerPartial =
      Template(File('views/layouts/footer.mustache').readAsStringSync());
  Template menuPartial =
      Template(File('views/layouts/menu.mustache').readAsStringSync());

  View(List<String> filePaths) {
    newView(filePaths);
  }

  void newView(List<String> filePaths) {
    String content = "";
    // concatenate the content of each file into the content variable
    for (var filePath in filePaths) {
      content += (File(filePath).readAsStringSync());
    }
    template = Template(content, partialResolver: getPartial);
  }

  Template getPartial(String name) {
    if (name == 'menu') {
      return menuPartial;
    }
    if (name == 'footer') {
      return footerPartial;
    }
    return null;
  }
}
