---
title: Lớp trong JavaScript
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Test_your_skills/Object-oriented_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Trong bài viết trước, chúng ta đã giới thiệu một số khái niệm cơ bản của lập trình hướng đối tượng (OOP), và thảo luận một ví dụ mà chúng ta đã sử dụng các nguyên tắc OOP để mô hình hóa giáo sư và sinh viên trong một trường học.

Chúng ta cũng đã nói về cách có thể sử dụng [nguyên mẫu](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes) và [hàm khởi tạo](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#introducing_constructors) để triển khai một mô hình như thế này, và JavaScript cũng cung cấp các tính năng ánh xạ chặt chẽ hơn với các khái niệm OOP cổ điển.

Trong bài viết này, chúng ta sẽ đi qua các tính năng này. Đáng lưu ý rằng các tính năng được mô tả ở đây không phải là một cách mới để kết hợp các đối tượng: bên trong, chúng vẫn sử dụng nguyên mẫu. Chúng chỉ là cách để thiết lập chuỗi nguyên mẫu dễ dàng hơn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các kiến thức cơ bản về JavaScript
        (đặc biệt là
        <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">Kiến thức cơ bản về đối tượng</a>) và các khái niệm JavaScript hướng đối tượng được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Tạo lớp trong JavaScript.</li>
          <li>Tạo hàm khởi tạo trong JavaScript.</li>
          <li>Kế thừa và đóng gói trong JavaScript.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Lớp và hàm khởi tạo

Bạn có thể khai báo một lớp bằng từ khóa {{jsxref("Statements/class", "class")}}. Đây là khai báo lớp cho `Person` của chúng ta từ bài viết trước:

```js
class Person {
  name;

  constructor(name) {
    this.name = name;
  }

  introduceSelf() {
    console.log(`Hi! I'm ${this.name}`);
  }
}
```

Điều này khai báo một lớp tên là `Person`, với:

- một thuộc tính `name`.
- một hàm khởi tạo nhận tham số `name` được dùng để khởi tạo thuộc tính `name` của đối tượng mới
- một phương thức `introduceSelf()` có thể tham chiếu đến các thuộc tính của đối tượng bằng `this`.

Khai báo `name;` là tùy chọn: bạn có thể bỏ qua nó, và dòng `this.name = name;` trong hàm khởi tạo sẽ tạo thuộc tính `name` trước khi khởi tạo nó. Tuy nhiên, liệt kê các thuộc tính một cách rõ ràng trong khai báo lớp có thể giúp người đọc code của bạn dễ dàng xem những thuộc tính nào là một phần của lớp này hơn.

Bạn cũng có thể khởi tạo thuộc tính với giá trị mặc định khi bạn khai báo nó, với một dòng như `name = '';`.

Hàm khởi tạo được định nghĩa bằng từ khóa {{jsxref("Classes/constructor", "constructor")}}. Giống như [hàm khởi tạo bên ngoài định nghĩa lớp](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#introducing_constructors), nó sẽ:

- tạo một đối tượng mới
- gắn kết `this` với đối tượng mới, vì vậy bạn có thể tham chiếu đến `this` trong code hàm khởi tạo của mình
- chạy code trong hàm khởi tạo
- trả về đối tượng mới.

Cho trước code khai báo lớp ở trên, bạn có thể tạo và sử dụng thực thể `Person` mới như sau:

```js
const giles = new Person("Giles");

giles.introduceSelf(); // Hi! I'm Giles
```

Lưu ý rằng chúng ta gọi hàm khởi tạo bằng tên của lớp, `Person` trong ví dụ này.

### Bỏ qua hàm khởi tạo

Nếu bạn không cần thực hiện bất kỳ khởi tạo đặc biệt nào, bạn có thể bỏ qua hàm khởi tạo, và hàm khởi tạo mặc định sẽ được tạo cho bạn:

```js
class Animal {
  sleep() {
    console.log("zzzzzzz");
  }
}

const spot = new Animal();

spot.sleep(); // 'zzzzzzz'
```

## Kế thừa

Cho trước lớp `Person` ở trên, hãy định nghĩa lớp con `Professor`.

```js
class Professor extends Person {
  teaches;

  constructor(name, teaches) {
    super(name);
    this.teaches = teaches;
  }

  introduceSelf() {
    console.log(
      `My name is ${this.name}, and I will be your ${this.teaches} professor.`,
    );
  }

