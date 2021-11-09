import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html show parse;
import 'package:mobileapp/Variables/global.dart';

class NewsData {
  String title = "N/A";
  String tag = "N/A";
  String category = "N/A";
  String link = "N/A";
  String date = "N/A";
  NewsData(dom.Element element) {
    date = element.getElementsByTagName("b")[0].text;

    category = element.getElementsByTagName("b")[1].text;
    final tags = element.innerHtml.split("<br>").first.split("</b>").last;
    tag = tags.substring(2, tags.length - 1);
    title = element.getElementsByTagName("a").first.text;
    link = Global.url.root
        .append(
            (element.getElementsByTagName("a").first.attributes["href"] ?? ""))
        .str;
    debugPrint("$date $category $tag $title $link");
  }
}

class News {
  static List<NewsData> data = [];
  static parse(String body) {
    try {
      final htmlbody = html.parse(body);
      final tbodybig = htmlbody.getElementsByTagName("tbody");
      final tbody = tbodybig[0].children;

      data.clear();
      for (int i = 1; i < tbody.length; i++) {
        data.add(NewsData(tbody[i]));
      }
      debugPrint("${data.length} datas parsing successfully");
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }

  static list(BuildContext context) {
    return data
        .map((i) => Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text(i.title),
              ),
            )))
        .toList();
  }
}
