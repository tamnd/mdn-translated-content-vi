---
title: Function.prototype.bind()
short-title: bind()
slug: Web/JavaScript/Reference/Global_Objects/Function/bind
page-type: javascript-instance-method
browser-compat: javascript.builtins.Function.bind
sidebar: jsref
---

Phương thức **`bind()`** của các instance {{jsxref("Function")}} tạo ra một hàm mới mà khi được gọi, sẽ gọi hàm này với từ khóa `this` được đặt thành giá trị được cung cấp, cùng với một chuỗi tham số cho trước đứng trước bất kỳ tham số nào được cung cấp khi hàm mới được gọi.

{{InteractiveExample("JavaScript Demo: Function.prototype.bind()", "taller")}}

```js interactive-example
const module = {
  x: 42,
  getX() {
    return this.x;
  },
};

const unboundGetX = module.getX;
console.log(unboundGetX()); // The function gets invoked at the global scope
// Expected output: undefined

const boundGetX = unboundGetX.bind(module);
console.log(boundGetX());
// Expected output: 42
```

## Syntax

```js-nolint
bind(thisArg)
bind(thisArg, arg1)
bind(thisArg, arg1, arg2)
bind(thisArg, arg1, arg2, /* …, */ argN)
```

### Parameters

- `thisArg`
  - : Giá trị được truyền làm tham số `this` cho hàm mục tiêu `func` khi hàm ràng buộc được gọi. Nếu hàm không ở [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) sẽ được thay thế bằng đối tượng toàn cục, và các giá trị nguyên thủy sẽ được chuyển đổi thành object. Giá trị này bị bỏ qua nếu hàm ràng buộc được khởi tạo bằng toán tử {{jsxref("Operators/new", "new")}}.
- `arg1`, …, `argN` {{optional_inline}}
  - : Các tham số được chèn vào trước các tham số được cung cấp cho hàm ràng buộc khi gọi `func`.

### Return value

Một bản sao của hàm đã cho với giá trị `this` được chỉ định và các tham số khởi đầu (nếu có).

## Description

Hàm `bind()` tạo ra một _hàm ràng buộc_ mới. Việc gọi hàm ràng buộc thường dẫn đến việc thực thi hàm mà nó bao bọc, còn gọi là _hàm mục tiêu_. Hàm ràng buộc sẽ lưu trữ các tham số được truyền vào — bao gồm giá trị của `this` và một số tham số đầu tiên — như trạng thái nội bộ của nó. Các giá trị này được lưu trước, thay vì được truyền vào lúc gọi. Bạn có thể hiểu `const boundFn = fn.bind(thisArg, arg1, arg2)` tương đương với `const boundFn = (...restArgs) => fn.call(thisArg, arg1, arg2, ...restArgs)` về mặt tác dụng khi được gọi (nhưng không phải khi `boundFn` được khởi tạo).

Một hàm ràng buộc có thể được ràng buộc thêm bằng cách gọi `boundFn.bind(thisArg, /* more args */)`, tạo ra một hàm ràng buộc khác là `boundFn2`. Giá trị `thisArg` mới bị bỏ qua vì hàm mục tiêu của `boundFn2`, tức là `boundFn`, đã có `this` được ràng buộc. Khi `boundFn2` được gọi, nó sẽ gọi `boundFn`, rồi `boundFn` lại gọi `fn`. Các tham số mà `fn` cuối cùng nhận được, theo thứ tự, là: các tham số được ràng buộc bởi `boundFn`, tham số được ràng buộc bởi `boundFn2`, và các tham số nhận được bởi `boundFn2`.

```js
"use strict"; // prevent `this` from being boxed into the wrapper object

function log(...args) {
  console.log(this, ...args);
}
const boundLog = log.bind("this value", 1, 2);
const boundLog2 = boundLog.bind("new this value", 3, 4);
boundLog2(5, 6); // "this value", 1, 2, 3, 4, 5, 6
```

