---
title: "Kiểm tra kỹ năng: JavaScript hướng đối tượng"
short-title: "Kiểm tra: JavaScript hướng đối tượng"
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Test_your_skills/Object-oriented_JavaScript
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu bài viết [Lớp trong JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript) của chúng ta không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh truyền thông](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## OOJS 1

Trong tác vụ này, chúng tôi cung cấp cho bạn phần bắt đầu của định nghĩa lớp `Shape`. Lớp có ba thuộc tính: `name`, `sides` và `sideLength`. Lớp này chỉ mô hình hóa các hình mà tất cả các cạnh có cùng độ dài, như hình vuông hoặc tam giác đều.

Để hoàn thành tác vụ:

1. Thêm hàm khởi tạo vào lớp này. Hàm khởi tạo nhận đối số cho các thuộc tính `name`, `sides` và `sideLength`, và khởi tạo chúng.
2. Thêm phương thức `calcPerimeter()` mới vào lớp, tính chu vi của hình (độ dài cạnh ngoài của hình) và ghi kết quả vào bảng điều khiển.
3. Tạo một thực thể mới của lớp `Shape` được gọi là `square`. Đặt cho nó `name` là `square`, `4` `sides` và `sideLength` là `5`.
4. Gọi phương thức `calcPerimeter()` của bạn trên thực thể, để xem liệu nó có ghi kết quả tính toán vào bảng điều khiển của trình duyệt như mong đợi không.
5. Tạo một thực thể mới của `Shape` được gọi là `triangle`, với `name` là `triangle`, `3` `sides` và `sideLength` là `3`.
6. Gọi `triangle.calcPerimeter()` để kiểm tra xem nó có hoạt động ổn không.

```js live-sample___oojs-1
class Shape {
  name;
  sides;
  sideLength;
}
```

{{ EmbedLiveSample("oojs-1", "100%", 60) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript đã hoàn chỉnh của bạn có thể trông như sau:

```js
class Shape {
  name;
  sides;
  sideLength;

  constructor(name, sides, sideLength) {
    this.name = name;
    this.sides = sides;
    this.sideLength = sideLength;
  }

  calcPerimeter() {
    console.log(
      `The ${this.name}'s perimeter length is ${this.sides * this.sideLength}.`,
    );
  }
}

const square = new Shape("square", 4, 5);
square.calcPerimeter();

const triangle = new Shape("triangle", 3, 3);
triangle.calcPerimeter();
```

</details>

## OOJS 2

Bây giờ đến lúc thêm kế thừa vào.

Để hoàn thành tác vụ:

1. Tạo lớp `Square` kế thừa từ `Shape`.
2. Thêm phương thức `calcArea()` vào `Square` tính diện tích của nó.
3. Thiết lập hàm khởi tạo `Square` để thuộc tính `name` của các thực thể đối tượng `Square` được tự động đặt thành `square`, và thuộc tính `sides` được tự động đặt thành `4`. Khi gọi hàm khởi tạo, do đó bạn chỉ cần cung cấp thuộc tính `sideLength`.
4. Tạo một thực thể của lớp `Square` được gọi là `square` với các giá trị thuộc tính phù hợp, và gọi các phương thức `calcPerimeter()` và `calcArea()` của nó để kiểm tra xem nó có hoạt động ổn không.

```js live-sample___oojs-2
class Shape {
  name;
  sides;
  sideLength;

  constructor(name, sides, sideLength) {
    this.name = name;
    this.sides = sides;
    this.sideLength = sideLength;
  }

  calcPerimeter() {
    console.log(
      `The ${this.name}'s perimeter length is ${this.sides * this.sideLength}.`,
    );
  }
}

// Don't edit the code above here!

// Add your code here
```

{{ EmbedLiveSample("oojs-2", "100%", 60) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript đã hoàn chỉnh của bạn có thể trông như sau:

```js
// ...
// Don't edit the code above here!

class Square extends Shape {
  constructor(sideLength) {
    super("square", 4, sideLength);
  }

  calcArea() {
    console.log(
      `The ${this.name}'s area is ${this.sideLength * this.sideLength} squared.`,
    );
  }
}

const square = new Square(4);

square.calcPerimeter();
square.calcArea();
```

</details>

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
