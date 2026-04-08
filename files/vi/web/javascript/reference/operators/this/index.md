---
title: this
slug: Web/JavaScript/Reference/Operators/this
page-type: javascript-language-feature
browser-compat: javascript.operators.this
sidebar: jssidebar
---

Từ khóa **`this`** tham chiếu đến ngữ cảnh mà một đoạn code, chẳng hạn như thân hàm, được dự kiến chạy trong đó. Thông thường nhất, nó được dùng trong các phương thức của đối tượng, trong đó `this` tham chiếu đến đối tượng mà phương thức được gắn vào, do đó cho phép cùng một phương thức được tái sử dụng trên các đối tượng khác nhau.

Giá trị của `this` trong JavaScript phụ thuộc vào cách hàm được gọi ({{glossary("binding")}} tại thời điểm chạy), không phải cách nó được định nghĩa. Khi một hàm thông thường được gọi như phương thức của một đối tượng (`obj.method()`), `this` trỏ đến đối tượng đó. Khi được gọi như hàm độc lập (không được gắn vào đối tượng nào: `func()`), `this` thường tham chiếu đến [global object](/en-US/docs/Glossary/Global_object) (ở chế độ không strict) hoặc `undefined` (ở [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)). Phương thức {{jsxref("Function.prototype.bind()")}} có thể tạo một hàm có ràng buộc `this` không thay đổi, và các phương thức {{jsxref("Function.prototype.apply()")}} và {{jsxref("Function.prototype.call()")}} cũng có thể đặt giá trị `this` cho một lời gọi cụ thể.

[Arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) khác biệt trong cách xử lý `this`: chúng kế thừa `this` từ phạm vi cha tại thời điểm chúng được định nghĩa. Hành vi này làm cho arrow functions đặc biệt hữu ích cho callbacks và bảo toàn ngữ cảnh. Tuy nhiên, arrow functions không có ràng buộc `this` riêng. Do đó, giá trị `this` của chúng không thể được đặt bởi các phương thức `bind()`, `apply()` hoặc `call()`, cũng không trỏ đến đối tượng hiện tại trong các phương thức của đối tượng.

{{InteractiveExample("JavaScript Demo: this expression")}}

```js interactive-example
const test = {
  prop: 42,
  func() {
    return this.prop;
  },
};

console.log(test.func());
// Expected output: 42
```

## Cú pháp

```js-nolint
this
```

### Giá trị

Ở chế độ không strict, `this` luôn là tham chiếu đến đối tượng. Ở strict mode, nó có thể là bất kỳ giá trị nào. Để biết thêm thông tin về cách giá trị được xác định, xem mô tả bên dưới.

## Mô tả

Giá trị của `this` phụ thuộc vào ngữ cảnh mà nó xuất hiện: hàm, class, hoặc global.

### Ngữ cảnh hàm

Bên trong hàm, giá trị của `this` phụ thuộc vào cách hàm được gọi. Hãy nghĩ về `this` như một tham số ẩn của hàm — giống như các tham số được khai báo trong định nghĩa hàm, `this` là một ràng buộc mà ngôn ngữ tạo ra cho bạn khi thân hàm được đánh giá.

Đối với hàm thông thường (không phải arrow function, bound function, v.v.), giá trị của `this` là đối tượng mà hàm được truy cập trên đó. Nói cách khác, nếu lời gọi hàm có dạng `obj.f()`, thì `this` tham chiếu đến `obj`. Ví dụ:

```js
function getThis() {
  return this;
}

const obj1 = { name: "obj1" };
const obj2 = { name: "obj2" };

obj1.getThis = getThis;
obj2.getThis = getThis;

console.log(obj1.getThis()); // { name: 'obj1', getThis: [Function: getThis] }
console.log(obj2.getThis()); // { name: 'obj2', getThis: [Function: getThis] }
```

