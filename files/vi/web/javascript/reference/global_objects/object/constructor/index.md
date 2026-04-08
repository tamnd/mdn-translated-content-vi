---
title: Object.prototype.constructor
short-title: constructor
slug: Web/JavaScript/Reference/Global_Objects/Object/constructor
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Object.constructor
sidebar: jsref
---

Thuộc tính data **`constructor`** của một thực thể {{jsxref("Object")}} trả về tham chiếu đến hàm constructor đã tạo ra đối tượng thực thể. Lưu ý rằng giá trị của thuộc tính này là tham chiếu đến _bản thân hàm đó_, không phải là chuỗi chứa tên của hàm.

> [!NOTE]
> Đây là thuộc tính của các đối tượng JavaScript. Đối với phương thức `constructor` trong các lớp, xem [trang tham khảo riêng của nó](/en-US/docs/Web/JavaScript/Reference/Classes/constructor).

## Giá trị

Tham chiếu đến hàm constructor đã tạo ra đối tượng thực thể.

{{js_property_attributes(1, 0, 1)}}

> [!NOTE]
> Thuộc tính này được tạo mặc định trên thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) của mỗi hàm constructor và được kế thừa bởi tất cả các đối tượng được tạo bởi constructor đó.

## Mô tả

Bất kỳ đối tượng nào (ngoại trừ [các đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều có thuộc tính `constructor` trên `[[Prototype]]` của nó. Các đối tượng được tạo bằng literal cũng có thuộc tính `constructor` trỏ đến kiểu constructor của đối tượng đó — ví dụ, array literal tạo ra các đối tượng {{jsxref("Array")}}, và [object literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) tạo ra các đối tượng thông thường.

```js
const o1 = {};
o1.constructor === Object; // true

const o2 = new Object();
o2.constructor === Object; // true

const a1 = [];
a1.constructor === Array; // true

const a2 = new Array();
a2.constructor === Array; // true

const n = 3;
n.constructor === Number; // true
```

Lưu ý rằng `constructor` thường đến từ thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) của constructor. Nếu bạn có một prototype chain dài hơn, thông thường bạn có thể kỳ vọng mọi đối tượng trong chuỗi đều có thuộc tính `constructor`.

```js
const o = new TypeError(); // Inheritance: TypeError -> Error -> Object
const proto = Object.getPrototypeOf;

Object.hasOwn(o, "constructor"); // false
proto(o).constructor === TypeError; // true
proto(proto(o)).constructor === Error; // true
proto(proto(proto(o))).constructor === Object; // true
```

## Ví dụ

### Hiển thị constructor của một đối tượng

Ví dụ sau tạo một constructor (`Tree`) và một đối tượng của kiểu đó (`theTree`). Sau đó, ví dụ hiển thị thuộc tính `constructor` của đối tượng `theTree`.

```js
function Tree(name) {
  this.name = name;
}

const theTree = new Tree("Redwood");
console.log(`theTree.constructor is ${theTree.constructor}`);
```

Ví dụ này hiển thị kết quả sau:

```plain
theTree.constructor is function Tree(name) {
  this.name = name;
}
```

### Gán thuộc tính constructor cho một đối tượng

Người ta có thể gán thuộc tính `constructor` của các kiểu không phải primitive.

```js
const arr = [];
arr.constructor = String;
arr.constructor === String; // true
arr instanceof String; // false
arr instanceof Array; // true

const foo = new Foo();
foo.constructor = "bar";
foo.constructor === "bar"; // true

// etc.
```

Điều này không ghi đè thuộc tính `constructor` cũ — nó ban đầu có mặt trên `[[Prototype]]` của thực thể, không phải là thuộc tính riêng của nó.

```js
const arr = [];
Object.hasOwn(arr, "constructor"); // false
Object.hasOwn(Object.getPrototypeOf(arr), "constructor"); // true

arr.constructor = String;
Object.hasOwn(arr, "constructor"); // true — thuộc tính thực thể che khuất thuộc tính trên prototype của nó
```

Nhưng ngay cả khi `Object.getPrototypeOf(a).constructor` được gán lại, nó sẽ không thay đổi các hành vi khác của đối tượng. Ví dụ, hành vi của `instanceof` được điều khiển bởi [`Symbol.hasInstance`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance), không phải `constructor`:

```js
const arr = [];
arr.constructor = String;
arr instanceof String; // false
arr instanceof Array; // true
```

Không có gì ngăn chặn thuộc tính `constructor` khỏi bị gán lại hoặc bị che khuất, vì vậy việc sử dụng nó để phát hiện kiểu của một biến thường nên được tránh để ưu tiên các cách ít dễ vỡ hơn như `instanceof` và [`Symbol.toStringTag`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) cho các đối tượng, hoặc [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) cho các kiểu primitive.

### Thay đổi constructor của prototype một hàm constructor

Mỗi constructor có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype), thuộc tính này sẽ trở thành `[[Prototype]]` của thực thể khi được gọi qua toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Do đó, `ConstructorFunction.prototype.constructor` sẽ trở thành một thuộc tính trên `[[Prototype]]` của thực thể, như đã được minh họa ở trên.

