---
title: export
slug: Web/JavaScript/Reference/Statements/export
page-type: javascript-statement
browser-compat: javascript.statements.export
sidebar: jssidebar
---

Khai báo **`export`** được sử dụng để xuất các giá trị từ một module JavaScript. Các giá trị được xuất sau đó có thể được nhập vào các chương trình khác bằng khai báo {{jsxref("Statements/import", "import")}} hoặc [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import). Giá trị của một binding được nhập có thể thay đổi trong module xuất nó — khi một module cập nhật giá trị của một binding mà nó xuất, bản cập nhật sẽ hiển thị trong giá trị được nhập của nó.

Để sử dụng khai báo `export` trong một tệp nguồn, tệp đó phải được runtime hiểu là một [module](/en-US/docs/Web/JavaScript/Guide/Modules). Trong HTML, điều này được thực hiện bằng cách thêm `type="module"` vào thẻ {{HTMLElement("script")}}, hoặc bằng cách được nhập bởi một module khác. Các module được tự động diễn giải trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Cú pháp

```js-nolint
// Exporting declarations
export let name1, name2/*, … */; // also var
export const name1 = 1, name2 = 2/*, … */; // also var, let
export function functionName() { /* … */ }
export class ClassName { /* … */ }
export function* generatorFunctionName() { /* … */ }
export const { name1, name2: bar } = o;
export const [ name1, name2 ] = array;

// Export list
export { name1, /* …, */ nameN };
export { variable1 as name1, variable2 as name2, /* …, */ nameN };
export { variable1 as "string name" };
export { name1 as default /*, … */ };

// Default exports
export default expression;
export default function functionName() { /* … */ }
export default class ClassName { /* … */ }
export default function* generatorFunctionName() { /* … */ }
export default function () { /* … */ }
export default class { /* … */ }
export default function* () { /* … */ }

// Aggregating modules
export * from "module-name";
export * as name1 from "module-name";
export { name1, /* …, */ nameN } from "module-name";
export { import1 as name1, import2 as name2, /* …, */ nameN } from "module-name";
export { default, /* …, */ } from "module-name";
export { default as name1 } from "module-name";
```

- `nameN`
  - : Định danh cần xuất (để có thể nhập thông qua {{jsxref("Statements/import", "import")}} trong script khác). Nếu bạn dùng bí danh với `as`, tên export thực tế có thể được chỉ định dưới dạng string literal, có thể không phải là định danh hợp lệ.

## Mô tả

Mỗi module có thể có hai loại export khác nhau, _named export_ và _default export_. Bạn có thể có nhiều named export mỗi module nhưng chỉ một default export. Mỗi loại tương ứng với một trong các cú pháp trên.

Named export:

```js
// export features declared elsewhere
export { myFunction2, myVariable2 };

// export individual features (can export var, let,
// const, function, class)
export let myVariable = Math.sqrt(2);
export function myFunction() {
  // …
}
```

Sau từ khóa `export`, bạn có thể sử dụng khai báo `let`, `const`, và `var`, cũng như khai báo hàm hoặc class. Bạn cũng có thể sử dụng cú pháp `export { name1, name2 }` để xuất danh sách các tên được khai báo ở nơi khác. Lưu ý rằng `export {}` không xuất một đối tượng rỗng — đây là khai báo no-op không xuất gì (danh sách tên rỗng).

Bạn không thể sử dụng `export` trên khai báo {{jsxref("Statements/using", "using")}} hoặc {{jsxref("Statements/await_using", "await using")}}. Tuy nhiên, bạn có thể xuất một biến đã được khai báo ở nơi khác bằng `using` hoặc `await using`. Làm như vậy vẫn bị khuyến cáo mạnh mẽ là không nên, vì biến sẽ bị giải phóng ngay khi module hoàn thành thực thi, khiến tất cả các importer nhận được giá trị đã bị giải phóng.