Một hàm ràng buộc cũng có thể được khởi tạo bằng toán tử {{jsxref("Operators/new", "new")}} nếu hàm mục tiêu của nó có thể được khởi tạo. Làm như vậy tương đương như thể hàm mục tiêu đã được khởi tạo trực tiếp. Các tham số được chèn trước vẫn được cung cấp cho hàm mục tiêu như thường lệ, còn giá trị `this` được cung cấp sẽ bị bỏ qua (vì việc khởi tạo chuẩn bị `this` của chính nó, như được thấy trong các tham số của {{jsxref("Reflect.construct")}}). Nếu hàm ràng buộc được khởi tạo trực tiếp, [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) sẽ là hàm mục tiêu. (Tức là, hàm ràng buộc trong suốt với `new.target`.)

```js
class Base {
  constructor(...args) {
    console.log(new.target === Base);
    console.log(args);
  }
}

const BoundBase = Base.bind(null, 1, 2);

new BoundBase(3, 4); // true, [1, 2, 3, 4]
```

Tuy nhiên, vì hàm ràng buộc không có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype), nó không thể được dùng làm lớp cơ sở cho [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends).

```js example-bad
class Derived extends class {}.bind(null) {}
// TypeError: Class extends value does not have valid prototype property undefined
```

Khi sử dụng hàm ràng buộc ở vế phải của [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof), `instanceof` sẽ tìm đến hàm mục tiêu (được lưu nội bộ trong hàm ràng buộc) và đọc `prototype` của nó thay thế.

```js
class Base {}
const BoundBase = Base.bind(null, 1, 2);
console.log(new Base() instanceof BoundBase); // true
```

Hàm ràng buộc có các thuộc tính sau:

- [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length)
  - : `length` của hàm mục tiêu trừ đi số lượng tham số đang được ràng buộc (không tính tham số `thisArg`), với giá trị tối thiểu là 0.
- [`name`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name)
  - : `name` của hàm mục tiêu có thêm tiền tố `"bound "`.

Hàm ràng buộc cũng kế thừa [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của hàm mục tiêu. Tuy nhiên, nó không có các thuộc tính riêng khác của hàm mục tiêu (chẳng hạn như [thuộc tính static](/en-US/docs/Web/JavaScript/Reference/Classes/static) nếu hàm mục tiêu là một class).

## Examples

### Tạo một hàm ràng buộc

Cách dùng phổ biến nhất của `bind()` là tạo một hàm mà dù được gọi như thế nào, cũng luôn được gọi với một giá trị `this` cụ thể.

Một lỗi phổ biến của lập trình viên JavaScript mới là lấy một phương thức từ một đối tượng, sau đó gọi hàm đó và mong đợi nó sử dụng đối tượng gốc làm `this` (ví dụ, bằng cách dùng phương thức trong code dựa trên callback).

Tuy nhiên, nếu không cẩn thận, đối tượng gốc thường bị mất. Tạo một hàm ràng buộc từ hàm đó, sử dụng đối tượng gốc, sẽ giải quyết gọn gàng vấn đề này:

```js
// Top-level 'this' is bound to 'globalThis' in scripts.
this.x = 9;
const module = {
  x: 81,
  getX() {
    return this.x;
  },
};

// The 'this' parameter of 'getX' is bound to 'module'.
console.log(module.getX()); // 81

const retrieveX = module.getX;
// The 'this' parameter of 'retrieveX' is bound to 'globalThis' in non-strict mode.
console.log(retrieveX()); // 9

// Create a new function 'boundGetX' with the 'this' parameter bound to 'module'.
const boundGetX = retrieveX.bind(module);
console.log(boundGetX()); // 81
```

> [!NOTE]
> Nếu bạn chạy ví dụ này trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), tham số `this` của `retrieveX` sẽ được ràng buộc với `undefined` thay vì `globalThis`, khiến lời gọi `retrieveX()` thất bại.
>
> Nếu bạn chạy ví dụ này trong một ECMAScript module, `this` ở cấp top-level sẽ được ràng buộc với `undefined` thay vì `globalThis`, khiến lệnh gán `this.x = 9` thất bại.
>
> Nếu bạn chạy ví dụ này trong một Node CommonJS module, `this` ở cấp top-level sẽ được ràng buộc với `module.exports` thay vì `globalThis`. Tuy nhiên, tham số `this` của `retrieveX` vẫn được ràng buộc với `globalThis` trong chế độ non-strict và với `undefined` trong chế độ strict. Do đó, trong chế độ non-strict (mặc định), lời gọi `retrieveX()` sẽ trả về `undefined` vì `this.x = 9` đang ghi vào một đối tượng khác (`module.exports`) so với đối tượng mà `getX` đang đọc từ (`globalThis`).

