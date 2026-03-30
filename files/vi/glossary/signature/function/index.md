---
title: Signature (functions)
slug: Glossary/Signature/Function
page-type: glossary-definition
sidebar: glossarysidebar
---

Một **chữ ký hàm** (hay _chữ ký kiểu_, hoặc _chữ ký phương thức_) xác định đầu vào và đầu ra của {{Glossary("Function", "hàm")}} hoặc {{Glossary("Method", "phương thức")}}.

Một chữ ký có thể bao gồm:

- {{Glossary("Parameter", "tham số")}} và {{Glossary("Type", "kiểu")}} của chúng
- giá trị trả về và kiểu trả về
- {{Glossary("Exception", "ngoại lệ")}} có thể được ném ra hoặc truyền lại
- thông tin về khả năng truy cập phương thức trong chương trình {{Glossary("OOP", "hướng đối tượng")}} (chẳng hạn các từ khóa `public`, `static`, hay `prototype`).

## Tìm hiểu sâu hơn

### Chữ ký trong JavaScript

{{Glossary("JavaScript")}} là ngôn ngữ _kiểu lỏng_ hay _kiểu động_. Điều đó có nghĩa là bạn không cần khai báo kiểu của biến trước. Kiểu sẽ được xác định tự động trong quá trình xử lý chương trình. Dù vậy, chữ ký trong JavaScript vẫn có thể cung cấp một số thông tin về phương thức:

```js
MyObject.prototype.myFunction(value);
```

- Phương thức được cài đặt trên một {{Glossary("object")}} có tên là `MyObject`.
- Phương thức được cài đặt trên `prototype` của `MyObject` (do đó nó là {{Glossary("Method", "phương thức thực thể")}}) thay vì là một {{Glossary("static method")}}.
- Tên của phương thức là `myFunction`.
- Phương thức nhận một tham số, được gọi là `value` và không được định nghĩa thêm.

### Chữ ký trong Java

Trong {{Glossary("Java")}}, chữ ký được dùng để nhận diện các phương thức và lớp ở cấp độ mã máy ảo. Bạn phải khai báo kiểu của các biến trong mã nguồn để có thể chạy chương trình Java. Java là ngôn ngữ _kiểu nghiêm ngặt_ và sẽ kiểm tra mọi tham số tại thời điểm biên dịch xem chúng có đúng hay không.

```java
public static void main(String[] args)
```

- Từ khóa `public` là bộ điều chỉnh truy cập, cho biết rằng phương thức này có thể được gọi bởi bất kỳ đối tượng nào.
- Từ khóa `static` cho biết đây là phương thức của lớp, không phải phương thức thực thể.
- Từ khóa `void` cho biết phương thức này không có giá trị trả về.
- Tên của phương thức là `main`.
- Phương thức nhận một tham số kiểu Mảng String, được đặt tên là `args`.

## Xem thêm

- [Chữ ký kiểu nội bộ Java](https://en.wikipedia.org/wiki/Type_signature#Java) trên Wikipedia
