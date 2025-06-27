# What is PostgreSQL?
Answer : PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম 



# Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Answer : 
      Primary Key: একটি টেবিলের ইউনিক key যা একটি টেবিলের প্রতিটি রেকর্ডকে আলাদা করে চিহ্নিত করে |
      Foreign Key: দুইটি টেবিল এর মধ্যে সম্পর্ক তৈরি করার উদেশ্যে  একটি টেবিল এর primary key যখন অন্য টেবিল এ রেফারেন্স হিসাবে ব্যবহার করা হয় তখনদ্বিতীয়  টেবিল এর ওই রেফারেন্স key কেই Foreign Key বলে |




#  Explain the purpose of the WHERE clause in a SELECT statement.
 Answer : WHERE ক্লজ ব্যবহার করে ডেটা  শর্ত অনুযায়ী খুঁজে বের করা হয়। (select * from rangers where reng_id >2 ; ) 




# What are the LIMIT and OFFSET clauses used for?
   Linit  : কতটি রেকর্ড রিটার্ন হবে তা নির্ধারণ করে। (SELECT * FROM rangers LIMIT 2;)
   OFFSET : কতটি রেকর্ড স্কিপ করে পরবর্তী রেকর্ড দেখাবে তা নির্ধারণ করে। (SELECT * FROM rangers OFFSET 2 ;)

#  What is the significance of the JOIN operation, and how does it work in PostgreSQL?
 Answer : JOIN অপারেশন দিয়ে একাধিক টেবিলকে একত্রে যুক্ত করে রিলেটেড ডেটা একসাথে দেখা যায়। EX. 
          (
          SELECT fname as "name ", count(ranger_id)as total_sightings from rangers join sightings on rangers.reng_id = sightings.ranger_id
  GROUP BY rangers.fname ;
  )
   
   
