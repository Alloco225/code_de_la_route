# DATABASE SCHEMA

- users
  - [user_id]
    - email
    - username
    - profile_picture_url
    - ...
  
- quizzes
  - [quiz_id]
    - title
    - description
    - category
    - level
    - ...
    - questions
      - [question_id]
        - question_text
        - question_type
        - correct_answers
        - ...
        - answers
          - [answer_id]
            - answer_text
            - is_correct
            - ...

- leaderboard
  - [quiz_id]
    - [user_id]
      - score
      - timestamp
      - ...

- flashcards
  - [flashcard_id]
    - question
    - answer
    - category
    - ...
  
- flashcard_history
  - [user_id]
    - [session_id]
      - flashcard_id
      - timestamp
      - correctness
      - ...