Tuy nhiên, nếu `ConstructorFunction.prototype` được gán lại, thuộc tính `constructor` sẽ bị mất. Ví dụ, sau đây là cách tạo mẫu kế thừa phổ biến:

```js
function Parent() {
  // …
}
Parent.prototype.parentMethod = function () {};

function Child() {
  Parent.call(this); // Make sure everything is initialized properly
}
// Pointing the [[Prototype]] of Child.prototype to Parent.prototype
Child.prototype = Object.create(Parent.prototype);
```

`constructor` của các thực thể `Child` sẽ là `Parent` do `Child.prototype` bị gán lại.

Thông thường đây không phải là vấn đề lớn — ngôn ngữ hầu như không bao giờ đọc thuộc tính `constructor` của một đối tượng. Ngoại lệ duy nhất là khi sử dụng [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/species) để tạo các thực thể mới của một lớp, nhưng những trường hợp như vậy hiếm gặp, và bạn nên sử dụng cú pháp [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) để tạo lớp con từ các built-in.

Tuy nhiên, đảm bảo rằng `Child.prototype.constructor` luôn trỏ đến chính `Child` là rất quan trọng khi một số caller sử dụng `constructor` để truy cập lớp gốc từ một thực thể. Hãy xem trường hợp sau: đối tượng có phương thức `create()` để tạo chính nó.

```js
function Parent() {
  // …
}
function CreatedConstructor() {
  Parent.call(this);
}

CreatedConstructor.prototype = Object.create(Parent.prototype);

CreatedConstructor.prototype.create = function () {
  return new this.constructor();
};

new CreatedConstructor().create().create(); // TypeError: new CreatedConstructor().create().create is undefined, since constructor === Parent
```

Trong ví dụ trên, một ngoại lệ được ném ra vì `constructor` liên kết đến `Parent`. Để tránh điều này, chỉ cần gán constructor cần thiết mà bạn sẽ sử dụng.

```js
function Parent() {
  // …
}
function CreatedConstructor() {
  // …
}

CreatedConstructor.prototype = Object.create(Parent.prototype, {
  // Return original constructor to Child
  constructor: {
    value: CreatedConstructor,
    enumerable: false, // Make it non-enumerable, so it won't appear in `for...in` loop
    writable: true,
    configurable: true,
  },
});

CreatedConstructor.prototype.create = function () {
  return new this.constructor();
};

new CreatedConstructor().create().create(); // it's pretty fine
```

Lưu ý rằng khi thêm thuộc tính `constructor` thủ công, điều quan trọng là phải làm cho thuộc tính [không thể liệt kê](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties), để `constructor` sẽ không xuất hiện trong các vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) — như thông thường nó không có.

