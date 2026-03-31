---
title: "TypeError: WeakSet key/WeakMap value 'x' must be an object or an unregistered symbol"
slug: Web/JavaScript/Reference/Errors/Key_not_weakly_held
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "WeakSet key (or WeakMap value) 'x' must be an object or an unregistered symbol" xảy ra khi một giá trị có kiểu không hợp lệ được sử dụng làm khóa trong {{jsxref("WeakSet")}} hoặc làm giá trị trong {{jsxref("WeakMap")}}.

## Thông báo

```plain
TypeError: Invalid value used as weak map key (V8-based)
TypeError: WeakMap key 1 must be an object or an unregistered symbol (Firefox)
TypeError: WeakMap keys must be objects or non-registered symbols (Safari)

TypeError: Invalid value used in weak set (V8-based)
TypeError: WeakSet value 1 must be an object or an unregistered symbol (Firefox)
TypeError: WeakSet values must be objects or non-registered symbols (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

{{jsxref("WeakSet")}} và {{jsxref("WeakMap")}} yêu cầu các khóa phải có khả năng _thu gom rác_. Chỉ các đối tượng và các symbol không được đăng ký (tức là các [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) không được trả về bởi {{jsxref("Symbol.for()")}}) là hợp lệ. Để biết thêm thông tin, hãy xem [Quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management#weakmaps_and_weaksets). Nếu bạn muốn thêm các khóa là chuỗi, số hoặc các giá trị nguyên thủy khác, hãy lưu trữ chúng trong `Set` hoặc `Map` thông thường.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
new WeakSet().add(1); // TypeError
new WeakMap().set(1, {}); // TypeError
new WeakSet([1]); // TypeError
new WeakMap([[1, {}]]); // TypeError
```

### Các trường hợp hợp lệ

```js example-good
new WeakSet().add({}); // OK
new WeakMap().set({}, 1); // OK

new Set([1]); // OK
new Map([[1, {}]]); // OK
```

## Xem thêm

- [Quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management)
- {{jsxref("WeakSet")}}
- {{jsxref("WeakMap")}}
- {{jsxref("Set")}}
- {{jsxref("Map")}}
