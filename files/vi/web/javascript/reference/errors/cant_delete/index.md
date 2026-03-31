---
title: 'TypeError: property "x" is non-configurable and can''t be deleted'
slug: Web/JavaScript/Reference/Errors/Cant_delete
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "property is non-configurable and can't be deleted" xảy ra khi cố gắng xóa một thuộc tính, nhưng thuộc tính đó là [không thể cấu hình](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties).

## Thông báo

```plain
TypeError: Cannot delete property 'x' of #<Object> (V8-based)
TypeError: property "x" is non-configurable and can't be deleted (Firefox)
TypeError: Unable to delete property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}} chỉ trong strict mode.

## Nguyên nhân?

Đã cố gắng xóa một thuộc tính, nhưng thuộc tính đó là [không thể cấu hình](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties). Thuộc tính `configurable` kiểm soát liệu thuộc tính có thể bị xóa khỏi đối tượng hay không và liệu các thuộc tính của nó (ngoài `writable`) có thể được thay đổi hay không.

Lỗi này chỉ xảy ra trong [strict mode code](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Trong non-strict code, thao tác sẽ trả về `false`.

## Ví dụ

### Cố gắng xóa các thuộc tính không thể cấu hình

Các thuộc tính không thể cấu hình không phổ biến lắm, nhưng chúng có thể được tạo bằng {{jsxref("Object.defineProperty()")}} hoặc {{jsxref("Object.freeze()")}}.

```js example-bad
"use strict";
const obj = Object.freeze({ name: "Elsa", score: 157 });
delete obj.score; // TypeError
```

```js example-bad
"use strict";
const obj = {};
Object.defineProperty(obj, "foo", { value: 2, configurable: false });
delete obj.foo; // TypeError
```

```js example-bad
"use strict";
const frozenArray = Object.freeze([0, 1, 2]);
frozenArray.pop(); // TypeError
```

Cũng có một số thuộc tính không thể cấu hình được tích hợp sẵn trong JavaScript. Có thể bạn đã cố gắng xóa một hằng số toán học.

```js example-bad
"use strict";
delete Math.PI; // TypeError
```

## Xem thêm

- [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete)
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.freeze()")}}
