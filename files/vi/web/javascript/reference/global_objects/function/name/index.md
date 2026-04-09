---
title: "Function: name"
short-title: name
slug: Web/JavaScript/Reference/Global_Objects/Function/name
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Function.name
sidebar: jsref
---

Thuộc tính dữ liệu **`name`** của một instance {{jsxref("Function")}} cho biết tên của hàm như được chỉ định khi tạo, hoặc có thể là `anonymous` hay `''` (chuỗi rỗng) đối với các hàm được tạo ẩn danh.

{{InteractiveExample("JavaScript Demo: Function: name")}}

```js interactive-example
const func1 = function () {};

const object = {
  func2: function () {},
};

console.log(func1.name);
// Expected output: "func1"

console.log(object.func2.name);
// Expected output: "func2"
```

## Giá trị

Một chuỗi.

{{js_property_attributes(0, 0, 1)}}

> [!NOTE]
> Trong các cài đặt không chuẩn trước ES2015, thuộc tính `configurable` cũng là `false`.

## Mô tả

Thuộc tính `name` của hàm có thể được dùng để nhận dạng hàm trong các công cụ debug hoặc thông báo lỗi. Nó không có ý nghĩa ngữ nghĩa đối với ngôn ngữ.

Thuộc tính `name` là chỉ đọc và không thể thay đổi bằng toán tử gán:

```js
function someFunction() {}

someFunction.name = "otherFunction";
console.log(someFunction.name); // someFunction
```

Để thay đổi nó, hãy dùng {{jsxref("Object.defineProperty()")}}.

Thuộc tính `name` thường được suy ra từ cách định nghĩa hàm. Trong các phần sau, chúng ta sẽ mô tả các cách khác nhau mà nó có thể được suy ra.

### Khai báo function

Thuộc tính `name` trả về tên của một khai báo hàm.

```js
function doSomething() {}
doSomething.name; // "doSomething"
```

### Khai báo function được export mặc định

Một khai báo [`export default`](/en-US/docs/Web/JavaScript/Reference/Statements/export) export hàm dưới dạng khai báo thay vì biểu thức. Nếu khai báo là ẩn danh, tên sẽ là `"default"`.

```js
// -- someModule.js --
export default function () {}

// -- main.js --
import someModule from "./someModule.js";

someModule.name; // "default"
```

### Function constructor

