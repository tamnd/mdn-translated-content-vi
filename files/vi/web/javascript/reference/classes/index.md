---
title: Classes
slug: Web/JavaScript/Reference/Classes
page-type: guide
browser-compat: javascript.classes
sidebar: jssidebar
---

Classes là một khuôn mẫu để tạo đối tượng. Chúng đóng gói dữ liệu cùng với code xử lý dữ liệu đó. Classes trong JS được xây dựng trên nền tảng [prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) nhưng cũng có một số cú pháp và ngữ nghĩa riêng biệt.

Để xem thêm ví dụ và giải thích, hãy xem hướng dẫn [Sử dụng classes](/en-US/docs/Web/JavaScript/Guide/Using_classes).

## Mô tả

### Định nghĩa classes

Classes thực chất là "[hàm](/en-US/docs/Web/JavaScript/Reference/Functions) đặc biệt", và giống như bạn có thể định nghĩa [biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function) và [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function), một class cũng có thể được định nghĩa theo hai cách: [biểu thức class](/en-US/docs/Web/JavaScript/Reference/Operators/class) hoặc [khai báo class](/en-US/docs/Web/JavaScript/Reference/Statements/class).

```js
// Khai báo
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}

// Biểu thức; class ẩn danh nhưng được gán cho một biến
const Rectangle = class {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};

// Biểu thức; class có tên riêng
const Rectangle = class Rectangle2 {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};
```

Giống như biểu thức hàm, biểu thức class có thể ẩn danh hoặc có tên khác với biến mà nó được gán vào. Tuy nhiên, khác với khai báo hàm, khai báo class có cùng hạn chế [vùng chết tạm thời](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz) như `let` hoặc `const` và hoạt động như thể chúng [không được hoisting](/en-US/docs/Web/JavaScript/Guide/Using_classes#class_declaration_hoisting).

### Thân class

Thân của một class là phần nằm trong dấu ngoặc nhọn `{}`. Đây là nơi bạn định nghĩa các thành phần của class, chẳng hạn như các phương thức hoặc constructor.

Thân của class được thực thi trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) ngay cả khi không có chỉ thị `"use strict"`.

Một phần tử class có thể được phân loại theo ba khía cạnh:

- Loại: Getter, setter, phương thức, hoặc trường (field)
- Vị trí: Static hoặc instance
- Khả năng hiển thị: Public hoặc private

Kết hợp lại, chúng tạo ra 16 tổ hợp có thể có. Để chia nhỏ tài liệu tham khảo một cách hợp lý hơn và tránh nội dung trùng lặp, các phần tử khác nhau được giới thiệu chi tiết trên các trang riêng biệt:

- [Định nghĩa phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions)
  - : Phương thức instance public
- [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get)
  - : Getter instance public
- [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set)
  - : Setter instance public
- [Trường class public](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields)
  - : Trường instance public
- [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static)
  - : Phương thức static public, getter, setter, và trường
