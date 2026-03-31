---
title: "ReferenceError: can't access lexical declaration 'X' before initialization"
slug: Web/JavaScript/Reference/Errors/Cant_access_lexical_declaration_before_init
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't access lexical declaration 'X' before initialization" xảy ra khi một biến từ vựng được truy cập trước khi nó được khởi tạo.
Điều này xảy ra trong bất kỳ phạm vi nào (global, module, hàm, hoặc block) khi các biến [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) được truy cập trước khi vị trí khai báo chúng được thực thi.

## Thông báo

```plain
ReferenceError: Cannot access 'X' before initialization (V8-based)
ReferenceError: can't access lexical declaration 'X' before initialization (Firefox)
ReferenceError: Cannot access uninitialized variable. (Safari)
```

## Loại lỗi

{{jsxref("ReferenceError")}}

## Nguyên nhân?

Một biến từ vựng được truy cập trước khi nó được khởi tạo.
Điều này xảy ra trong bất kỳ phạm vi nào (global, module, hàm, hoặc block) khi các biến được khai báo bằng [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) được truy cập trước khi vị trí khai báo chúng được thực thi.

Lưu ý rằng điều quan trọng là thứ tự thực thi của việc truy cập và khai báo biến, không phải thứ tự mà các câu lệnh xuất hiện trong code.
Để biết thêm thông tin, hãy xem mô tả về [Temporal Dead Zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz).

Vấn đề này không xảy ra với các biến được khai báo bằng `var`, vì chúng được khởi tạo với giá trị mặc định là `undefined` khi chúng được [hoisted](/en-US/docs/Glossary/Hoisting).

Lỗi này cũng có thể xảy ra trong [cyclic imports](/en-US/docs/Web/JavaScript/Guide/Modules#cyclic_imports) khi một module sử dụng một biến phụ thuộc vào chính module đó đang được đánh giá.

## Ví dụ

### Trường hợp không hợp lệ

Trong trường hợp này, biến `foo` được truy cập trước khi nó được khai báo.
Tại thời điểm này foo chưa được khởi tạo với một giá trị, vì vậy việc truy cập biến ném ra reference error.

```js example-bad
function test() {
  // Accessing the 'const' variable foo before it's declared
  console.log(foo); // ReferenceError: foo is not initialized
  const foo = 33; // 'foo' is declared and initialized here using the 'const' keyword
}

test();
```

Trong ví dụ này, biến `a` được import nhưng chưa được khởi tạo, vì việc đánh giá `a.js` bị chặn bởi việc đánh giá module hiện tại `b.js`.

```js example-bad
// -- a.js (entry module) --
import { b } from "./b.js";

export const a = 2;

// -- b.js --
import { a } from "./a.js";

console.log(a); // ReferenceError: Cannot access 'a' before initialization
export const b = 1;
```

### Trường hợp hợp lệ

Trong ví dụ sau, chúng ta khai báo đúng một biến bằng từ khóa `const` trước khi truy cập nó.

```js example-good
function test() {
  // Declaring variable foo
  const foo = 33;
  console.log(foo); // 33
}
test();
```

Trong ví dụ này, biến `a` được import được truy cập không đồng bộ, vì vậy cả hai module đều được đánh giá trước khi truy cập `a` xảy ra.

```js example-good
// -- a.js (entry module) --
import { b } from "./b.js";

export const a = 2;

// -- b.js --
import { a } from "./a.js";

setTimeout(() => {
  console.log(a); // 2
}, 10);
export const b = 1;
```

## Xem thêm

- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/class", "class")}}
