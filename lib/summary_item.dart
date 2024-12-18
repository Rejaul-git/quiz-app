import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    mystyle() {
      return const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: itemData['user_answer'] == itemData['correct_answer']
                  ? Colors.green
                  : Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              //as we define itemDta as a object that is why we use 'as int, as string' to be clear indibisual type..
              (((itemData['question_index']) as int) + 1).toString(),
              style: mystyle(),
            )),
        const SizedBox(
          width: 10,
        ),
        // Column muloto infinity width space niye nay jodi amader data besi hoy jodi display width ar besi text
        //chole jay tobe baki tuku jeno niche chole jay tai amra (Expanded )bebohar kori jano display width ar besi
        // hole baki tuku niche chole jay..tobe column Row ar width ar besi jabe na karon row ar child Column ar
        // Expanded tai kore thake..
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData['question'] as String, style: mystyle()),
                Text(
                  itemData['user_answer'] as String,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:
                          itemData['user_answer'] == itemData['correct_answer']
                              ? const Color.fromARGB(255, 9, 241, 117)
                              : const Color.fromARGB(255, 231, 107, 107)),
                ),
                Text(itemData['correct_answer'] as String, style: mystyle()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
