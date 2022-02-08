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

**حذف مهمة**

قمت بالبحث عن دالة تسمح بالحذف من الخلية في الجدول مباشرة دون الحاجة إلى إضافة زر للحذف 

![حذف مهمة من الجدول](https://user-images.githubusercontent.com/95555310/145270318-04994fca-b23f-4d79-a596-6a3c0af6cbf9.png)

`func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { if editingStyle == UITableViewCell.EditingStyle.delete { confirmationDelet(indexPath: indexPath) } }`

التالي هو كود إظهار إشعار تأكيد عملية الحذف للمستخدم

عندما يقوم المستخدم بتحديد الخلية التي فيها المهمة المراد حذفها وذلك بسحبها لليسار يظهر اشعار بتاكيد عملية الحذف او الغائها، وعند اختيار الحذف تختفي الخلية بتنسيق حركي بطيئ

![إشعار تأكيد الحذف](https://user-images.githubusercontent.com/95555310/145277234-e7b02218-8b9b-4c6e-b3c8-b67d83c7b50b.png)

`func confirmationDelet(indexPath: IndexPath) { let confirmAlert = UIAlertController(title: "تنبيه!", message: "هل ترغب بتأكيد الحذف؟", preferredStyle: .alert) let confirmAction = UIAlertAction(title: "تأكيد الحذف", style: .destructive) { _ in self.todosArray.remove(at: indexPath.row) self.todosTableView.deleteRows(at: [indexPath], with: .fade) self.delete(index: indexPath.row) self.todosTableView.reloadData() } confirmAlert.addAction(confirmAction) confirmAlert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil)) present(confirmAlert, animated: true, completion: nil) }`

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

