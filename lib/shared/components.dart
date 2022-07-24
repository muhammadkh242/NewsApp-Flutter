import 'package:flutter/material.dart';

Widget buildNewsItem() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://heute-at-prod-images.imgix.net/2022/07/22/793e2af2-d59e-42a6-bbbd-0df3626b1894.jpeg'
              )
            )
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "CHINA LAUNCHES WENTIAN SPACE STATION MODULE WITH GIANT ROCKET - NEW YORK TIMES",
          style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            const Text(
              "Kenneth Chang, Jane",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18.0,
                fontStyle: FontStyle.italic
              ),
            ),
            const SizedBox(
              width: 50.0,
            ),
            Text(
                "2022-07-24",
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
        Expanded(
          child: Text(
              "description description description description description description description description description description description description description description description description",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0
            ),
          ),
        ),

      ],
    ),
  );
}