Nếu đoạn mã trên có vẻ quá nhiều boilerplate, bạn cũng có thể xem xét việc sử dụng [`Object.setPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf) để thao tác prototype chain.

```js
function Parent() {
  // …
}
function CreatedConstructor() {
  // …
}

Object.setPrototypeOf(CreatedConstructor.prototype, Parent.prototype);

CreatedConstructor.prototype.create = function () {
  return new this.constructor();
};

new CreatedConstructor().create().create(); // still works without re-creating constructor property
```

`Object.setPrototypeOf()` có những nhược điểm hiệu suất tiềm ẩn vì tất cả các đối tượng được tạo trước đó liên quan trong prototype chain phải được biên dịch lại; nhưng nếu mã khởi tạo ở trên xảy ra trước khi `Parent` hoặc `CreatedConstructor` được xây dựng, tác động sẽ là tối thiểu.

Hãy xem xét thêm một trường hợp phức tạp hơn.

```js
function ParentWithStatic() {}

ParentWithStatic.startPosition = { x: 0, y: 0 }; // Static member property
ParentWithStatic.getStartPosition = function () {
  return this.startPosition;
};

function Child(x, y) {
  this.position = { x, y };
}

Child.prototype = Object.create(ParentWithStatic.prototype, {
  // Return original constructor to Child
  constructor: {
    value: Child,
    enumerable: false,
    writable: true,
    configurable: true,
  },
});

Child.prototype.getOffsetByInitialPosition = function () {
  const position = this.position;
  // Using this.constructor, in hope that getStartPosition exists as a static method
  const startPosition = this.constructor.getStartPosition();

  return {
    offsetX: startPosition.x - position.x,
    offsetY: startPosition.y - position.y,
  };
};

new Child(1, 1).getOffsetByInitialPosition();
// Error: this.constructor.getStartPosition is undefined, since the
// constructor is Child, which doesn't have the getStartPosition static method
```

Để ví dụ này hoạt động đúng, chúng ta có thể gán lại các thuộc tính tĩnh của `Parent` cho `Child`:

```js
// …
Object.assign(Child, ParentWithStatic); // Notice that we assign it before we create() a prototype below
Child.prototype = Object.create(ParentWithStatic.prototype, {
  // Return original constructor to Child
  constructor: {
    value: Child,
    enumerable: false,
    writable: true,
    configurable: true,
  },
});
// …
```

Nhưng thậm chí tốt hơn, chúng ta có thể làm cho các hàm constructor tự mở rộng lẫn nhau, như cú pháp [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) của các lớp làm.

```js
function ParentWithStatic() {}

ParentWithStatic.startPosition = { x: 0, y: 0 }; // Static member property
ParentWithStatic.getStartPosition = function () {
  return this.startPosition;
};

function Child(x, y) {
  this.position = { x, y };
}

// Properly create inheritance!
Object.setPrototypeOf(Child.prototype, ParentWithStatic.prototype);
Object.setPrototypeOf(Child, ParentWithStatic);

Child.prototype.getOffsetByInitialPosition = function () {
  const position = this.position;
  const startPosition = this.constructor.getStartPosition();

  return {
    offsetX: startPosition.x - position.x,
    offsetY: startPosition.y - position.y,
  };
};

console.log(new Child(1, 1).getOffsetByInitialPosition()); // { offsetX: -1, offsetY: -1 }
```

Một lần nữa, sử dụng `Object.setPrototypeOf()` có thể gây ra tác động hiệu suất xấu, vì vậy hãy đảm bảo nó xảy ra ngay sau khai báo constructor và trước khi bất kỳ thực thể nào được tạo — để tránh các đối tượng bị "nhiễm bẩn".

> [!NOTE]
> Việc cập nhật hoặc đặt constructor thủ công có thể dẫn đến những hậu quả khác nhau và đôi khi gây nhầm lẫn. Để ngăn chặn điều này, chỉ cần xác định vai trò của `constructor` trong từng trường hợp cụ thể. Trong hầu hết các trường hợp, `constructor` không được sử dụng và việc gán lại nó là không cần thiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/class", "class")}}
- {{jsxref("Classes/constructor", "constructor")}}
- {{Glossary("Constructor")}}