Lưu ý rằng hàm là như nhau, nhưng dựa trên cách nó được gọi, giá trị của `this` là khác nhau. Điều này tương tự như cách các tham số hàm hoạt động.

Giá trị của `this` không phải là đối tượng có hàm như thuộc tính riêng, mà là đối tượng được dùng để gọi hàm. Bạn có thể chứng minh điều này bằng cách gọi phương thức của đối tượng ở phía trên trong [prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

```js
const obj3 = {
  __proto__: obj1,
  name: "obj3",
};

console.log(obj3.getThis()); // { name: 'obj3' }
```

Giá trị của `this` luôn thay đổi dựa trên cách hàm được gọi, ngay cả khi hàm được định nghĩa trên đối tượng lúc tạo:

```js
const obj4 = {
  name: "obj4",
  getThis() {
    return this;
  },
};

const obj5 = { name: "obj5" };

obj5.getThis = obj4.getThis;
console.log(obj5.getThis()); // { name: 'obj5', getThis: [Function: getThis] }
```

Nếu giá trị mà phương thức được truy cập trên đó là một primitive, `this` cũng sẽ là giá trị primitive — nhưng chỉ khi hàm ở strict mode.

```js
function getThisStrict() {
  "use strict"; // Enter strict mode
  return this;
}

// Only for demonstration — you should not mutate built-in prototypes
Number.prototype.getThisStrict = getThisStrict;
console.log(typeof (1).getThisStrict()); // "number"
```

Nếu hàm được gọi mà không được truy cập trên bất cứ thứ gì, `this` sẽ là `undefined` — nhưng chỉ khi hàm ở strict mode.

```js
console.log(typeof getThisStrict()); // "undefined"
```

Ở chế độ không strict, một quá trình đặc biệt được gọi là [thay thế `this`](/en-US/docs/Web/JavaScript/Reference/Strict_mode#no_this_substitution) đảm bảo rằng giá trị của `this` luôn là một đối tượng. Điều này có nghĩa:

- Nếu hàm được gọi với `this` được đặt thành `undefined` hoặc `null`, `this` được thay thế bằng {{jsxref("globalThis")}}.
- Nếu hàm được gọi với `this` được đặt thành giá trị primitive, `this` được thay thế bằng đối tượng wrapper của giá trị primitive đó.

```js
function getThis() {
  return this;
}

// Only for demonstration — you should not mutate built-in prototypes
Number.prototype.getThis = getThis;
console.log(typeof (1).getThis()); // "object"
console.log(getThis() === globalThis); // true
```

Trong các lời gọi hàm thông thường, `this` được truyền ẩn như một tham số thông qua tiền tố của hàm (phần trước dấu chấm). Bạn cũng có thể đặt giá trị của `this` một cách tường minh bằng các phương thức {{jsxref("Function.prototype.call()")}}, {{jsxref("Function.prototype.apply()")}}, hoặc {{jsxref("Reflect.apply()")}}. Sử dụng {{jsxref("Function.prototype.bind()")}}, bạn có thể tạo một hàm mới với giá trị `this` cụ thể không thay đổi bất kể hàm được gọi như thế nào. Khi dùng các phương thức này, các quy tắc thay thế `this` ở trên vẫn áp dụng nếu hàm là non-strict.

#### Callbacks

Khi một hàm được truyền như callback, giá trị của `this` phụ thuộc vào cách callback được gọi, điều này được xác định bởi người triển khai API. Callbacks _thường_ được gọi với giá trị `this` là `undefined` (gọi trực tiếp mà không gắn vào đối tượng nào), có nghĩa là nếu hàm không phải strict, giá trị của `this` là global object ({{jsxref("globalThis")}}). Đây là trường hợp với [các phương thức mảng lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods), constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise), v.v.

```js
function logThis() {
  "use strict";
  console.log(this);
}

[1, 2, 3].forEach(logThis); // undefined, undefined, undefined
```

Một số API cho phép bạn đặt giá trị `this` cho các lần gọi của callback. Ví dụ, tất cả các phương thức mảng lặp và các phương thức liên quan như {{jsxref("Set.prototype.forEach()")}} đều chấp nhận tham số `thisArg` tùy chọn.

```js
[1, 2, 3].forEach(logThis, { name: "obj" });
// { name: 'obj' }, { name: 'obj' }, { name: 'obj' }
```

Đôi khi, callback được gọi với giá trị `this` khác `undefined`. Ví dụ, tham số `reviver` của {{jsxref("JSON.parse()")}} và tham số `replacer` của {{jsxref("JSON.stringify()")}} đều được gọi với `this` được đặt thành đối tượng mà thuộc tính đang được phân tích/tuần tự hóa thuộc về.

#### Arrow functions

Trong [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), `this` giữ nguyên giá trị `this` của ngữ cảnh từ vựng bao quanh. Nói cách khác, khi đánh giá thân arrow function, ngôn ngữ không tạo ràng buộc `this` mới.

Ví dụ, trong code global, `this` luôn là `globalThis` bất kể strictness, do ràng buộc [global context](#global_context):

```js
const globalObject = this;
const foo = () => this;
console.log(foo() === globalObject); // true
```

Arrow functions tạo [closure](/en-US/docs/Web/JavaScript/Guide/Closures) trên giá trị `this` của phạm vi thực thi bao quanh nó, có nghĩa arrow functions hoạt động như thể chúng "tự động được bind" — bất kể được gọi như thế nào, `this` được bind với giá trị của nó khi hàm được tạo (trong ví dụ trên, global object). Điều tương tự áp dụng cho arrow functions được tạo bên trong các hàm khác: `this` của chúng vẫn là của ngữ cảnh từ vựng bao quanh. [Xem ví dụ bên dưới](#this_in_arrow_functions).

Hơn nữa, khi gọi arrow functions bằng `call()`, `bind()`, hoặc `apply()`, tham số `thisArg` bị bỏ qua. Bạn vẫn có thể truyền các đối số khác bằng các phương thức này.

```js
const obj = { name: "obj" };

// Attempt to set this using call
console.log(foo.call(obj) === globalObject); // true

// Attempt to set this using bind
const boundFoo = foo.bind(obj);
console.log(boundFoo() === globalObject); // true
```

#### Constructors

Khi một hàm được dùng như constructor (với từ khóa {{jsxref("Operators/new", "new")}}), `this` của nó được bind với đối tượng mới đang được tạo, bất kể constructor function được truy cập trên đối tượng nào. Giá trị của `this` trở thành giá trị của biểu thức `new` trừ khi constructor trả về một giá trị không phải primitive khác.

```js
function C() {
  this.a = 37;
}

let o = new C();
console.log(o.a); // 37

function C2() {
  this.a = 37;
  return { a: 38 };
}

o = new C2();
console.log(o.a); // 38
```

Trong ví dụ thứ hai (`C2`), vì một đối tượng được trả về trong quá trình tạo, đối tượng mới mà `this` được bind vào bị loại bỏ. (Điều này về cơ bản làm cho câu lệnh `this.a = 37;` trở thành code chết. Nó không thực sự là code chết vì nó được thực thi, nhưng có thể loại bỏ mà không có tác dụng bên ngoài.)

#### super

Khi một hàm được gọi theo dạng `super.method()`, `this` bên trong hàm `method` có cùng giá trị với giá trị `this` xung quanh lời gọi `super.method()`, và thường không bằng đối tượng mà `super` tham chiếu đến. Điều này là vì `super.method` không phải là truy cập thành viên đối tượng như các trường hợp trên — đây là cú pháp đặc biệt với các quy tắc binding khác nhau. Để xem ví dụ, hãy xem [tài liệu tham chiếu `super`](/en-US/docs/Web/JavaScript/Reference/Operators/super#calling_methods_from_super).

### Ngữ cảnh class

Một [class](/en-US/docs/Web/JavaScript/Reference/Classes) có thể được chia thành hai ngữ cảnh: static và instance. [Constructors](/en-US/docs/Web/JavaScript/Reference/Classes/constructor), các phương thức, và các field initializer của instance ([public](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) hoặc [private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)) thuộc về ngữ cảnh instance. Các phương thức [static](/en-US/docs/Web/JavaScript/Reference/Classes/static), các field initializer static, và [các khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks) thuộc về ngữ cảnh static. Giá trị `this` khác nhau trong mỗi ngữ cảnh.

Class constructors luôn được gọi với `new`, vì vậy hành vi của chúng giống như [function constructors](#constructors): giá trị `this` là instance mới đang được tạo. Các phương thức class hoạt động như các phương thức trong object literals — giá trị `this` là đối tượng mà phương thức được truy cập trên đó. Nếu phương thức không được chuyển sang đối tượng khác, `this` thường là một instance của class.

Các phương thức static không phải thuộc tính của `this`. Chúng là thuộc tính của chính class. Do đó, chúng thường được truy cập trên class, và `this` là giá trị của class (hoặc một subclass). Các khối khởi tạo static cũng được đánh giá với `this` được đặt thành class hiện tại.

Các field initializer cũng được đánh giá trong ngữ cảnh của class. Instance fields được đánh giá với `this` được đặt thành instance đang được tạo. Static fields được đánh giá với `this` được đặt thành class hiện tại. Đó là lý do tại sao arrow functions trong field initializer được [bind với instance cho instance fields và với class cho static fields](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#cannot_be_used_as_methods).

```js
class C {
  instanceField = this;
  static staticField = this;
}

const c = new C();
console.log(c.instanceField === c); // true
console.log(C.staticField === C); // true
```

#### Derived class constructors

Không giống như base class constructors, derived constructors không có ràng buộc `this` ban đầu. Gọi {{jsxref("Operators/super", "super()")}} tạo ràng buộc `this` trong constructor và về cơ bản có tác dụng đánh giá dòng code sau, trong đó `Base` là base class:

```js-nolint
this = new Base();
```

> [!WARNING]
> Tham chiếu đến `this` trước khi gọi `super()` sẽ ném ra lỗi.

Các derived class không được return trước khi gọi `super()`, trừ khi constructor trả về một đối tượng (vì vậy giá trị `this` bị ghi đè) hoặc class không có constructor nào cả.

```js
class Base {}
class Good extends Base {}
class AlsoGood extends Base {
  constructor() {
    return { a: 5 };
  }
}
class Bad extends Base {
  constructor() {}
}

new Good();
new AlsoGood();
new Bad(); // ReferenceError: Must call super constructor in derived class before accessing 'this' or returning from derived constructor
```

### Ngữ cảnh global

Trong ngữ cảnh thực thi global (bên ngoài bất kỳ hàm hoặc class nào; có thể ở bên trong [blocks](/en-US/docs/Web/JavaScript/Reference/Statements/block) hoặc [arrow functions](#arrow_functions) được định nghĩa trong phạm vi global), giá trị `this` phụ thuộc vào ngữ cảnh thực thi mà script chạy trong đó. Giống như [callbacks](#callbacks), giá trị `this` được xác định bởi môi trường runtime (hàm gọi).

Ở cấp độ cao nhất của script, `this` tham chiếu đến {{jsxref("globalThis")}} dù ở strict mode hay không. Điều này thường giống với global object — ví dụ, nếu nguồn được đặt bên trong phần tử HTML [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) và được thực thi như script, `this === window`.

> [!NOTE]
> `globalThis` thường là cùng khái niệm với global object (tức là thêm thuộc tính vào `globalThis` làm chúng thành biến global) — đây là trường hợp với browsers và Node — nhưng các host được phép cung cấp giá trị khác cho `globalThis` không liên quan đến global object.

```js
// In web browsers, the window object is also the global object:
console.log(this === window); // true

this.b = "MDN";
console.log(window.b); // "MDN"
console.log(b); // "MDN"
```

Nếu nguồn được tải như [module](/en-US/docs/Web/JavaScript/Guide/Modules) (đối với HTML, điều này có nghĩa là thêm `type="module"` vào thẻ `<script>`), `this` luôn là `undefined` ở cấp độ cao nhất.

Nếu nguồn được thực thi với [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval), `this` giống với ngữ cảnh bao quanh cho [direct eval](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#direct_and_indirect_eval), hoặc `globalThis` (như thể nó chạy trong một global script riêng biệt) cho indirect eval.

```js
function test() {
  // Direct eval
  console.log(eval("this") === this);
  // Indirect eval, non-strict
  console.log(eval?.("this") === globalThis);
  // Indirect eval, strict
  console.log(eval?.("'use strict'; this") === globalThis);
}

test.call({ name: "obj" }); // Logs 3 "true"
```

Lưu ý rằng một số source code, mặc dù trông giống global scope, thực sự được bọc trong một hàm khi thực thi. Ví dụ, CommonJS modules của Node.js được bọc trong một hàm và được thực thi với giá trị `this` được đặt thành `module.exports`. [Các thuộc tính event handler](#this_in_inline_event_handlers) được thực thi với `this` được đặt thành phần tử chúng được gắn vào.

Object literals không tạo phạm vi `this` — chỉ các hàm (phương thức) được định nghĩa trong đối tượng mới tạo phạm vi đó. Dùng `this` trong object literal kế thừa giá trị từ phạm vi bao quanh.

```js
const obj = {
  a: this,
};

console.log(obj.a === window); // true
```

## Ví dụ

### this trong ngữ cảnh hàm

Giá trị của tham số `this` phụ thuộc vào cách hàm được gọi, không phải cách nó được định nghĩa.

```js
// An object can be passed as the first argument to 'call'
// or 'apply' and 'this' will be bound to it.
const obj = { a: "Custom" };

// Variables declared with var become properties of 'globalThis'.
var a = "Global";

function whatsThis() {
  return this.a; // 'this' depends on how the function is called
}

whatsThis(); // 'Global'; the 'this' parameter defaults to 'globalThis' in non–strict mode
obj.whatsThis = whatsThis;
obj.whatsThis(); // 'Custom'; the 'this' parameter is bound to obj
```

Sử dụng `call()` và `apply()`, bạn có thể truyền giá trị của `this` như thể là một tham số tường minh.

```js
function add(c, d) {
  return this.a + this.b + c + d;
}

const o = { a: 1, b: 3 };

// The first argument is bound to the implicit 'this' parameter; the remaining
// arguments are bound to the named parameters.
add.call(o, 5, 7); // 16

// The first argument is bound to the implicit 'this' parameter; the second
// argument is an array whose members are bound to the named parameters.
add.apply(o, [10, 20]); // 34
```

### this và chuyển đổi đối tượng

Ở chế độ không strict, nếu một hàm được gọi với giá trị `this` không phải đối tượng, giá trị `this` được thay thế bằng đối tượng. `null` và `undefined` trở thành `globalThis`. Các primitive như `7` hoặc `'foo'` được chuyển đổi thành đối tượng bằng constructor liên quan, vì vậy số primitive `7` được chuyển đổi thành đối tượng wrapper class {{jsxref("Number")}} và chuỗi `'foo'` thành class wrapper {{jsxref("String")}}.

```js
function bar() {
  console.log(Object.prototype.toString.call(this));
}

bar.call(7); // [object Number]
bar.call("foo"); // [object String]
bar.call(undefined); // [object Window]
```

### Phương thức bind()

Gọi [`f.bind(someObject)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) tạo một hàm mới với cùng thân và phạm vi như `f`, nhưng giá trị của `this` được bind vĩnh viễn với đối số đầu tiên của `bind`, bất kể hàm được gọi như thế nào.

```js
function f() {
  return this.a;
}

const g = f.bind({ a: "azerty" });
console.log(g()); // azerty

const h = g.bind({ a: "yoo" }); // bind only works once!
console.log(h()); // azerty

const o = { a: 37, f, g, h };
console.log(o.a, o.f(), o.g(), o.h()); // 37 37 azerty azerty
```

### this trong arrow functions

Arrow functions tạo closures trên giá trị `this` của ngữ cảnh thực thi bao quanh. Trong ví dụ sau, chúng ta tạo `obj` với phương thức `getThisGetter` trả về một hàm trả về giá trị của `this`. Hàm được trả về được tạo như arrow function, vì vậy `this` của nó được bind vĩnh viễn với `this` của hàm bao quanh nó. Giá trị của `this` bên trong `getThisGetter` có thể được đặt trong lời gọi, từ đó đặt giá trị trả về của hàm được trả về. Chúng ta sẽ giả định rằng `getThisGetter` là hàm non-strict, có nghĩa là nó được chứa trong script non-strict và không lồng thêm trong class hoặc hàm strict.

```js
const obj = {
  getThisGetter() {
    const getter = () => this;
    return getter;
  },
};
```

Chúng ta có thể gọi `getThisGetter` như phương thức của `obj`, điều này bind `this` với `obj` bên trong thân của nó. Hàm được trả về được gán cho biến `fn`. Bây giờ, khi gọi `fn`, giá trị của `this` được trả về vẫn là giá trị được đặt bởi lời gọi `getThisGetter`, đó là `obj`. Nếu hàm được trả về không phải arrow function, các lời gọi như vậy sẽ khiến giá trị `this` là `globalThis`, vì `getThisGetter` là non-strict.

```js
const fn = obj.getThisGetter();
console.log(fn() === obj); // true
```

Nhưng hãy cẩn thận nếu bạn unbind phương thức của `obj` mà không gọi nó, vì `getThisGetter` vẫn là phương thức có giá trị `this` thay đổi. Gọi `fn2()()` trong ví dụ sau trả về `globalThis`, vì nó theo `this` từ `fn2()`, đó là `globalThis` vì nó được gọi mà không được gắn vào bất kỳ đối tượng nào.

```js
const fn2 = obj.getThisGetter;
console.log(fn2()() === globalThis); // true in non-strict mode
```

Hành vi này rất hữu ích khi định nghĩa callbacks. Thông thường, mỗi biểu thức hàm tạo ràng buộc `this` riêng của nó, che khuất giá trị `this` của phạm vi trên. Bây giờ, bạn có thể định nghĩa các hàm như arrow functions nếu bạn không quan tâm đến giá trị `this`, và chỉ tạo ràng buộc `this` khi bạn cần (ví dụ, trong class methods). Xem [ví dụ với `setTimeout()`](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#using_call_bind_and_apply).

### this với getter hoặc setter

`this` trong getters và setters dựa trên đối tượng mà thuộc tính được truy cập trên đó, không phải đối tượng mà thuộc tính được định nghĩa trên đó. Hàm được dùng như getter hoặc setter có `this` được bind với đối tượng mà thuộc tính đang được đặt hoặc lấy từ đó.

```js
function sum() {
  return this.a + this.b + this.c;
}

const o = {
  a: 1,
  b: 2,
  c: 3,
  get average() {
    return (this.a + this.b + this.c) / 3;
  },
};

Object.defineProperty(o, "sum", {
  get: sum,
  enumerable: true,
  configurable: true,
});

console.log(o.average, o.sum); // 2 6
```

### this trong DOM event handlers

Khi một hàm được dùng như event handler, tham số `this` của nó được bind với phần tử DOM mà listener được đặt trên đó (một số trình duyệt không tuân theo quy ước này cho các listeners được thêm động bằng các phương thức khác ngoài {{domxref("EventTarget/addEventListener", "addEventListener()")}}).

```js
// When called as a listener, turns the related element blue
function bluify(e) {
  // Always true
  console.log(this === e.currentTarget);
  // true when currentTarget and target are the same object
  console.log(this === e.target);
  this.style.backgroundColor = "#A5D9F3";
}

// Get a list of every element in the document
const elements = document.getElementsByTagName("*");

// Add bluify as a click listener so when the
// element is clicked on, it turns blue
for (const element of elements) {
  element.addEventListener("click", bluify);
}
```

### this trong inline event handlers

Khi code được gọi từ [thuộc tính event handler](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes) inline, `this` của nó được bind với phần tử DOM mà listener được đặt trên đó:

```html
<button onclick="alert(this.tagName.toLowerCase());">Show this</button>
```

Alert ở trên hiển thị `button`. Tuy nhiên, lưu ý rằng chỉ có phạm vi ngoài có `this` được bind theo cách này:

```html
<button onclick="alert((function () { return this; })());">
  Show inner this
</button>
```

Trong trường hợp này, tham số `this` của hàm bên trong được bind với `globalThis` (tức là đối tượng mặc định ở chế độ không strict khi `this` không được truyền vào lời gọi).

### Các phương thức được bind trong classes

Giống như các hàm thông thường, giá trị của `this` trong các phương thức phụ thuộc vào cách chúng được gọi. Đôi khi hữu ích khi ghi đè hành vi này để `this` trong các class luôn tham chiếu đến class instance. Để đạt được điều này, bind các phương thức class trong constructor:

```js
class Car {
  constructor() {
    // Bind sayBye but not sayHi to show the difference
    this.sayBye = this.sayBye.bind(this);
  }

  sayHi() {
    console.log(`Hello from ${this.name}`);
  }

  sayBye() {
    console.log(`Bye from ${this.name}`);
  }

  get name() {
    return "Ferrari";
  }
}

class Bird {
  get name() {
    return "Tweety";
  }
}

const car = new Car();
const bird = new Bird();

// The value of 'this' in methods depends on their caller
car.sayHi(); // Hello from Ferrari
bird.sayHi = car.sayHi;
bird.sayHi(); // Hello from Tweety

// For bound methods, 'this' doesn't depend on the caller
bird.sayBye = car.sayBye;
bird.sayBye(); // Bye from Ferrari
```

> [!NOTE]
> Classes luôn ở strict mode. Gọi các phương thức với `this` là undefined sẽ ném ra lỗi nếu phương thức cố gắng truy cập thuộc tính trên `this`.
>
> ```js example-bad
> const carSayHi = car.sayHi;
> carSayHi(); // TypeError because the 'sayHi' method tries to access 'this.name', but 'this' is undefined in strict mode.
> ```

Tuy nhiên, lưu ý rằng các auto-bound methods gặp phải cùng vấn đề như [dùng arrow functions cho class properties](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#cannot_be_used_as_methods): mỗi instance của class sẽ có bản sao riêng của phương thức, điều này tăng mức sử dụng bộ nhớ. Chỉ dùng khi thực sự cần thiết. Bạn cũng có thể mô phỏng triển khai của [`Intl.NumberFormat.prototype.format()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/format#using_format_with_map): định nghĩa thuộc tính như getter trả về hàm bound khi được truy cập và lưu nó lại, để hàm chỉ được tạo một lần và chỉ được tạo khi cần.

### this trong câu lệnh with

Mặc dù các câu lệnh [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with) đã bị deprecated và không có trong strict mode, chúng vẫn đóng vai trò như ngoại lệ với các quy tắc ràng buộc `this` thông thường. Nếu một hàm được gọi trong câu lệnh `with` và hàm đó là thuộc tính của scope object, giá trị `this` được bind với scope object, như thể tiền tố `obj.` tồn tại.

```js
const obj = {
  foo() {
    return this;
  },
};

with (obj) {
  console.log(foo() === obj); // true
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- {{jsxref("globalThis")}}
