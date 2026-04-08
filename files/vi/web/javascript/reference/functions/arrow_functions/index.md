---
title: Arrow function expressions
slug: Web/JavaScript/Reference/Functions/Arrow_functions
page-type: javascript-language-feature
browser-compat: javascript.functions.arrow_functions
sidebar: jssidebar
---

**Biểu thức hàm mũi tên** (arrow function) là một cách viết hàm gọn hơn so với [biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function) truyền thống, với một số điểm khác biệt về ngữ nghĩa và những hạn chế nhất định trong cách sử dụng:

- Hàm mũi tên không có {{Glossary("binding", "ràng buộc")}} riêng với [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments), hay [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super), và không nên được dùng làm [phương thức](/en-US/docs/Glossary/Method).
- Hàm mũi tên không thể dùng làm [hàm tạo (constructor)](/en-US/docs/Glossary/Constructor). Gọi chúng với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) sẽ ném ra lỗi {{jsxref("TypeError")}}. Chúng cũng không có quyền truy cập vào từ khóa [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target).
- Hàm mũi tên không thể dùng [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield) bên trong thân hàm và không thể được tạo ra dưới dạng hàm generator.

{{InteractiveExample("JavaScript Demo: Arrow function expressions")}}

```js interactive-example
const materials = ["Hydrogen", "Helium", "Lithium", "Beryllium"];

console.log(materials.map((material) => material.length));
// Expected output: Array [8, 6, 7, 9]
```

## Cú pháp

```js-nolint
() => expression

param => expression

(param) => expression

(param1, paramN) => expression

() => {
  statements
}

param => {
  statements
}

(param1, paramN) => {
  statements
}
```

[Tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), [tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), và [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) trong danh sách tham số đều được hỗ trợ, nhưng luôn cần có dấu ngoặc đơn:

```js-nolint
(a, b, ...r) => expression
(a = 400, b = 20, c) => expression
([a, b] = [10, 20]) => expression
({ a, b } = { a: 10, b: 20 }) => expression
```

Hàm mũi tên có thể là [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) bằng cách thêm từ khóa `async` vào trước biểu thức.

```js-nolint
async param => expression
async (param1, param2, ...paramN) => {
  statements
}
```

## Mô tả

Hãy cùng phân tích một hàm ẩn danh truyền thống xuống dạng hàm mũi tên đơn giản nhất từng bước một. Mỗi bước đều là một hàm mũi tên hợp lệ.

> [!NOTE]
> Biểu thức hàm truyền thống và hàm mũi tên có nhiều điểm khác biệt hơn chỉ là cú pháp. Chúng ta sẽ giới thiệu chi tiết hơn về sự khác biệt trong hành vi ở các mục tiếp theo.

```js-nolint
// Hàm ẩn danh truyền thống
(function (a) {
  return a + 100;
});

// 1. Xóa từ khóa "function" và đặt mũi tên giữa tham số và dấu ngoặc nhọn mở thân hàm
(a) => {
  return a + 100;
};

// 2. Xóa dấu ngoặc nhọn thân hàm và từ khóa "return" — giá trị trả về là ẩn
(a) => a + 100;

// 3. Xóa dấu ngoặc đơn quanh tham số
a => a + 100;
```

Trong ví dụ trên, cả dấu ngoặc đơn quanh tham số lẫn dấu ngoặc nhọn quanh thân hàm đều có thể bỏ qua. Tuy nhiên, chúng chỉ có thể bỏ qua trong một số trường hợp nhất định.

Dấu ngoặc đơn chỉ có thể bỏ qua khi hàm có đúng một tham số đơn giản. Nếu có nhiều tham số, không có tham số, hoặc dùng tham số mặc định, destructuring hay rest, thì dấu ngoặc đơn quanh danh sách tham số là bắt buộc.

```js
// Hàm ẩn danh truyền thống
(function (a, b) {
  return a + b + 100;
});

// Hàm mũi tên
(a, b) => a + b + 100;

const a = 4;
const b = 2;

// Hàm ẩn danh truyền thống (không có tham số)
(function () {
  return a + b + 100;
});

// Hàm mũi tên (không có tham số)
() => a + b + 100;
```

