import 'package:mustache/mustache.dart' show Template;
import 'package:shelf/shelf.dart' show Response;
import 'dart:io' show File;

class View {
  var _template;

  final _layoutDir = 'views/layouts/';
  final _templateExt = '.mustache';
  final _templateDir = 'views/';

  View(List<String> filePaths) {
    _newView(filePaths);
  }

  void _newView(List<String> filePaths) {
    _addTemplatePath(filePaths);
    _addTemplateExt(filePaths);

    String content = "";
    // concatenate the content of each file into the content variable
    for (var filePath in filePaths) {
      content += (File(filePath).readAsStringSync());
    }
    _template = Template(content, partialResolver: _getPartial);
  }

  Template _getPartial(String name) {
    switch (name) {
      case 'header':
        return _getTemplate(name);
      case 'navbar':
        return _getTemplate(name);
      case 'footer':
        return _getTemplate(name);
      default:
        return null;
    }
  }

  Template _getTemplate(String name) {
    return Template(File(_layoutDir + name + _templateExt).readAsStringSync());
  }

  Future<Response> render() async {
    return Response.ok(_template.renderString(null),
        headers: {'content-type': 'text/html'});
  }

  void _addTemplatePath(List<String> filePaths) {
    for (var i = 0; i < filePaths.length; i++) {
      filePaths[i] = _templateDir + filePaths[i];
    }
  }

  void _addTemplateExt(List<String> filePaths) {
    for (var i = 0; i < filePaths.length; i++) {
      filePaths[i] = filePaths[i] + _templateExt;
    }
  }
}
