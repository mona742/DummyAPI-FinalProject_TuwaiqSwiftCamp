# DummyAPI-FinalProject_TuwaiqSwiftCamp
---
### Tuwaiq Get Social:
هو تطبيق تواصل اجتماعي يسمح للمستخدم بتصفح تغريدات الآخرين والتفاعل معهم بإضافة التعليقات، كما أنه يسمح بإنشاء تغريدة جديدة والتعديل على بيانات المستخدم نفسه، كما يسمح بتصفح كل تغريدة تحت وسم معين.

---

**شاشة بدء التطبيق**

![شاشة بدء التطبيق](https://user-images.githubusercontent.com/95555310/152950284-15b66273-4442-4657-adca-ef22c700df94.png)


---
**شاشة تسجيل الدخول**

![شاشة تسجيل الدخول](https://user-images.githubusercontent.com/95555310/152950952-86f57191-5a95-46d1-adb3-c5b5020ef81a.png)


---

**شاشة تسجيل مستخدم جديد**
 
![شاشة إنشاء حساب مستخدم جديد](https://user-images.githubusercontent.com/95555310/152951396-6778988f-3c55-49a0-a1f7-d9321e4a4c82.png)
![رسالة نجاح إنشاء الحساب الجديد](https://user-images.githubusercontent.com/95555310/152951768-2f01d0f5-7873-41d8-80cf-c4f4f38e5eaf.png)


---

**تعديل مهمة**

![تعديل مهمة](https://user-images.githubusercontent.com/95555310/145277547-09d121f1-1d13-4340-9167-70df41aa939b.png)

---
**في شاشة تعديل المهمة كان ال NavBar لا يظهر باللون المطلوب، بحثت عن دالة لتغييره عند الضغط على زر تعديل**

![تعديل مهمة-عدم ظهور لونNavBar](https://user-images.githubusercontent.com/95555310/145274578-d0d56a3c-25b1-4d44-8745-16a86a4dbdbc.png)

`navigationController?.navigationBar.barTintColor = UIColor.systemGreen`
قمت بإضافة هذا الكود في دالة DidLoad داخل NewTodoVC

![تعديل مهمة-إضافة لون للNavBar](https://user-images.githubusercontent.com/95555310/145274819-e0b3817e-5788-437c-898f-0f13507ef065.png)

---

#### تم تقسيم المشروع بحسب هيكلة الMVC

---

##  قمت بالبحث عن دالة تظهر التاريخ والوقت بصيغة معينة تحت كل مهمة معروضة في الجدول

![إظهار التاريخ والوقت](https://user-images.githubusercontent.com/95555310/145314149-dd0fc144-aa83-4606-8165-b728e2c424d1.png)