- [Các phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
  - : Tất cả những gì là private

> [!NOTE]
> Các phần tử private có hạn chế là tất cả tên private được khai báo trong cùng một class phải là duy nhất. Tất cả các thuộc tính public khác không có hạn chế này — bạn có thể có nhiều thuộc tính public cùng tên, và thuộc tính cuối cùng sẽ ghi đè các thuộc tính trước. Đây là hành vi tương tự như trong [các bộ khởi tạo đối tượng](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#duplicate_property_names).

Ngoài ra, còn có hai cú pháp phần tử class đặc biệt: [`constructor`](#constructor) và [các khối khởi tạo static](#static_initialization_blocks), mỗi cái đều có trang tham khảo riêng.

#### Constructor

Phương thức {{jsxref("Classes/constructor", "constructor")}} là một phương thức đặc biệt dùng để tạo và khởi tạo một đối tượng được tạo bằng class. Chỉ được phép có một phương thức đặc biệt tên "constructor" trong một class — một {{jsxref("SyntaxError")}} sẽ được ném ra nếu class chứa nhiều hơn một `constructor`.

Một constructor có thể sử dụng từ khóa [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super) để gọi constructor của lớp cha.

Bạn có thể tạo các thuộc tính instance bên trong constructor:

```js
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}
```

Ngoài ra, nếu giá trị của các thuộc tính instance không phụ thuộc vào tham số của constructor, bạn có thể định nghĩa chúng dưới dạng [trường class](#field_declarations).

#### Các khối khởi tạo static

[Các khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks) cho phép khởi tạo linh hoạt các [thuộc tính static](#static_methods_and_fields), bao gồm cả việc đánh giá các câu lệnh trong quá trình khởi tạo, đồng thời cho phép truy cập vào phạm vi private.

Có thể khai báo nhiều khối static, và chúng có thể xen kẽ với khai báo các trường và phương thức static (tất cả các mục static được đánh giá theo thứ tự khai báo).

#### Các phương thức

Các phương thức được định nghĩa trên prototype của mỗi instance class và được chia sẻ bởi tất cả các instance. Các phương thức có thể là hàm thông thường, hàm async, hàm generator, hoặc hàm generator async. Để biết thêm thông tin, xem [định nghĩa phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions).

```js
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  // Getter
  get area() {
    return this.calcArea();
  }
  // Phương thức
  calcArea() {
    return this.height * this.width;
  }
  *getSides() {
    yield this.height;
    yield this.width;
    yield this.height;
    yield this.width;
  }
}

const square = new Rectangle(10, 10);

console.log(square.area); // 100
console.log([...square.getSides()]); // [10, 10, 10, 10]
```

#### Các phương thức và trường static

Từ khóa {{jsxref("Classes/static", "static")}} định nghĩa một phương thức hoặc trường static cho một class. Các thuộc tính static (trường và phương thức) được định nghĩa trên chính class thay vì trên từng instance. Các phương thức static thường được dùng để tạo các hàm tiện ích cho ứng dụng, trong khi các trường static hữu ích cho bộ nhớ đệm, cấu hình cố định, hoặc bất kỳ dữ liệu nào không cần được sao chép qua các instance.

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  static displayName = "Point";
  static distance(a, b) {
    const dx = a.x - b.x;
    const dy = a.y - b.y;

    return Math.hypot(dx, dy);
  }
}

const p1 = new Point(5, 5);
const p2 = new Point(10, 10);
p1.displayName; // undefined
p1.distance; // undefined
p2.displayName; // undefined
p2.distance; // undefined

console.log(Point.displayName); // "Point"
console.log(Point.distance(p1, p2)); // 7.0710678118654755
```

#### Khai báo trường

Với cú pháp khai báo trường class, ví dụ [constructor](#constructor) có thể được viết lại như sau:

```js
class Rectangle {
  height = 0;
  width;
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}
```

Các trường class tương tự như thuộc tính đối tượng, không phải biến, vì vậy chúng ta không dùng các từ khóa như `const` để khai báo chúng. Trong JavaScript, [các phần tử private](#private_elements) sử dụng cú pháp định danh đặc biệt, vì vậy các từ khóa bổ nghĩa như `public` và `private` cũng không nên được dùng.

Như thấy ở trên, các trường có thể được khai báo có hoặc không có giá trị mặc định. Các trường không có giá trị mặc định sẽ mặc định là `undefined`. Bằng cách khai báo trước các trường, định nghĩa class trở nên tự mô tả hơn, và các trường luôn hiện diện, giúp tối ưu hóa.

Xem [trường class public](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) để biết thêm thông tin.

#### Các phần tử private

Sử dụng trường private, định nghĩa có thể được tinh chỉnh như dưới đây.

```js
class Rectangle {
  #height = 0;
  #width;
  constructor(height, width) {
    this.#height = height;
    this.#width = width;
  }
}
```

Việc tham chiếu đến các trường private từ bên ngoài class sẽ gây ra lỗi; chúng chỉ có thể được đọc hoặc ghi trong thân class.
Bằng cách định nghĩa những thứ không hiển thị bên ngoài class, bạn đảm bảo rằng người dùng class của bạn không thể phụ thuộc vào các chi tiết nội bộ, vốn có thể thay đổi qua các phiên bản.

Các trường private chỉ có thể được khai báo trước trong một khai báo trường. Chúng không thể được tạo sau đó thông qua việc gán giá trị cho chúng, không giống như các thuộc tính thông thường.

Các phương thức private và accessor cũng có thể được định nghĩa bằng cú pháp tương tự như các đối tác public của chúng, nhưng với định danh bắt đầu bằng `#`.

Để biết thêm thông tin, xem [các phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

### Kế thừa

Từ khóa {{jsxref("Classes/extends", "extends")}} được dùng trong _khai báo class_ hoặc _biểu thức class_ để tạo một class là con của một constructor khác (có thể là class hoặc hàm).

```js
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name); // gọi constructor của lớp cha và truyền tham số name
  }

  speak() {
    console.log(`${this.name} barks.`);
  }
}

const d = new Dog("Mitzie");
d.speak(); // Mitzie barks.
```

Nếu lớp con có constructor, nó cần gọi `super()` trước khi sử dụng `this`. Từ khóa {{jsxref("Operators/super", "super")}} cũng có thể được dùng để gọi các phương thức tương ứng của lớp cha.

```js
class Cat {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}

class Lion extends Cat {
  speak() {
    super.speak();
    console.log(`${this.name} roars.`);
  }
}

const l = new Lion("Fuzzy");
l.speak();
// Fuzzy makes a noise.
// Fuzzy roars.
```

### Thứ tự đánh giá

Khi một [khai báo `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class) hoặc [biểu thức `class`](/en-US/docs/Web/JavaScript/Reference/Operators/class) được đánh giá, các thành phần của nó được đánh giá theo thứ tự sau:

1. Mệnh đề {{jsxref("Classes/extends", "extends")}}, nếu có, được đánh giá trước tiên. Nó phải trả về một hàm constructor hợp lệ hoặc `null`, nếu không sẽ ném ra {{jsxref("TypeError")}}.
2. Phương thức {{jsxref("Classes/constructor", "constructor")}} được trích xuất, thay thế bằng triển khai mặc định nếu `constructor` không có. Tuy nhiên, vì định nghĩa `constructor` chỉ là một định nghĩa phương thức, bước này không thể quan sát được.
3. Các khóa thuộc tính của phần tử class được đánh giá theo thứ tự khai báo. Nếu khóa thuộc tính được tính toán, biểu thức tính toán đó được đánh giá, với giá trị `this` được đặt thành giá trị `this` bao quanh class (không phải chính class đó). Chưa có giá trị thuộc tính nào được đánh giá ở bước này.
4. Các phương thức và accessor được cài đặt theo thứ tự khai báo. Các phương thức và accessor của instance được cài đặt trên thuộc tính `prototype` của class hiện tại, và các phương thức và accessor static được cài đặt trên chính class đó. Các phương thức và accessor instance private được lưu lại để cài đặt trực tiếp trên instance sau này. Bước này không thể quan sát được.
5. Class hiện được khởi tạo với prototype được chỉ định bởi `extends` và triển khai được chỉ định bởi `constructor`. Đối với tất cả các bước trên, nếu một biểu thức được đánh giá cố gắng truy cập tên của class, một {{jsxref("ReferenceError")}} sẽ được ném ra vì class chưa được khởi tạo.
6. Các giá trị của phần tử class được đánh giá theo thứ tự khai báo:
   - Đối với mỗi [trường instance](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) (public hoặc private), biểu thức khởi tạo của nó được lưu lại. Biểu thức khởi tạo được đánh giá trong quá trình tạo instance, ở đầu constructor (đối với base class) hoặc ngay trước khi lệnh gọi `super()` trả về (đối với derived class).
   - Đối với mỗi [trường static](/en-US/docs/Web/JavaScript/Reference/Classes/static) (public hoặc private), biểu thức khởi tạo của nó được đánh giá với `this` được đặt thành chính class đó, và thuộc tính được tạo ra trên class.
   - [Các khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks) được đánh giá với `this` được đặt thành chính class đó.
7. Class hiện đã được khởi tạo hoàn toàn và có thể được sử dụng như một hàm constructor.

Để biết cách các instance được tạo, xem tài liệu tham khảo {{jsxref("Classes/constructor", "constructor")}}.

## Ví dụ

### Ràng buộc this với các phương thức instance và static

Khi một phương thức static hoặc instance được gọi mà không có giá trị cho {{jsxref("Operators/this", "this")}}, chẳng hạn bằng cách gán phương thức đó cho một biến rồi gọi nó, giá trị `this` sẽ là `undefined` bên trong phương thức đó. Hành vi này vẫn xảy ra ngay cả khi không có chỉ thị [`"use strict"`](/en-US/docs/Web/JavaScript/Reference/Strict_mode), vì code trong thân `class` luôn được thực thi trong strict mode.

```js
class Animal {
  speak() {
    return this;
  }
  static eat() {
    return this;
  }
}

const obj = new Animal();
obj.speak(); // đối tượng Animal
const speak = obj.speak;
speak(); // undefined

Animal.eat(); // class Animal
const eat = Animal.eat;
eat(); // undefined
```

Nếu chúng ta viết lại ví dụ trên bằng cú pháp dựa trên hàm truyền thống trong chế độ không strict, thì các lệnh gọi phương thức `this` tự động được ràng buộc với {{jsxref("globalThis")}}. Trong strict mode, giá trị của `this` vẫn là `undefined`.

```js
function Animal() {}

Animal.prototype.speak = function () {
  return this;
};

Animal.eat = function () {
  return this;
};

const obj = new Animal();
const speak = obj.speak;
speak(); // đối tượng global (trong chế độ không strict)

const eat = Animal.eat;
eat(); // đối tượng global (trong chế độ không strict)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Sử dụng classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class)
- [Biểu thức `class`](/en-US/docs/Web/JavaScript/Reference/Operators/class)
- [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
- [ES6 In Depth: Classes](https://hacks.mozilla.org/2015/07/es6-in-depth-classes/) trên hacks.mozilla.org (2015)