  grade(paper) {
    const grade = Math.floor(Math.random() * (5 - 1) + 1);
    console.log(grade);
  }
}
```

Chúng ta sử dụng từ khóa {{jsxref("Classes/extends", "extends")}} để nói rằng lớp này kế thừa từ lớp khác.

Lớp `Professor` thêm thuộc tính mới `teaches`, vì vậy chúng ta khai báo nó.

Vì chúng ta muốn thiết lập `teaches` khi một `Professor` mới được tạo, chúng ta định nghĩa hàm khởi tạo, nhận `name` và `teaches` làm đối số. Điều đầu tiên hàm khởi tạo này làm là gọi hàm khởi tạo lớp cha bằng cách sử dụng {{jsxref("Operators/super", "super()")}}, truyền tham số `name`. Hàm khởi tạo lớp cha đảm nhận việc thiết lập `name`. Sau đó, hàm khởi tạo `Professor` thiết lập thuộc tính `teaches`.

> [!NOTE]
> Nếu lớp con có bất kỳ khởi tạo nào của riêng nó, nó **phải** gọi hàm khởi tạo lớp cha trước bằng cách sử dụng `super()`, truyền bất kỳ tham số nào mà hàm khởi tạo lớp cha mong đợi.

Chúng ta cũng đã ghi đè phương thức `introduceSelf()` từ lớp cha, và thêm phương thức mới `grade()`, để chấm bài (giáo sư của chúng ta không giỏi lắm, và chỉ chấm điểm ngẫu nhiên cho các bài).

Với khai báo này, chúng ta có thể tạo và sử dụng giáo sư:

```js
const walsh = new Professor("Walsh", "Psychology");
walsh.introduceSelf(); // 'My name is Walsh, and I will be your Psychology professor'

walsh.grade("my paper"); // some random grade
```

## Đóng gói

Cuối cùng, hãy xem cách triển khai đóng gói trong JavaScript. Trong bài viết trước, chúng ta đã thảo luận về cách chúng ta muốn làm cho thuộc tính `year` của `Student` là riêng tư, để chúng ta có thể thay đổi các quy tắc về các lớp bắn cung mà không làm hỏng bất kỳ code nào sử dụng lớp `Student`.

Đây là khai báo lớp `Student` thực hiện điều đó:

```js
class Student extends Person {
  #year;

  constructor(name, year) {
    super(name);
    this.#year = year;
  }

  introduceSelf() {
    console.log(`Hi! I'm ${this.name}, and I'm in year ${this.#year}.`);
  }

  canStudyArchery() {
    return this.#year > 1;
  }
}
```

Trong khai báo lớp này, `#year` là một [trường riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements). Chúng ta có thể tạo đối tượng `Student`, và nó có thể sử dụng `#year` bên trong, nhưng nếu code bên ngoài đối tượng cố gắng truy cập `#year`, trình duyệt sẽ ném ra lỗi:

```js
const summers = new Student("Summers", 2);

summers.introduceSelf(); // Hi! I'm Summers, and I'm in year 2.
summers.canStudyArchery(); // true

summers.#year; // SyntaxError
```

> [!NOTE]
> Code chạy trong bảng điều khiển Chrome có thể truy cập các phần tử riêng tư bên ngoài lớp. Đây là sự nới lỏng chỉ dành cho DevTools của hạn chế cú pháp JavaScript.

Các trường riêng tư phải được khai báo trong khai báo lớp, và tên của chúng bắt đầu bằng `#`.

### Phương thức riêng tư

Bạn cũng có thể có các phương thức riêng tư cũng như các trường riêng tư. Giống như các trường riêng tư, tên phương thức riêng tư bắt đầu bằng `#`, và chúng chỉ có thể được gọi bởi các phương thức của chính đối tượng:

```js
class Example {
  somePublicMethod() {
    this.#somePrivateMethod();
  }

  #somePrivateMethod() {
    console.log("You called me?");
  }
}

const myExample = new Example();

myExample.somePublicMethod(); // 'You called me?'

myExample.#somePrivateMethod(); // SyntaxError
```

## Tóm tắt

Trong bài viết này, chúng ta đã đi qua các công cụ chính có sẵn trong JavaScript để viết các chương trình hướng đối tượng. Chúng ta chưa đề cập đến tất cả mọi thứ ở đây, nhưng điều này phải đủ để bạn bắt đầu. [Bài viết về Lớp](/en-US/docs/Web/JavaScript/Reference/Classes) của chúng ta là nơi tốt để tìm hiểu thêm.

Tiếp theo, chúng ta sẽ cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra xem bạn đã hiểu và ghi nhớ thông tin chúng ta đã cung cấp về JavaScript hướng đối tượng cho đến nay như thế nào.

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Test_your_skills/Object-oriented_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