```js-nolint example-bad
export using resource1 = getResource(); // SyntaxError

// Allowed by syntax but discouraged
using resource2 = getResource();
export { resource2 };
```

Khai báo export không chịu tác động của quy tắc [temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz). Bạn có thể khai báo rằng module xuất `X` trước khi bản thân tên `X` được khai báo.

```js
export { x };
const x = 1;
// This works, because `export` is only a declaration, but doesn't
// utilize the value of `x`.
```

Default export:

```js
// export feature declared elsewhere as default
export { myFunction as default };
// This is equivalent to:
export default myFunction;

// export individual features as default
export default function () { /* … */ }
export default class { /* … */ }
```

> [!NOTE]
> Các tên dùng trong khai báo export phải khác nhau. Việc có các export trùng tên hoặc sử dụng nhiều hơn một `default` export sẽ dẫn đến {{jsxref("SyntaxError")}} và ngăn module được đánh giá.

Cú pháp `export default` cho phép bất kỳ biểu thức nào.

```js
export default 1 + 1;
```

Như một trường hợp đặc biệt, hàm và class được xuất dưới dạng _khai báo_, không phải biểu thức, và các khai báo này có thể ẩn danh. Điều này có nghĩa là các hàm sẽ được hoisted.

```js
// Works because `foo` is a function declaration,
// not a function expression
foo();

export default function foo() {
  console.log("Hi");
}

// It's still technically a declaration, but it's allowed
// to be anonymous
export default function () {
  console.log("Hi");
}
```

Named export hữu ích khi bạn cần xuất nhiều giá trị. Khi nhập module này, named export phải được tham chiếu bằng cùng tên chính xác (có thể đổi tên bằng `as`), nhưng default export có thể được nhập với bất kỳ tên nào. Ví dụ:

```js
// file test.js
const k = 12;
export default k;
```

```js
// some other file
import m from "./test"; // note that we have the freedom to use import m instead of import k, because k was default export

console.log(m); // 12
```

Bạn cũng có thể đổi tên named export để tránh xung đột tên:

```js
export { myFunction as function1, myVariable as variable };
```

Bạn có thể đổi tên thành một thứ không phải là định danh hợp lệ bằng cách dùng string literal. Ví dụ:

```js
export { myFunction as "my-function" };
```

### Re-export / Tổng hợp

Một module cũng có thể "chuyển tiếp" các giá trị được xuất từ các module khác mà không cần viết hai câu lệnh import/export riêng biệt. Điều này thường hữu ích khi tạo một module duy nhất tập trung nhiều export từ nhiều module khác nhau (thường được gọi là "barrel module").

Điều này có thể đạt được bằng cú pháp "export from":

```js
export { default as function1, function2 } from "bar.js";
```

Tương đương với sự kết hợp của import và export, ngoại trừ `function1` và `function2` không có sẵn bên trong module hiện tại:

```js
import { default as function1, function2 } from "bar.js";

export { function1, function2 };
```

Hầu hết các cú pháp "import from" đều có cú pháp "export from" tương ứng.

```js
export { x } from "mod";
export { x as v } from "mod";
export * as ns from "mod";
```

Cũng có `export * from "mod"`, mặc dù không có `import * from "mod"`. Điều này re-export tất cả các **named** export từ `mod` dưới dạng named export của module hiện tại, nhưng default export của `mod` không được re-export. Nếu có hai câu lệnh wildcard export ngầm định re-export cùng một tên, thì không tên nào được re-export.

```js
// -- mod1.js --
export const a = 1;

// -- mod2.js --
export const a = 3;

// -- barrel.js --
export * from "./mod1.js";
export * from "./mod2.js";

// -- main.js --
import * as ns from "./barrel.js";

console.log(ns.a); // undefined
```

Cố gắng nhập trực tiếp tên trùng lặp sẽ ném ra lỗi.

```js
import { a } from "./barrel.js";
// SyntaxError: The requested module './barrel.js' contains conflicting star exports for name 'a'
```

