---
title: Object.prototype.__proto__
short-title: __proto__
slug: Web/JavaScript/Reference/Global_Objects/Object/proto
page-type: javascript-instance-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.Object.proto
sidebar: jsref
---

{{Deprecated_Header}}

> [!WARNING]
> Việc thay đổi `[[Prototype]]` của một đối tượng, do bản chất của cách các JavaScript engine hiện đại tối ưu hóa việc truy cập thuộc tính, hiện tại là một phép toán rất chậm trong mọi trình duyệt và JavaScript engine. Ngoài ra, tác động của việc thay đổi kế thừa là tinh tế và lan rộng, và không chỉ giới hạn ở thời gian thực hiện câu lệnh `obj.__proto__ = ...`, mà có thể mở rộng đến **_bất kỳ_** code nào có quyền truy cập vào bất kỳ đối tượng nào có `[[Prototype]]` bị thay đổi. Bạn có thể đọc thêm tại [JavaScript engine fundamentals: optimizing prototypes](https://mathiasbynens.be/notes/prototypes).

> [!NOTE]
> Việc sử dụng `__proto__` là gây tranh cãi và không được khuyến khích. Sự tồn tại và hành vi chính xác của nó chỉ được chuẩn hóa như một tính năng kế thừa để đảm bảo khả năng tương thích web, trong khi nó mang lại một số [vấn đề bảo mật](/en-US/docs/Web/Security/Attacks/Prototype_pollution) và các cạm bẫy. Để hỗ trợ tốt hơn, hãy ưu tiên dùng {{jsxref("Object.getPrototypeOf()")}}/{{jsxref("Reflect.getPrototypeOf()")}} và {{jsxref("Object.setPrototypeOf()")}}/{{jsxref("Reflect.setPrototypeOf()")}} thay thế.

Thuộc tính accessor **`__proto__`** của các instance {{jsxref("Object")}} phơi bày [`[[Prototype]]`](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) (hoặc là một đối tượng hoặc là {{jsxref("Operators/null", "null")}}) của đối tượng này.

Thuộc tính `__proto__` cũng có thể được dùng trong định nghĩa object literal để đặt `[[Prototype]]` của đối tượng khi tạo, như một thay thế cho {{jsxref("Object.create()")}}. Xem: [cú pháp object initializer / literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer). Cú pháp đó là chuẩn và được tối ưu hóa trong các triển khai, và khá khác biệt so với `Object.prototype.__proto__`.

## Cú pháp

```js-nolint
obj.__proto__
```

### Giá trị trả về

Nếu dùng như getter, trả về `[[Prototype]]` của đối tượng.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu cố gắng đặt prototype của đối tượng [không thể mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible) hoặc [đối tượng exotic có prototype bất biến](https://tc39.es/ecma262/multipage/ordinary-and-exotic-objects-behaviours.html#sec-immutable-prototype-exotic-objects), chẳng hạn như `Object.prototype` hoặc [`window`](/en-US/docs/Web/API/Window).

## Mô tả

Hàm getter `__proto__` phơi bày giá trị của `[[Prototype]]` nội tại của một đối tượng. Đối với các đối tượng được tạo bằng object literal (trừ khi bạn dùng cú pháp [prototype setter](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter)), giá trị này là `Object.prototype`. Đối với các đối tượng được tạo bằng array literal, giá trị này là [`Array.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array). Đối với hàm, giá trị này là {{jsxref("Function.prototype")}}. Bạn có thể đọc thêm về chuỗi prototype tại [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

Hàm setter `__proto__` cho phép thay đổi `[[Prototype]]` của một đối tượng. Giá trị cung cấp phải là đối tượng hoặc {{jsxref("Operators/null", "null")}}. Cung cấp bất kỳ giá trị nào khác sẽ không có tác dụng.

Không giống như {{jsxref("Object.getPrototypeOf()")}} và {{jsxref("Object.setPrototypeOf()")}}, luôn có sẵn trên `Object` như các thuộc tính tĩnh và luôn phản ánh thuộc tính nội tại `[[Prototype]]`, thuộc tính `__proto__` không phải lúc nào cũng tồn tại như một thuộc tính trên tất cả các đối tượng, và do đó không phản ánh `[[Prototype]]` một cách đáng tin cậy.

Thuộc tính `__proto__` chỉ là một accessor property trên `Object.prototype` bao gồm một hàm getter và setter. Một truy cập thuộc tính cho `__proto__` cuối cùng tham chiếu `Object.prototype` sẽ tìm thấy thuộc tính này, nhưng một truy cập không tham chiếu `Object.prototype` sẽ không tìm thấy. Nếu một thuộc tính `__proto__` nào khác được tìm thấy trước khi `Object.prototype` được tham chiếu, thuộc tính đó sẽ che khuất thuộc tính trên `Object.prototype`.

[Đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) không kế thừa bất kỳ thuộc tính nào từ `Object.prototype`, kể cả accessor property `__proto__`, vì vậy nếu bạn cố đọc `__proto__` trên đối tượng như vậy, giá trị luôn là `undefined` bất kể `[[Prototype]]` thực tế của đối tượng là gì, và bất kỳ gán lại `__proto__` nào sẽ tạo thuộc tính mới tên `__proto__` thay vì đặt prototype của đối tượng. Hơn nữa, `__proto__` có thể được định nghĩa lại như một thuộc tính của chính bất kỳ instance đối tượng nào thông qua {{jsxref("Object.defineProperty()")}} mà không kích hoạt setter. Trong trường hợp này, `__proto__` sẽ không còn là accessor cho `[[Prototype]]`. Do đó, hãy luôn ưu tiên {{jsxref("Object.getPrototypeOf()")}} và {{jsxref("Object.setPrototypeOf()")}} để đặt và lấy `[[Prototype]]` của một đối tượng.

## Ví dụ

### Sử dụng \_\_proto\_\_

```js
function Circle() {}
const shape = {};
const circle = new Circle();

// Đặt prototype của đối tượng.
// ĐÃ LỖI THỜI. Đây chỉ là ví dụ minh họa. KHÔNG LÀM VẬY trong code thực tế.
shape.__proto__ = circle;

// Lấy prototype của đối tượng
console.log(shape.__proto__ === Circle); // false
```

```js
function ShapeA() {}
const ShapeB = {
  a() {
    console.log("aaa");
  },
};

ShapeA.prototype.__proto__ = ShapeB;
console.log(ShapeA.prototype.__proto__); // { a: [Function: a] }

const shapeA = new ShapeA();
shapeA.a(); // aaa
console.log(ShapeA.prototype === shapeA.__proto__); // true
```

```js
function ShapeC() {}
const ShapeD = {
  a() {
    console.log("a");
  },
};

const shapeC = new ShapeC();
shapeC.__proto__ = ShapeD;
shapeC.a(); // a
console.log(ShapeC.prototype === shapeC.__proto__); // false
```

```js
function Test() {}
Test.prototype.myName = function () {
  console.log("myName");
};

const test = new Test();
console.log(test.__proto__ === Test.prototype); // true
test.myName(); // myName

const obj = {};
obj.__proto__ = Test.prototype;
obj.myName(); // myName
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.isPrototypeOf()")}}
- {{jsxref("Object.getPrototypeOf()")}}
- {{jsxref("Object.setPrototypeOf()")}}
- [Prototype pollution attack](/en-US/docs/Web/Security/Attacks/Prototype_pollution)
