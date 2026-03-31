---
title: "TypeError: can't set prototype of this object"
slug: Web/JavaScript/Reference/Errors/Cant_set_prototype
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't set prototype of this object" xảy ra khi cố gắng đặt prototype của một đối tượng, nhưng prototype của đối tượng đó bị đóng băng, hoặc do là đối tượng prototype bất biến tích hợp sẵn, hoặc do là [không thể mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible).

## Thông báo

```plain
TypeError: Immutable prototype object 'Object.prototype' cannot have their prototype set (V8-based)
TypeError: #<Object> is not extensible (V8-based)
TypeError: can't set prototype of this object (Firefox)
TypeError: Cannot set prototype of immutable prototype object (Safari)
TypeError: Attempted to assign to readonly property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Bạn đang sử dụng một trong các phương thức thay đổi prototype—đáng chú ý nhất là {{jsxref("Object.setPrototypeOf()")}}—trên một đối tượng có prototype bất biến. Một số đối tượng tích hợp sẵn có prototype bất biến, chẳng hạn như `Object.prototype` và {{domxref("window")}}, vì lý do bảo mật. Các đối tượng người dùng cũng có thể ngăn chặn việc thay đổi prototype bằng cách sử dụng {{jsxref("Object.preventExtensions()")}}, {{jsxref("Object.seal()")}}, hoặc {{jsxref("Object.freeze()")}}.

## Ví dụ

### Thay đổi prototype của đối tượng tích hợp sẵn

Một số ít đối tượng tích hợp sẵn có prototype bất biến. Ví dụ, bạn không thể thay đổi prototype của `Object.prototype`:

```js example-bad
Object.setPrototypeOf(Object.prototype, {});
```

Điều này ngăn bạn tùy ý thay đổi hành vi của tất cả các đối tượng trong hệ thống. Prototype của `Object.prototype` luôn là `null`. Tuy nhiên, các đối tượng prototype tích hợp sẵn khác, chẳng hạn như `Function.prototype` và `Array.prototype`, mặc định không được bảo vệ theo cách này.

### Thay đổi prototype của đối tượng không thể mở rộng

Nếu bạn làm một đối tượng không thể mở rộng, bạn cũng không thể thay đổi prototype của nó:

```js example-bad
const obj = {};
Object.preventExtensions(obj);
Object.setPrototypeOf(obj, {});
// TypeError: can't set prototype of this object
```

## Xem thêm

- {{jsxref("Object.setPrototypeOf()")}}
- {{jsxref("Object.preventExtensions()")}}