Sau đây không hợp lệ về mặt cú pháp mặc dù có import tương đương:

```js-nolint example-bad
export DefaultExport from "bar.js"; // Invalid
```

Cách đúng để làm điều này là đổi tên export:

```js
export { default as DefaultExport } from "bar.js";
```

Cú pháp "export from" cho phép bỏ qua token `as`, điều đó làm cho default export vẫn được re-export dưới dạng default export.

```js
export { default, function2 } from "bar.js";
```

`export from` hỗ trợ tất cả các tính năng mà `import` hỗ trợ — ví dụ: [thuộc tính import](/en-US/docs/Web/JavaScript/Reference/Statements/import/with):

```js
export { default } from "./data.json" with { type: "json" };
```

## Ví dụ

### Sử dụng named export

Trong một module `my-module.js`, chúng ta có thể bao gồm code sau:

```js
// module "my-module.js"
function cube(x) {
  return x * x * x;
}

const foo = Math.PI + Math.SQRT2;

const graph = {
  options: {
    color: "white",
    thickness: "2px",
  },
  draw() {
    console.log("From graph draw function");
  },
};

export { cube, foo, graph };
```

Sau đó, trong module cấp cao nhất được bao gồm trong trang HTML, chúng ta có thể có:

```js
import { cube, foo, graph } from "./my-module.js";

graph.options = {
  color: "blue",
  thickness: "3px",
};

graph.draw(); // Logs "From graph draw function"
console.log(cube(3)); // 27
console.log(foo); // 4.555806215962888
```

Điều quan trọng cần lưu ý là:

- Bạn cần bao gồm script này trong HTML với phần tử {{HTMLElement("script")}} có `type="module"`, để nó được nhận dạng là module và xử lý phù hợp.
- Bạn không thể chạy JS module thông qua URL `file://` — bạn sẽ gặp lỗi [CORS](/en-US/docs/Web/HTTP/Guides/CORS). Bạn cần chạy nó thông qua máy chủ HTTP.

### Sử dụng default export

Nếu chúng ta muốn xuất một giá trị duy nhất đại diện cho toàn bộ module, chúng ta có thể sử dụng default export:

```js
// module "cube.js"

export default function cube(x) {
  return x * x * x;
}
```

Sau đó, trong một script khác, việc nhập default export rất đơn giản:

```js
import cube from "./cube.js";

console.log(cube(3)); // 27
```

### Sử dụng export from

Hãy xem một ví dụ nơi chúng ta có cấu trúc phân cấp sau:

- `childModule1.js`: xuất `myFunction` và `myVariable`
- `childModule2.js`: xuất `MyClass`
- `parentModule.js`: hoạt động như một aggregator (và không làm gì khác)
- module cấp cao nhất: tiêu thụ các export của `parentModule.js`

Đây là giao diện của nó khi dùng các đoạn code:

```js
// In childModule1.js
function myFunction() {
  console.log("Hello!");
}
const myVariable = 1;
export { myFunction, myVariable };
```

```js
// In childModule2.js
class MyClass {
  constructor(x) {
    this.x = x;
  }
}

export { MyClass };
```

```js
// In parentModule.js
// Only aggregating the exports from childModule1 and childModule2
// to re-export them
export { myFunction, myVariable } from "childModule1.js";
export { MyClass } from "childModule2.js";
```

```js
// In top-level module
// We can consume the exports from a single module since parentModule
// "collected"/"bundled" them in a single source
import { myFunction, myVariable, MyClass } from "parentModule.js";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/import", "import")}}
- Hướng dẫn [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules)
- [ES6 in Depth: Modules](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/) on hacks.mozilla.org (2015)
- [ES modules: A cartoon deep-dive](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) on hacks.mozilla.org (2018)
- [Exploring JS, Ch.16: Modules](https://exploringjs.com/es6/ch_modules.html) by Dr. Axel Rauschmayer
