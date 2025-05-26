### What is PostgreSQL?

- PostgresSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি SQL ব্যাবহার করে ডাটাবেস ম্যানেজ করে। এটি উচ্চ পারফরম্যান্স, নির্ভরযোগ্যতা, এবং ডেটা নিরাপত্তা প্রদান করে। এটি টেবিলের মাধ্যমে ডেটা সংরক্ষণ করে এবং সম্পর্ক তৈরি করতে দেয় (যেমন: Primary Key, Foreign Key)।
  উদাহরণ:

```
CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT
);

```
