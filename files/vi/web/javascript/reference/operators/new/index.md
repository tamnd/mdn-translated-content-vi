---
title: new
slug: Web/JavaScript/Reference/Operators/new
page-type: javascript-operator
browser-compat: javascript.operators.new
sidebar: jssidebar
---

Toán tử **`new`** cho phép lập trình viên tạo một instance của kiểu object do người dùng định nghĩa hoặc một trong các kiểu object tích hợp có hàm constructor.

{{InteractiveExample("JavaScript Demo: new operator")}}

```js interactive-example
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}

const car1 = new Car("Eagle", "Talon TSi", 1993);

console.log(car1.make);
// Expected output: "Eagle"
```

## Cú pháp

```js-nolint
new constructor
new constructor()
new constructor(arg1)
new constructor(arg1, arg2)
new constructor(arg1, arg2, /* …, */ argN)
```

### Tham số

- `constructor`
  - : Một class hoặc hàm chỉ định kiểu của object instance. Biểu thức có thể là bất cứ thứ gì với [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#table) đủ, bao gồm một identifier, [property access](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), hoặc biểu thức `new` khác, nhưng [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) không được phép.
- `arg1`, `arg2`, …, `argN`
  - : Danh sách các giá trị mà `constructor` sẽ được gọi với. `new Foo` tương đương với `new Foo()`, tức là nếu không có danh sách đối số nào được chỉ định, `Foo` được gọi mà không có đối số.

## Mô tả

Khi một hàm được gọi với từ khóa **`new`**, hàm sẽ được sử dụng như một constructor. `new` sẽ thực hiện các bước sau:

1. Tạo một object JavaScript rỗng, thuần túy. Để tiện lợi, hãy gọi nó là `newInstance`.
2. Trỏ [[Prototype]] của `newInstance` đến thuộc tính `prototype` của hàm constructor, nếu `prototype` là một {{jsxref("Object")}}. Nếu không, `newInstance` vẫn là một object thuần túy với `Object.prototype` là [[Prototype]] của nó.

   > [!NOTE]
   > Các properties/objects được thêm vào thuộc tính `prototype` của hàm constructor do đó có thể truy cập được cho tất cả các instances được tạo từ hàm constructor.

3. Thực thi hàm constructor với các đối số đã cho, liên kết `newInstance` là ngữ cảnh [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) (tức là tất cả các tham chiếu đến `this` trong hàm constructor bây giờ đều chỉ đến `newInstance`).
4. Nếu hàm constructor trả về một [non-primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_values), giá trị trả về này trở thành kết quả của toàn bộ biểu thức `new`. Nếu không, nếu hàm constructor không trả về gì cả hoặc trả về một primitive, `newInstance` được trả về thay thế. (Thông thường các constructor không trả về giá trị, nhưng họ có thể chọn làm như vậy để ghi đè quá trình tạo object thông thường.)

[Classes](/en-US/docs/Web/JavaScript/Reference/Classes) chỉ có thể được khởi tạo với toán tử `new` — cố gắng gọi một class mà không có `new` sẽ ném ra `TypeError`.

Tạo một object với hàm constructor do người dùng định nghĩa yêu cầu hai bước:

1. Định nghĩa kiểu object bằng cách viết một hàm chỉ định tên và thuộc tính của nó.
   Ví dụ: một hàm constructor để tạo object `Foo` có thể trông như thế này:

   ```js
   function Foo(bar1, bar2) {
     this.bar1 = bar1;
     this.bar2 = bar2;
   }
   ```

2. Tạo một instance của object với `new`.

   ```js
   const myFoo = new Foo("Bar 1", 2021);
   ```

> [!NOTE]
> Một object có thể có thuộc tính là chính nó một object khác. Xem ví dụ bên dưới.

Bạn luôn có thể thêm thuộc tính vào một object instance đã định nghĩa trước đó. Ví dụ: câu lệnh `car1.color = "black"` thêm thuộc tính `color` vào `car1`, và gán cho nó giá trị `"black"`.

Tuy nhiên, điều này không ảnh hưởng đến bất kỳ object nào khác. Để thêm thuộc tính mới vào tất cả các object cùng kiểu, bạn phải thêm thuộc tính vào thuộc tính `prototype` của constructor. Điều này định nghĩa một thuộc tính được chia sẻ bởi tất cả các object được tạo với hàm đó, thay vì chỉ một instance của kiểu object. Đoạn code sau đây thêm thuộc tính `color` với giá trị `"original color"` vào tất cả các object kiểu `Car`, và sau đó ghi đè giá trị đó bằng string `"black"` chỉ trong object instance `car1`. Để biết thêm thông tin, xem [prototype](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes).

```js
function Car() {}
const car1 = new Car();
const car2 = new Car();

console.log(car1.color); // undefined

Car.prototype.color = "original color";
console.log(car1.color); // 'original color'

car1.color = "black";
console.log(car1.color); // 'black'

console.log(Object.getPrototypeOf(car1).color); // 'original color'
console.log(Object.getPrototypeOf(car2).color); // 'original color'
console.log(car1.color); // 'black'
console.log(car2.color); // 'original color'
```

> [!NOTE]
> Trong khi hàm constructor có thể được gọi như bất kỳ hàm thông thường nào (tức là không có toán tử `new`), trong trường hợp này, một object mới không được tạo và giá trị của `this` cũng khác.

Một hàm có thể biết liệu nó có được gọi với `new` hay không bằng cách kiểm tra [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target). `new.target` chỉ là `undefined` khi hàm được gọi mà không có `new`. Ví dụ: bạn có thể có một hàm hành xử khác nhau khi nó được gọi so với khi nó được xây dựng:

```js
function Car(color) {
  if (!new.target) {
    // Called as function.
    return `${color} car`;
  }
  // Called with new.
  this.color = color;
}

const a = Car("red"); // a is "red car"
const b = new Car("red"); // b is `Car { color: "red" }`
```

Trước ES6, giới thiệu [classes](/en-US/docs/Web/JavaScript/Reference/Classes), hầu hết các built-ins JavaScript đều có thể gọi được và xây dựng được, mặc dù nhiều trong số đó thể hiện hành vi khác nhau. Để kể vài cái:

- [`Array()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array), [`Error()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error), và [`Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function) hoạt động như nhau khi được gọi như hàm hoặc constructor.
- [`Boolean()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean/Boolean), [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number), và [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String) ép kiểu đối số của chúng sang kiểu primitive tương ứng khi được gọi, và trả về các wrapper object khi được xây dựng.
- [`Date()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Date) trả về một string đại diện cho ngày hiện tại khi được gọi, tương đương với `new Date().toString()`.

Sau ES6, ngôn ngữ nghiêm ngặt hơn về cái nào là constructor và cái nào là hàm. Ví dụ:

- [`Symbol()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol) và [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) chỉ có thể được gọi mà không có `new`. Cố gắng xây dựng chúng sẽ ném ra `TypeError`.
- [`Proxy`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy) và [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Map) chỉ có thể được xây dựng với `new`. Cố gắng gọi chúng sẽ ném ra `TypeError`.

## Ví dụ

### Kiểu object và object instance

Giả sử bạn muốn tạo kiểu object cho xe ô tô. Bạn muốn kiểu object này được gọi là `Car`, và bạn muốn nó có các thuộc tính cho hãng, model, và năm. Để làm điều này, bạn sẽ viết hàm sau:

```js
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
```

Bây giờ bạn có thể tạo object có tên `myCar` như sau:

```js
const myCar = new Car("Eagle", "Talon TSi", 1993);
```

Câu lệnh này tạo `myCar` và gán cho nó các giá trị đã chỉ định cho các thuộc tính của nó. Sau đó giá trị của `myCar.make` là string "Eagle", `myCar.year` là số nguyên 1993, v.v.

Bạn có thể tạo bất kỳ số lượng object `car` nào bằng cách gọi `new`. Ví dụ:

```js
const kensCar = new Car("Nissan", "300ZX", 1992);
```

### Thuộc tính object là chính nó một object khác

Giả sử bạn định nghĩa một object có tên `Person` như sau:

```js
function Person(name, age, sex) {
  this.name = name;
  this.age = age;
  this.sex = sex;
}
```

Và sau đó khởi tạo hai object `Person` mới như sau:

```js
const rand = new Person("Rand McNally", 33, "M");
const ken = new Person("Ken Jones", 39, "M");
```

Sau đó bạn có thể viết lại định nghĩa của `Car` để bao gồm thuộc tính `owner` nhận một object `Person`, như sau:

```js
function Car(make, model, year, owner) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.owner = owner;
}
```

Để khởi tạo các object mới, bạn sau đó sử dụng như sau:

```js
const car1 = new Car("Eagle", "Talon TSi", 1993, rand);
const car2 = new Car("Nissan", "300ZX", 1992, ken);
```

Thay vì truyền một string literal hoặc giá trị integer khi tạo các object mới, các câu lệnh trên truyền các object `rand` và `ken` như các tham số cho các owners. Để tìm ra tên của chủ sở hữu của `car2`, bạn có thể truy cập thuộc tính sau:

```js
car2.owner.name;
```

### Sử dụng `new` với classes

```js
class Person {
  constructor(name) {
    this.name = name;
  }
  greet() {
    console.log(`Hello, my name is ${this.name}`);
  }
}

const p = new Person("Caroline");
p.greet(); // Hello, my name is Caroline
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Function")}}
- {{jsxref("Reflect.construct()")}}
- {{jsxref("Object")}}
