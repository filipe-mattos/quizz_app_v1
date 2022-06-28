class Question{
  late final int id, answer;
  late final String question;
  late final List<String> options;

  Question({
    required this.id,
    required this.answer,
    required this.options,
    required this.question
  });
}

const List questionsList = [
  {
    "id": 1,
    "question": "Quanto é 2 + 2 ?",
    "options": ["3", "10", "15", "4"],
    "answer": 3
  },
  {
    "id": 2,
    "question": "Quanto é 2 + 3 ?",
    "options": ["3", "10", "15", "4"],
    "answer": 3
  },
  {
    "id": 3,
    "question": "Quanto é 2 + 4 ?",
    "options": ["3", "10", "15", "4"],
    "answer": 3
  },
  {
    "id": 4,
    "question": "Quanto é 2 + 5 ?",
    "options": ["3", "10", "15", "4"],
    "answer": 3
  },
  {
    "id": 5,
    "question": "Quanto é 2 + 6 ?",
    "options": ["3", "10", "15", "4"],
    "answer": 3
  },
];