Trên thực tế, một số "phương thức" tích hợp sẵn cũng là các getter trả về các hàm ràng buộc — một ví dụ đáng chú ý là [`Intl.NumberFormat.prototype.format()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/format#using_format_with_map), khi được truy cập, trả về một hàm ràng buộc mà bạn có thể truyền trực tiếp như một callback.

### Hàm được áp dụng một phần

Một cách dùng khác của `bind()` là tạo ra một hàm với các tham số khởi đầu đã được xác định trước.

Các tham số này (nếu có) theo sau giá trị `this` được cung cấp và được chèn vào đầu danh sách tham số của hàm mục tiêu, tiếp theo là các tham số được truyền vào hàm ràng buộc tại thời điểm nó được gọi.

```js
function list(...args) {
  return args;
}

function addArguments(arg1, arg2) {
  return arg1 + arg2;
}

console.log(list(1, 2, 3)); // [1, 2, 3]

console.log(addArguments(1, 2)); // 3

// Create a function with a preset leading argument
const leadingThirtySevenList = list.bind(null, 37);

// Create a function with a preset first argument.
const addThirtySeven = addArguments.bind(null, 37);

console.log(leadingThirtySevenList()); // [37]
console.log(leadingThirtySevenList(1, 2, 3)); // [37, 1, 2, 3]
console.log(addThirtySeven(5)); // 42
console.log(addThirtySeven(5, 10)); // 42
// (the last argument 10 is ignored)
```

### Với setTimeout()

Theo mặc định, trong {{domxref("Window.setTimeout", "setTimeout()")}}, từ khóa `this` sẽ được đặt thành [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis), là {{domxref("window")}} trong trình duyệt. Khi làm việc với các phương thức của class yêu cầu `this` tham chiếu đến các instance của class, bạn có thể ràng buộc tường minh `this` với hàm callback, để duy trì instance.

```js
class LateBloomer {
  constructor() {
    this.petalCount = Math.floor(Math.random() * 12) + 1;
  }
  bloom() {
    // Declare bloom after a delay of 1 second
    setTimeout(this.declare.bind(this), 1000);
  }
  declare() {
    console.log(`I am a beautiful flower with ${this.petalCount} petals!`);
  }
}

const flower = new LateBloomer();
flower.bloom();
// After 1 second, calls 'flower.declare()'
```

Bạn cũng có thể dùng [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) cho mục đích này.

```js
class LateBloomer {
  bloom() {
    // Declare bloom after a delay of 1 second
    setTimeout(() => this.declare(), 1000);
  }
}
```

### Hàm ràng buộc dùng như constructor

Các hàm ràng buộc tự động phù hợp để sử dụng với toán tử {{jsxref("Operators/new", "new")}} để tạo các instance mới từ hàm mục tiêu. Khi hàm ràng buộc được dùng để khởi tạo một giá trị, `this` được cung cấp sẽ bị bỏ qua. Tuy nhiên, các tham số được cung cấp trước vẫn được chèn vào đầu lời gọi constructor.

```js
function Point(x, y) {
  this.x = x;
  this.y = y;
}

Point.prototype.toString = function () {
  return `${this.x},${this.y}`;
};

const p = new Point(1, 2);
p.toString();
// '1,2'

// The thisArg's value doesn't matter because it's ignored
const YAxisPoint = Point.bind(null, 0 /* x */);

const axisPoint = new YAxisPoint(5);
axisPoint.toString(); // '0,5'

axisPoint instanceof Point; // true
axisPoint instanceof YAxisPoint; // true
new YAxisPoint(17, 42) instanceof Point; // true
```

Lưu ý rằng bạn không cần làm gì đặc biệt để tạo hàm ràng buộc để dùng với {{jsxref("Operators/new", "new")}}. [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target), [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof), [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), v.v. đều hoạt động như mong đợi, như thể constructor chưa bao giờ bị ràng buộc. Sự khác biệt duy nhất là nó không thể dùng cho [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) nữa.

Hệ quả là bạn cũng không cần làm gì đặc biệt để tạo hàm ràng buộc chỉ để gọi thông thường, ngay cả khi bạn muốn yêu cầu hàm ràng buộc chỉ được gọi bằng {{jsxref("Operators/new", "new")}}. Nếu bạn gọi nó mà không có `new`, giá trị `this` đã ràng buộc bỗng dưng không bị bỏ qua nữa.

```js
const emptyObj = {};
const YAxisPoint = Point.bind(emptyObj, 0 /* x */);

// Can still be called as a normal function
// (although usually this is undesirable)
YAxisPoint(13);

// The modifications to `this` is now observable from the outside
console.log(emptyObj); // { x: 0, y: 13 }
```

Nếu bạn muốn hạn chế hàm ràng buộc chỉ có thể gọi được với {{jsxref("Operators/new", "new")}}, hoặc chỉ gọi được mà không có `new`, hàm mục tiêu phải áp đặt hạn chế đó, chẳng hạn bằng cách kiểm tra `new.target !== undefined` hoặc dùng [class](/en-US/docs/Web/JavaScript/Reference/Classes) thay thế.

### Ràng buộc các class

Dùng `bind()` trên các class sẽ giữ nguyên hầu hết ngữ nghĩa của class, ngoại trừ tất cả các thuộc tính static riêng của class hiện tại sẽ bị mất. Tuy nhiên, vì chuỗi prototype được bảo toàn, bạn vẫn có thể truy cập các thuộc tính static kế thừa từ lớp cha.

```js
class Base {
  static baseProp = "base";
}

class Derived extends Base {
  static derivedProp = "derived";
}

const BoundDerived = Derived.bind(null);
console.log(BoundDerived.baseProp); // "base"
console.log(BoundDerived.derivedProp); // undefined
console.log(new BoundDerived() instanceof Derived); // true
```

### Chuyển đổi phương thức thành hàm tiện ích

`bind()` cũng hữu ích trong các trường hợp bạn muốn chuyển một phương thức yêu cầu giá trị `this` cụ thể thành một hàm tiện ích thông thường nhận tham số `this` trước đây như một tham số thông thường. Điều này tương tự như cách các hàm tiện ích đa năng hoạt động: thay vì gọi `array.map(callback)`, bạn dùng `map(array, callback)`, cho phép bạn dùng `map` với các đối tượng giống mảng không phải mảng (ví dụ, [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments)) mà không làm thay đổi `Object.prototype`.

Lấy {{jsxref("Array.prototype.slice()")}} làm ví dụ, bạn muốn dùng nó để chuyển đổi một đối tượng giống mảng thành mảng thực sự. Bạn có thể tạo một shortcut như thế này:

```js
const slice = Array.prototype.slice;

// …

slice.call(arguments);
```

Lưu ý rằng bạn không thể lưu `slice.call` và gọi nó như một hàm thông thường, vì phương thức `call()` cũng đọc giá trị `this` của nó, tức là hàm mà nó cần gọi. Trong trường hợp này, bạn có thể dùng `bind()` để ràng buộc giá trị `this` cho `call()`. Trong đoạn code sau, `slice()` là phiên bản ràng buộc của {{jsxref("Function.prototype.call()")}}, với giá trị `this` được ràng buộc với {{jsxref("Array.prototype.slice()")}}. Điều này có nghĩa là các lời gọi `call()` bổ sung có thể được loại bỏ:

```js
// Same as "slice" in the previous example
const unboundSlice = Array.prototype.slice;
const slice = Function.prototype.call.bind(unboundSlice);

// …

slice(arguments);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Function.prototype.bind` in `core-js`](https://github.com/zloirock/core-js#ecmascript-function)
- {{jsxref("Function.prototype.apply()")}}
- {{jsxref("Function.prototype.call()")}}
- {{jsxref("Functions", "Functions", "", 1)}}