Dấu ngoặc nhọn chỉ có thể bỏ qua khi hàm trực tiếp trả về một biểu thức. Nếu thân hàm có nhiều câu lệnh, dấu ngoặc nhọn là bắt buộc. Trong trường hợp đó, giá trị trả về phải được khai báo tường minh bằng từ khóa `return`. Hàm mũi tên không thể tự đoán bạn muốn trả về gì hay khi nào.

```js
// Hàm ẩn danh truyền thống
(function (a, b) {
  const chuck = 42;
  return a + b + chuck;
});

// Hàm mũi tên
(a, b) => {
  const chuck = 42;
  return a + b + chuck;
};
```

Hàm mũi tên vốn không gắn liền với một tên cụ thể. Nếu hàm mũi tên cần tự gọi chính nó, hãy dùng biểu thức hàm có tên thay thế. Bạn cũng có thể gán hàm mũi tên cho một biến để tham chiếu đến nó qua biến đó.

```js
// Hàm thông thường
function bob(a) {
  return a + 100;
}

// Hàm mũi tên
const bob2 = (a) => a + 100;
```

### Thân hàm

Hàm mũi tên có thể có _thân biểu thức_ hoặc _thân khối_ thông thường.

Trong thân biểu thức, chỉ có một biểu thức duy nhất, và đây sẽ là giá trị trả về ẩn. Thân khối tương tự như thân hàm truyền thống, nơi giá trị trả về phải được khai báo tường minh bằng từ khóa `return`. Hàm mũi tên không bắt buộc phải trả về giá trị. Nếu luồng thực thi trong thân khối kết thúc mà không gặp câu lệnh `return`, hàm sẽ trả về `undefined` như các hàm thông thường khác.

```js
// Thân biểu thức
const add = (a, b) => a + b; // Trả về ẩn a + b

// Thân khối
const add2 = (a, b) => {
  console.log(a, b);
  return a + b; // Phải trả về tường minh
};

// Không có giá trị trả về
const add3 = (b) => {
  a += b;
  // Không có câu lệnh return, nên trả về undefined
};
```

Trả về object literal dùng cú pháp thân biểu thức `(params) => { object: literal }` không hoạt động như mong đợi.

```js-nolint example-bad
const func = () => { foo: 1 };
// Gọi func() trả về undefined!

const func2 = () => { foo: function () {} };
// SyntaxError: function statement requires a name

const func3 = () => { foo() {} };
// SyntaxError: Unexpected token '{'
```

Đây là vì JavaScript chỉ coi hàm mũi tên có thân biểu thức khi token theo sau mũi tên không phải dấu ngoặc nhọn mở, nên đoạn code trong dấu ngoặc nhọn ({}) sẽ được phân tích cú pháp như một chuỗi câu lệnh, trong đó `foo` là một [nhãn (label)](/en-US/docs/Web/JavaScript/Reference/Statements/label) chứ không phải khóa trong object literal.

Để khắc phục điều này, hãy bao object literal trong dấu ngoặc đơn:

```js example-good
const func = () => ({ foo: 1 });
```

### Không thể dùng làm phương thức

Biểu thức hàm mũi tên chỉ nên được dùng cho các hàm không phải phương thức vì chúng không có `this` riêng. Hãy xem điều gì xảy ra khi ta thử dùng chúng làm phương thức:

```js
"use strict";

const obj = {
  i: 10,
  b: () => console.log(this.i, this),
  c() {
    console.log(this.i, this);
  },
};

obj.b(); // logs undefined, Window { /* … */ } (hoặc đối tượng toàn cục)
obj.c(); // logs 10, Object { /* … */ }
```

Một ví dụ khác liên quan đến {{jsxref("Object.defineProperty()")}}:

```js
"use strict";

const obj = {
  a: 10,
};

Object.defineProperty(obj, "b", {
  get: () => {
    console.log(this.a, typeof this.a, this); // undefined 'undefined' Window { /* … */ } (hoặc đối tượng toàn cục)
    return this.a + 10; // đại diện cho đối tượng toàn cục 'Window', do đó 'this.a' trả về 'undefined'
  },
});
```