Các hàm được tạo bằng constructor [`Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function) có tên là "anonymous".

```js
new Function().name; // "anonymous"
```

### Biểu thức function

Nếu biểu thức hàm có tên, tên đó được dùng làm thuộc tính `name`.

```js
const someFunction = function someFunctionName() {};
someFunction.name; // "someFunctionName"
```

Các biểu thức hàm ẩn danh, được tạo bằng từ khóa `function` hoặc cú pháp arrow function, có `""` (chuỗi rỗng) làm tên mặc định.

```js
(function () {}).name; // ""
(() => {}).name; // ""
```

Tuy nhiên, những trường hợp như vậy hiếm gặp — thông thường, để gọi hàm ở chỗ khác, biểu thức hàm được liên kết với một định danh. Tên của biểu thức hàm ẩn danh có thể được suy ra trong một số ngữ cảnh cú pháp nhất định, bao gồm: [khai báo biến, phương thức](#variable_declaration_and_method), [giá trị khởi tạo và giá trị mặc định](#initializer_and_default_value).

Một trường hợp thực tế mà tên không thể được suy ra là hàm được trả về từ một hàm khác:

```js
function getFoo() {
  return () => {};
}
getFoo().name; // ""
```

### Khai báo biến và phương thức

Các biến và phương thức có thể suy ra tên của hàm ẩn danh từ vị trí cú pháp của nó.

```js
const f = function () {};
const object = {
  someMethod: function () {},
};

console.log(f.name); // "f"
console.log(object.someMethod.name); // "someMethod"
```

Điều tương tự cũng áp dụng cho phép gán:

```js
let f;
f = () => {};
f.name; // "f"
```

### Giá trị khởi tạo và giá trị mặc định

Các hàm trong phần khởi tạo (giá trị mặc định) của [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#default_value), [tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), [class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields), v.v., sẽ kế thừa tên của định danh được ràng buộc làm `name` của chúng.

```js
const [f = () => {}] = [];
f.name; // "f"

const { someMethod: m = () => {} } = {};
m.name; // "m"

function foo(f = () => {}) {
  console.log(f.name);
}
foo(); // "f"

class Foo {
  static someMethod = () => {};
}
Foo.someMethod.name; // someMethod
```

### Phương thức rút gọn

```js
const o = {
  foo() {},
};
o.foo.name; // "foo";
```

### Hàm đã bind

{{jsxref("Function.prototype.bind()")}} tạo ra một hàm có tên là "bound " cộng với tên hàm.

```js
function foo() {}
foo.bind({}).name; // "bound foo"
```

### Getter và setter

Khi dùng accessor property [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set), "get" hoặc "set" sẽ xuất hiện trong tên hàm.

```js
const o = {
  get foo() {
    return 1;
  },
  set foo(x) {},
};

const descriptor = Object.getOwnPropertyDescriptor(o, "foo");
descriptor.get.name; // "get foo"
descriptor.set.name; // "set foo";
```

### Class

Tên của một class tuân theo cùng thuật toán như khai báo và biểu thức hàm.

```js
class Foo {}
Foo.name; // "Foo"
```

> [!WARNING]
> JavaScript chỉ đặt thuộc tính `name` của hàm nếu hàm đó không có thuộc tính riêng tên là `name`. Tuy nhiên, [static members](/en-US/docs/Web/JavaScript/Reference/Classes/static) của class sẽ được đặt làm thuộc tính riêng của hàm constructor class, và do đó ngăn `name` tích hợp không được áp dụng. Xem [ví dụ](#telling_the_constructor_name_of_an_object) bên dưới.

### Symbol làm tên hàm

Nếu một {{jsxref("Symbol")}} được dùng làm tên hàm và symbol có mô tả, tên phương thức là mô tả đó trong dấu ngoặc vuông.

```js
const sym1 = Symbol("foo");
const sym2 = Symbol();

const o = {
  [sym1]() {},
  [sym2]() {},
};

o[sym1].name; // "[foo]"
o[sym2].name; // "[]"
```

### Trường riêng tư và phương thức riêng tư

Các trường riêng tư và phương thức riêng tư có dấu thăng (`#`) như một phần của tên chúng.

```js
class Foo {
  #field = () => {};
  #method() {}
  getNames() {
    console.log(this.#field.name);
    console.log(this.#method.name);
  }
}

new Foo().getNames();
// "#field"
// "#method"
```

## Ví dụ

### Xác định tên constructor của một đối tượng

Bạn có thể dùng `obj.constructor.name` để kiểm tra "class" của một đối tượng.

```js
function Foo() {} // Or: class Foo {}

const fooInstance = new Foo();
console.log(fooInstance.constructor.name); // "Foo"
```

Tuy nhiên, vì các static member sẽ trở thành thuộc tính riêng của class, chúng ta không thể lấy tên class cho hầu hết mọi class có thuộc tính phương thức static `name()`:

```js
class Foo {
  constructor() {}
  static name() {}
}
```

Với phương thức `static name()`, `Foo.name` không còn giữ tên class thực tế nữa mà là tham chiếu đến đối tượng hàm `name()`. Cố lấy class của `fooInstance` qua `fooInstance.constructor.name` sẽ không cho chúng ta tên class, mà thay vào đó là tham chiếu đến phương thức class static. Ví dụ:

```js
const fooInstance = new Foo();
console.log(fooInstance.constructor.name); // ƒ name() {}
```

Do sự tồn tại của các static field, `name` có thể không phải là hàm.

```js
class Foo {
  static name = 123;
}
console.log(new Foo().constructor.name); // 123
```

Nếu một class có thuộc tính static tên là `name`, nó cũng sẽ trở thành _writable_. Định nghĩa tích hợp khi không có định nghĩa static tùy chỉnh là _read-only_:

```js
Foo.name = "Hello";
console.log(Foo.name); // "Hello" if class Foo has a static "name" property, but "Foo" if not.
```

Do đó bạn không nên dựa vào thuộc tính `name` tích hợp để luôn giữ tên của một class.

### Trình nén và minifier JavaScript

> [!WARNING]
> Hãy cẩn thận khi sử dụng thuộc tính `name` với các phép chuyển đổi mã nguồn, chẳng hạn như những phép chuyển đổi được thực hiện bởi trình nén (minifier) hoặc obfuscator JavaScript. Những công cụ này thường được sử dụng như một phần của pipeline build JavaScript để giảm kích thước chương trình trước khi triển khai lên production. Những phép chuyển đổi như vậy thường thay đổi tên hàm vào thời điểm build.

Mã nguồn như:

```js
function Foo() {}
const foo = new Foo();

if (foo.constructor.name === "Foo") {
  console.log("'foo' is an instance of 'Foo'");
} else {
  console.log("Oops!");
}
```

có thể được nén thành:

```js
function a() {}
const b = new a();
if (b.constructor.name === "Foo") {
  console.log("'foo' is an instance of 'Foo'");
} else {
  console.log("Oops!");
}
```

Trong phiên bản chưa nén, chương trình rơi vào nhánh đúng và in ra "'foo' is an instance of 'Foo'" — trong khi phiên bản nén lại hoạt động khác và rơi vào nhánh else. Nếu bạn dựa vào thuộc tính `name`, như trong ví dụ trên, hãy đảm bảo pipeline build của bạn không thay đổi tên hàm, hoặc đừng giả định rằng một hàm có tên cụ thể nào đó.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill cho `Function: name` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-function)
- [es-shims polyfill của `Function.prototype.name`](https://www.npmjs.com/package/function.prototype.name)
- {{jsxref("Function")}}
