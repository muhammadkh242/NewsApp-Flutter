import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news/module/articleWebView/article_url.dart';

Widget buildNewsItem(article, context) {
  print("article -------> ${article['title']}");
  return InkWell(
    onTap: ()
    {
      Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => ArticleWeb(url: article['url'])),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${article['urlToImage']}",
                )
              )
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${article['title']}",
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${article['author']}",
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                  article['publishedAt'].toString().substring(0,10),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "${article['description']}",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0
            ),
          ),

        ],
      ),
    ),
  );
}


Widget buildScreen(list){
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return buildNewsItem(list[index], context);
        },
        separatorBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: 2.0,
              color: Colors.grey[300],
            ),
          );
        },
        itemCount: list.length
    ),
    fallback: (context) => const Center(child: CircularProgressIndicator(),),
  );
}