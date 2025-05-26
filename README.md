<h1 style="text-align: center;"> Wildlife Conservation Monitoring Assignment </h1>
<h3 style="text-align: center;"> Bonus Section </h3>

### 1. What is PostgreSQL?

PostgresSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি SQL ব্যাবহার করে ডাটাবেস ম্যানেজ করে। এটি উচ্চ পারফরম্যান্স, নির্ভরযোগ্যতা, এবং ডেটা নিরাপত্তা প্রদান করে। এটি টেবিলের মাধ্যমে ডেটা সংরক্ষণ করে এবং সম্পর্ক তৈরি করতে দেয় (যেমন: Primary Key, Foreign Key)। </br>
উদাহরণ:

```
CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT
);

```

### 2. What is the purpose of a database schema in PostgreSQL?

স্কিমা হলো একটি ডেটাবেসের কাঠামো বা ডিজাইন যা টেবিল, ভিউ, ফাংশন এবং অন্যান্য অবজেক্টগুলির সম্পর্কে বর্ণনা করে। একটি ডেটাবেজে অনেকগুলো টেবিল থাকে, স্কিমা ব্যবহার করে টেবিলগুলোকে বিভিন্ন গ্রুপে ভাগ করে রাখা যায়। ডাটাবেস স্কিমার বেশ কিছু মূল উপাদান ডেটা কার্যকরভাবে সংগঠিত এবং পরিচালনা করতে একসাথে কাজ করে। </br>
যেমন :</br>
একটি টেবিল হল সারি এবং কলামে সংগঠিত ডেটার একটি সংগ্রহ যা যথাক্রমে রেকর্ড এবং কলামগুলোকে প্রতিনিধিত্ব করে। টেবিলগুলি হল স্কিমার ভিত্তি এবং ডাটাবেসে ডেটা সংরক্ষণ এবং পরিচালনার প্রাথমিক উপায় হিসাবে কাজ করে। </br>
এবং </br>
কলামগুলি একটি টেবিলের মধ্যে পৃথক ডেটা উপাদান যা নির্দিষ্ট তথ্য সঞ্চয় করে। প্রতিটি কলাম একটি নাম, ডেটা টাইপ এবং ঐচ্ছিক সীমাবদ্ধতা দ্বারা সংজ্ঞায়িত করা হয়, যেমন "Not Null" বা "Any"। এটি প্রতিটি ক্ষেত্রে ডেটা স্টোরেজ টাইপের উপর সুনির্দিষ্ট নিয়ন্ত্রণের অনুমতি দেয় এবং ডেটা অখণ্ডতা বজায় রাখতে সহায়তা করে।</br>
এবং </br>
সম্পর্কগুলি একটি টেবিলের ডেটা কীভাবে অন্য টেবিলের ডেটার সাথে সম্পর্কিত তা উল্লেখ করে।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL?

PostgreSQL-এ Primary Key এবং Foreign Key হলো ডাটাবেস টেবিলের সম্পর্ক তৈরি করার জন্য ব্যবহৃত দুটি গুরুত্বপূর্ণ বৈশিষ্ট্য।</br>
Primary Key:</br>
Primary Key হলো একটি টেবিলের এমন একটি কলাম বা কলামের সংমিশ্রণ, যা প্রতিটি রেকর্ডের জন্য অনন্য । এটি টেবিলের মধ্যে কোন ডুপ্লিকেট বা নাল মান থাকতে দেয় না এবং প্রতিটি রেকর্ডকে সুনির্দিষ্টভাবে চিহ্নিত করে। একটি টেবিলে শুধুমাত্র একটি প্রাইমারি কি থাকতে পারে। </br>
উদাহরণ: </br>

```
CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT
);

```

</br>
Foreign Key:</br>
Foreign Key হলো একটি কলাম বা কলামগুলির সংমিশ্রণ যা অন্য একটি টেবিলের Primary Key এর সাথে সম্পর্কিত থাকে। Foreign Key সম্পর্কিত টেবিলের মধ্যে সম্পর্ক নির্ধারণ করতে সাহায্য করে। এটি নিশ্চিত করে যে, কোনো রেকর্ডের জন্য সম্পর্কিত ডেটা অন্য টেবিলে থাকতে হবে। </br>
উদাহরণ: </br>