Vì thân [class](/en-US/docs/Web/JavaScript/Reference/Classes) có ngữ cảnh `this`, hàm mũi tên dùng làm [class field](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) sẽ đóng gói (close over) ngữ cảnh `this` của class, và `this` bên trong thân hàm mũi tên sẽ trỏ đúng đến instance (hoặc bản thân class, với [static field](/en-US/docs/Web/JavaScript/Reference/Classes/static)). Tuy nhiên, vì đây là một [closure](/en-US/docs/Web/JavaScript/Guide/Closures), chứ không phải ràng buộc riêng của hàm, giá trị của `this` sẽ không thay đổi theo ngữ cảnh thực thi.

```js
class C {
  a = 1;
  autoBoundMethod = () => {
    console.log(this.a);
  };
}

const c = new C();
c.autoBoundMethod(); // 1
const { autoBoundMethod } = c;
autoBoundMethod(); // 1
// Nếu là phương thức thông thường, kết quả sẽ là undefined trong trường hợp này
```

Thuộc tính hàm mũi tên thường được gọi là "phương thức tự ràng buộc" (auto-bound methods), vì cách tương đương với phương thức thông thường là:

```js
class C {
  a = 1;
  constructor() {
    this.method = this.method.bind(this);
  }
  method() {
    console.log(this.a);
  }
}
```

> [!NOTE]
> Class field được định nghĩa trên _instance_, không phải trên _prototype_, nên mỗi lần tạo instance sẽ tạo ra một tham chiếu hàm mới và cấp phát một closure mới, có thể dẫn đến tốn nhiều bộ nhớ hơn so với phương thức thông thường không ràng buộc.

Vì lý do tương tự, các phương thức [`call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call), [`apply()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply), và [`bind()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) không có tác dụng khi gọi trên hàm mũi tên, vì hàm mũi tên xác định `this` dựa trên phạm vi nơi nó được định nghĩa, và giá trị `this` không thay đổi theo cách gọi hàm.

### Không ràng buộc arguments

Hàm mũi tên không có đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) riêng. Vì vậy, trong ví dụ này, `arguments` là tham chiếu đến arguments của phạm vi bao ngoài:

```js
function foo(n) {
  const f = () => arguments[0] + n; // ràng buộc arguments ẩn của foo. arguments[0] là n
  return f();
}

foo(3); // 3 + 3 = 6
```

Trong hầu hết các trường hợp, sử dụng [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) là một giải pháp thay thế tốt cho việc dùng đối tượng `arguments`.

```js
function foo(n) {
  const f = (...args) => args[0] + n;
  return f(10);
}

foo(1); // 11
```

### Không thể dùng làm constructor

Hàm mũi tên không thể dùng làm constructor và sẽ ném ra lỗi khi gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Chúng cũng không có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype).

```js
const Foo = () => {};
const foo = new Foo(); // TypeError: Foo is not a constructor
console.log("prototype" in Foo); // false
```

### Không thể dùng làm generator

Từ khóa [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield) không thể dùng trong thân hàm mũi tên (trừ khi dùng trong các hàm generator lồng bên trong hàm mũi tên). Do đó, hàm mũi tên không thể dùng làm generator.

### Ngắt dòng trước mũi tên

Hàm mũi tên không thể có ngắt dòng giữa các tham số và mũi tên.

```js-nolint example-bad
const func = (a, b, c)
  => 1;
// SyntaxError: Unexpected token '=>'
```

Để định dạng mã nguồn, bạn có thể đặt ngắt dòng sau mũi tên hoặc dùng dấu ngoặc đơn/ngoặc nhọn quanh thân hàm, như minh họa dưới đây. Bạn cũng có thể đặt ngắt dòng giữa các tham số.

```js-nolint
const func = (a, b, c) =>
  1;

const func2 = (a, b, c) => (
  1
);

const func3 = (a, b, c) => {
  return 1;
};

const func4 = (
  a,
  b,
  c,
) => 1;
```

### Độ ưu tiên của mũi tên

Mặc dù mũi tên trong hàm mũi tên không phải là toán tử, hàm mũi tên có các quy tắc phân tích cú pháp đặc biệt tương tác khác với [độ ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) so với hàm thông thường.

```js-nolint example-bad
let callback;

callback = callback || () => {};
// SyntaxError: invalid arrow-function arguments
```

Vì `=>` có độ ưu tiên thấp hơn hầu hết các toán tử, cần có dấu ngoặc đơn để tránh `callback || ()` bị phân tích cú pháp như danh sách đối số của hàm mũi tên.

```js example-good
callback = callback || (() => {});
```

## Ví dụ

### Sử dụng hàm mũi tên

```js
// Hàm mũi tên rỗng trả về undefined
const empty = () => {};

(() => "foobar")();
// Trả về "foobar"
// (đây là Biểu thức Hàm Được Gọi Ngay lập tức - IIFE)

const simple = (a) => (a > 15 ? 15 : a);
simple(16); // 15
simple(10); // 10

const max = (a, b) => (a > b ? a : b);

// Lọc, ánh xạ mảng dễ dàng, v.v.
const arr = [5, 6, 13, 0, 1, 18, 23];

const sum = arr.reduce((a, b) => a + b);
// 66

const even = arr.filter((v) => v % 2 === 0);
// [6, 0, 18]

const double = arr.map((v) => v * 2);
// [10, 12, 26, 0, 2, 36, 46]

// Chuỗi promise gọn gàng hơn
promise
  .then((a) => {
    // …
  })
  .then((b) => {
    // …
  });

// Hàm mũi tên không có tham số
setTimeout(() => {
  console.log("I happen sooner");
  setTimeout(() => {
    // deeper code
    console.log("I happen later");
  }, 1);
}, 1);
```

### Sử dụng call, bind, và apply

Các phương thức [`call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call), [`apply()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply), và [`bind()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) hoạt động như mong đợi với hàm truyền thống, vì ta xác định phạm vi cho mỗi phương thức:

