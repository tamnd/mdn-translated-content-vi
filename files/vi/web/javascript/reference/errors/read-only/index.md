---
title: 'TypeError: "x" is read-only'
slug: Web/JavaScript/Reference/Errors/Read-only
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "is read-only" xảy ra khi một biến toàn cục hoặc thuộc tính đối tượng được gán giá trị là thuộc tính chỉ đọc.

## Thông báo

```plain
TypeError: Cannot assign to read only property 'x' of #<Object> (V8-based)
TypeError: "x" is read-only (Firefox)
TypeError: Attempted to assign to readonly property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}} chỉ trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Điều gì đã xảy ra?

Biến toàn cục hoặc thuộc tính đối tượng được gán giá trị là thuộc tính chỉ đọc.
(Về mặt kỹ thuật, đây là [thuộc tính dữ liệu không thể ghi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#writable_attribute).)

Lỗi này chỉ xảy ra trong [code strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Trong code non-strict, việc gán giá trị bị bỏ qua một cách im lặng.

## Ví dụ

### Các trường hợp không hợp lệ

Các thuộc tính chỉ đọc không phổ biến lắm, nhưng chúng có thể được tạo bằng cách sử dụng {{jsxref("Object.defineProperty()")}} hoặc {{jsxref("Object.freeze()")}}.

```js example-bad
"use strict";
const obj = Object.freeze({ name: "Elsa", score: 157 });
obj.score = 0; // TypeError

("use strict");
Object.defineProperty(this, "LUNG_COUNT", { value: 2, writable: false });
LUNG_COUNT = 3; // TypeError

("use strict");
const frozenArray = Object.freeze([0, 1, 2]);
frozenArray[0]++; // TypeError
```

Cũng có một số thuộc tính chỉ đọc được tích hợp sẵn trong JavaScript. Có thể bạn đã thử định nghĩa lại một hằng số toán học.

```js example-bad
"use strict";
Math.PI = 4; // TypeError
```

Xin lỗi, bạn không thể làm điều đó.

Biến toàn cục `undefined` cũng là chỉ đọc, vì vậy bạn không thể im lặng lỗi "undefined is not a function" nổi tiếng bằng cách làm điều này:

```js example-bad
"use strict";
undefined = function () {}; // TypeError: "undefined" is read-only
```

### Các trường hợp hợp lệ

```js example-good
"use strict";
let obj = Object.freeze({ name: "Score", points: 157 });
obj = { name: obj.name, points: 0 }; // thay thế bằng một đối tượng mới
```

## Xem thêm

- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.freeze()")}}