```
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100),
     FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id)
);

```

### 4. What is the difference between the VARCHAR and CHAR data types?

varchar হলো ভেরিয়েবল দৈর্ঘ্যের স্ট্রিং এবং char হলো নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং। </br>
varchar ইনপুট অনুযায়ী দৈর্ঘ্য হিসেব করে এবং char ইনপুট কম হলে অতিরিক্ত জায়গা space দিয়ে পূরণ করে।</br>
varchar ইনপুট যতটুকু দরকার, ততটুকু স্পেস নেয় এবং char নির্ধারিত n দৈর্ঘ্য অনুযায়ী স্পেস নেয়। </br>
উদাহরণ : </br>

    ```

         CREATE TABLE rangers (
        ranger_name VARCHAR(30)
         );

         CREATE TABLE rangers (
            ranger_name CHAR(10)
                );

    ```

varchar ranger_name 30 ক্যারেক্টার পর্যন্ত হতে পারে, কিন্তু যদি ২০ ক্যারেক্টার হয়, তাহলে বাকি ক্যারেক্টার স্পেস দিয়ে নষ্ট হবে না।

char ranger_name সব সময় 10 ক্যারেক্টার হবে। যদি Muntasir লিখে দেওয়া হয়, তাহলে এটি স্বয়ংক্রিয়ভাবে 8 টি ক্যারেক্টার ও 2টি স্পেস সহ 10 ক্যারেক্টার রাখবে।

### 5. Explain the purpose of the WHERE clause in a SELECT statement.

SELECT statement এর WHERE clause এর উদ্দেশ্য হলো ডেটা ফিল্টার করা, নির্দিষ্ট শর্ত অনুযায়ী। এটি সেই row গুলো নির্বাচন করে যা WHERE clause-এ সংজ্ঞায়িত শর্ত পূরণ করে এবং শর্ত পূরণ না কর row গুলো বাদ দেয়। সহজ কথায়, এটি একটি বৃহৎ ডেটা সেট থেকে শুধুমাত্র নির্দিষ্ট শর্ত অনুযায়ী ডেটা দেখায়।</br>
উদাহরণ : </br>

```
     SELECT * FROM sightings
         WHERE location like '%Pass%';
```

### 6.What are the LIMIT and OFFSET clauses used for?

LIMIT ক্লজ নির্দিষ্ট সংখ্যক রেকর্ড দেখাতে ব্যবহৃত হয়। এর মাধ্যমে, একাধিক রেকর্ড থেকে শুধুমাত্র কিছু সংখ্যক রেকর্ড নির্বাচন করা হয়। এটি ডাটাবেসের লোড কমাতে সহায়তা করে, বিশেষ করে যখন খুব বড় ডাটাবেসের মধ্যে থেকে ছোট ডাটা সেট প্রয়োজন হয়। </br>
উদাহরণ:</br>

     ```
                 SELECT * FROM sightings
                          LIMIT 5;
      ```

OFFSET ক্লজ দিয়ে নির্ধারণ করা হয়, কতটি রেকর্ড স্কিপ করে দেখানো শুরু হবে। প্রথম থেকে রেকর্ড বাদ দেওয়া হয়।</br>

উদাহরণ:</br>

    ```
         SELECT * FROM sightings
        OFFSET 5;
    ```

### 7. How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলের ভিতরে থাকা রেকর্ডের ডেটা পরিবর্তন করা যায়। </br>
</br>

উদাহরণ:</br>

```
    UPDATE rangers
                SET region = "Northen Hill"
                     WHERE ranger_id = 1;

```

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN অপারেশন এর মাধ্যমে দুই বা তার বেশি টেবিলের ডেটাকে সংযুক্ত করে একসাথে দেখানো যায়। JOIN অপারেশন একটি matching condition ব্যবহার করে কাজ করে। এটি সাধারণত প্রাইমারি কি এবং ফরেন কি এর উপর ভিত্তি করে দুইটি টেবিলকে সংযুক্ত করে ফলাফল তৈরি করে। </br>

উদাহরণ:</br>

    ```
         SELECT species.common_name
             FROM species
               LEFT JOIN sightings on species.species_id = sightings.species_id
             WHERE sightings.species_id IS NULL;
    ```