```js
const obj = {
  num: 100,
};

// Đặt "num" trên globalThis để thấy nó KHÔNG được dùng.
globalThis.num = 42;

// Hàm truyền thống để thao tác trên "this"
function add(a, b, c) {
  return this.num + a + b + c;
}

console.log(add.call(obj, 1, 2, 3)); // 106
console.log(add.apply(obj, [1, 2, 3])); // 106
const boundAdd = add.bind(obj);
console.log(boundAdd(1, 2, 3)); // 106
```

Với hàm mũi tên, vì hàm `add` được tạo ra thực chất trong phạm vi `globalThis` (toàn cục), nó sẽ coi `this` là `globalThis`.

```js
const obj = {
  num: 100,
};

// Đặt "num" trên globalThis để thấy nó được lấy ra.
globalThis.num = 42;

// Hàm mũi tên
const add = (a, b, c) => this.num + a + b + c;

console.log(add.call(obj, 1, 2, 3)); // 48
console.log(add.apply(obj, [1, 2, 3])); // 48
const boundAdd = add.bind(obj);
console.log(boundAdd(1, 2, 3)); // 48
```

Lợi ích lớn nhất của việc dùng hàm mũi tên có lẽ là với các phương thức như {{domxref("Window.setTimeout", "setTimeout()")}} và {{domxref("EventTarget.addEventListener()", "EventTarget.prototype.addEventListener()")}} — những phương thức thường cần một loại closure, `call()`, `apply()`, hoặc `bind()` nào đó để đảm bảo hàm được thực thi trong phạm vi đúng.

Với biểu thức hàm truyền thống, đoạn code như này không hoạt động như mong đợi:

```js
const obj = {
  count: 10,
  doSomethingLater() {
    setTimeout(function () {
      // hàm thực thi trong phạm vi window
      this.count++;
      console.log(this.count);
    }, 300);
  },
};

obj.doSomethingLater(); // logs "NaN", vì thuộc tính "count" không có trong phạm vi window.
```

Với hàm mũi tên, phạm vi `this` được giữ nguyên dễ dàng hơn:

```js
const obj = {
  count: 10,
  doSomethingLater() {
    // Cú pháp phương thức ràng buộc "this" với ngữ cảnh "obj".
    setTimeout(() => {
      // Vì hàm mũi tên không có ràng buộc riêng và
      // setTimeout (khi gọi như một hàm) cũng không tạo ràng buộc,
      // ngữ cảnh "obj" của phương thức bên ngoài được sử dụng.
      this.count++;
      console.log(this.count);
    }, 300);
  },
};

obj.doSomethingLater(); // logs 11
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Statements/function", "function")}}
- [Biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- [ES6 In Depth: Arrow functions](https://hacks.mozilla.org/2015/06/es6-in-depth-arrow-functions/) trên hacks.mozilla.org (2015)
