---
title: 'TypeError: can''t define property "x": "obj" is not extensible'
slug: Web/JavaScript/Reference/Errors/Cant_define_property_object_not_extensible
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't define property "x": "obj" is not extensible" xảy ra khi một đối tượng được đánh dấu là không thể mở rộng, do đó nó sẽ không bao giờ có các thuộc tính ngoài những thuộc tính nó có tại thời điểm được đánh dấu là không thể mở rộng. Các đối tượng có thể được làm không thể mở rộng bằng cách gọi {{jsxref("Object.preventExtensions()")}}, {{jsxref("Object.seal()")}}, hoặc {{jsxref("Object.freeze()")}}.

## Thông báo

```plain
TypeError: Cannot add property x, object is not extensible (V8-based)
TypeError: Cannot define property x, object is not extensible (V8-based)
TypeError: can't define property "x": Object is not extensible (Firefox)
TypeError: Attempting to define property on object that is not extensible. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Thông thường, một đối tượng có thể mở rộng và các thuộc tính mới có thể được thêm vào nó. Tuy nhiên, trong trường hợp này đối tượng không thể mở rộng, vì vậy nó sẽ không bao giờ có các thuộc tính ngoài những thuộc tính nó có tại thời điểm được đánh dấu là không thể mở rộng. Bạn có thể đã đánh dấu đối tượng là không thể mở rộng bằng cách gọi {{jsxref("Object.preventExtensions()")}}, {{jsxref("Object.seal()")}}, hoặc {{jsxref("Object.freeze()")}}, hoặc một thư viện bạn đang sử dụng có thể đã làm điều đó cho bạn.

## Ví dụ

### Thêm thuộc tính mới vào đối tượng không thể mở rộng

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), việc cố gắng thêm thuộc tính mới vào đối tượng không thể mở rộng thông qua gán sẽ ném `TypeError`. Trong sloppy mode, việc thêm thuộc tính "x" bị bỏ qua một cách lặng lẽ.

```js example-bad
"use strict";

const obj = {};
Object.preventExtensions(obj);

obj.x = "foo";
// TypeError: can't define property "x": Object is not extensible
```

Trong cả [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) và sloppy mode, một lời gọi {{jsxref("Object.defineProperty()")}} sẽ ném khi thêm thuộc tính mới vào đối tượng không thể mở rộng.

```js example-bad
const obj = {};
Object.preventExtensions(obj);

Object.defineProperty(obj, "x", { value: "foo" });
// TypeError: can't define property "x": Object is not extensible
```

### Các đối tượng không thể mở rộng được tạo bằng các cách khác

Các phương thức `Object.seal()` và `Object.freeze()` cũng tạo ra các đối tượng không thể mở rộng — chúng chỉ có thêm hạn chế về việc sửa đổi các thuộc tính hiện có.

```js example-bad
"use strict";

const obj = { y: "bar" };
Object.seal(obj);
obj.x = "foo";
// TypeError: can't define property "x": Object is not extensible
```

### Sửa lỗi

Có ba cách để sửa lỗi này: bạn có thể xóa hoàn toàn việc thêm thuộc tính nếu bạn không cần nó, bạn có thể sao chép các thuộc tính hiện có sang một đối tượng mới có thể mở rộng, hoặc bạn có thể thêm thuộc tính trước khi làm đối tượng không thể mở rộng.

```js example-good
"use strict";

const obj = {};
obj.x = "foo"; // add property first and only then prevent extensions

Object.preventExtensions(obj);
```

## Xem thêm

- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.freeze()")}}
