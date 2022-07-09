CREATE DATABASE game1;
USE game1;

CREATE TABLE auth (
  name varchar(127) NOT NULL,
  email varchar(127) NOT NULL,
  password varchar(255) NOT NULL,
  age varchar(45) DEFAULT NULL,
  PRIMARY KEY (email));

CREATE TABLE pro (
  email varchar(127) NOT NULL,
  g1 int NOT NULL,
  g2 int NOT NULL,
  g3 int NOT NULL,
  g4 int NOT NULL,
  g5 int NOT NULL);
  
  CREATE TABLE ques (
  title varchar(255) NOT NULL,
  qu mediumtext NOT NULL,
  img varchar(255) DEFAULT NULL,
  imgId varchar(255) DEFAULT NULL,
  o1 text NOT NULL,
  o2 text NOT NULL,
  o3 text NOT NULL,
  o4 text NOT NULL,
  ra varchar(45) NOT NULL,
  code varchar(127) NOT NULL,
  age varchar(45) DEFAULT NULL);
  
INSERT INTO auth VALUES ('admin', 'admin@gmail.com', '$2b$10$TUGs0AZ7hwAXi3jrGG5dhea5ib9w8scsB3om4b7Dx.hUtCbmFsFSS', '3-7');
INSERT INTO pro VALUES ('admin@gmail.com', '0', '0', '0', '0', '0');
INSERT INTO ques VALUES ('Leonie & Jan', 'Can you tell what Leonie and Jan are feeling?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652091419/vi9tmzwla77rykufp8zk.png', 'vi9tmzwla77rykufp8zk', 'Happy', 'Angry', 'Fighting', 'Sad', '1', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Gregor', 'Can you tell what Gregor is feeling?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652091549/tjoprkz5k0qukk0ktq0l.png', 'tjoprkz5k0qukk0ktq0l', 'He likes to be on his own', 'Wants to join in play', 'He has to wait until boys ask him to join', 'He does not like football', '2', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Oli & Jack', 'Can you tell how Jack is feeling?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652091607/dzyveglrrc4xmwt2dkff.png', 'dzyveglrrc4xmwt2dkff', 'Cruel', 'Amazed', 'Happy', 'In pain', '4', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Reuben & Christina', 'What can you say about this situation?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652091724/b3nqt8alnvbyuntej8tw.png', 'b3nqt8alnvbyuntej8tw', 'Friendly', 'Kind', 'Aggressive', 'Surprised', '3', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Victor', 'Can you tell how Victor is feeling?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652091812/djz8qilaii6w9uop6vbh.png', 'djz8qilaii6w9uop6vbh', 'Calm', 'Scared', 'Aggressive', 'Angry', '2', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('At the blackboard', 'Can you tell what the kids are feeling?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652092002/btk1upzxyawmbimjm2tf.png', 'btk1upzxyawmbimjm2tf', 'Martha knows the answer', 'Tony knows the answer', 'Martha needs a lot of maths practice', 'Tony does not need any maths practice', '1', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('In the classroom', 'The teacher asked a question.', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652093020/raymfolbuiy4w3dbcksg.png', 'raymfolbuiy4w3dbcksg', 'All kids know the answer', 'Not all kids know the answer', 'All kids do not know the answer', 'Only one kid know the answer', '2', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Outside school', 'The three girls are...?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652093142/mj6eejubksubjgehskvw.png', 'mj6eejubksubjgehskvw', 'Kind', 'Nice', 'Mean', 'Caring', '3', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Gigi & Christine', 'The girls are...?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652093327/vnv0q939c4u39fs1jwtm.png', 'vnv0q939c4u39fs1jwtm', 'They are watching movie', 'They are friends', 'They do not know each other', 'They are sacred', '2', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Emmanuel & Georgia', 'What is happening here?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652093419/hkkcpwtywgnsibkgmdwk.png', 'hkkcpwtywgnsibkgmdwk', 'Their flight gate is not open yet', 'They are waiting at the flight gate', 'They arrived early at airport', 'They are late for flight', '4', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Francesca & Andy', 'What is the situation here?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652093544/m7linbem6s53oqt0r3c5.png', 'm7linbem6s53oqt0r3c5', 'Only one of them will travel', 'They are just met for first time', 'They are travelling together', 'Both are waiting for their train', '1', 'admin@gmail.com', '3-7');
INSERT INTO ques VALUES ('Butterfly', 'How many butterflies are there?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652253325/kev7y3rd77yza3kz6dbe.jpg', 'kev7y3rd77yza3kz6dbe', '6', '7', '4', '5', '3', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Next Number', 'What is the next number in the series?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652302916/qiiy6pm7buwpnwya3ami.jpg', 'qiiy6pm7buwpnwya3ami', '6', '2', '4', '8', '2', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Count Balloons', 'What is the total number of balloons?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652303124/hn86vsmkxlht4j6yn36i.jpg', 'hn86vsmkxlht4j6yn36i', '4', '5', '6', '7', '3', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Missing Number', 'What is the missing number in the series?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652303383/j2mnllbp65maum9eaope.jpg', 'j2mnllbp65maum9eaope', '81', '84', '85', '82', '4', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Missing Number', 'What is the missing number in the series?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652303433/hikxdxwjdrv6yzvpxsuh.jpg', 'hikxdxwjdrv6yzvpxsuh', '1', '5', '6', '10', '3', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Missing Number', 'What is the missing number in the series?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652303476/ogwzaukjit1crnytcxfc.jpg', 'ogwzaukjit1crnytcxfc', '8', '2', '9', '10', '3', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Count Balloons', 'How many Red balloons are there?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652343018/gl1l74pmtht7dci2wkhf.jpg', 'gl1l74pmtht7dci2wkhf', '1', '2', '3', '4', '3', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Count Balloons', 'How many balloons are there?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652343056/xhbxmyfudrlvtpbok6ve.jpg', 'xhbxmyfudrlvtpbok6ve', '7', '9', '11', '13', '1', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Count Balloons', 'How many Blue balloons are there?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652343115/lhxzw81ghekagahd1rzc.jpg', 'lhxzw81ghekagahd1rzc', '4', '3', '2', '1', '2', 'admin@gmail.com', '8-12');
INSERT INTO ques VALUES ('Count Balloons', 'How many Yellow balloons are there?', 'https://res.cloudinary.com/df70bjmnu/image/upload/v1652343155/ei3z57isveiolmqur50z.jpg', 'ei3z57isveiolmqur50z', '3', '4', '2', '1', '1', 'admin@gmail.com', '8-12');