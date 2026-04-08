---
title: "TypeError: class constructors must be invoked with 'new'"
slug: Web/JavaScript/Reference/Errors/Class_ctor_no_new
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "class constructors must be invoked with 'new'" xảy ra khi một [constructor của lớp](/en-US/docs/Web/JavaScript/Reference/Classes) được gọi mà không có từ khóa {{jsxref("Operators/new", "new")}}. Tất cả các constructor của lớp phải được gọi với `new`.

## Thông báo

```plain
TypeError: Class constructor X cannot be invoked without 'new' (V8-based)
TypeError: Class constructors cannot be invoked without 'new' (V8-based)
TypeError: class constructors must be invoked with 'new' (Firefox)
TypeError: Cannot call a class constructor without |new| (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Trong JavaScript, _gọi_ một hàm mà không có `new` và _xây dựng_ một hàm với `new` là hai hoạt động khác nhau, và các hàm có thể hoạt động khác nhau tùy thuộc vào cách chúng được gọi.

Theo truyền thống, các hàm JavaScript được sử dụng vừa như constructor vừa như hàm thông thường, và có thể phát hiện cách chúng được gọi bằng cách sử dụng [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target). Tuy nhiên, constructor của lớp luôn luôn là constructor và không thể được gọi như hàm thông thường.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
class X {}

X(); // TypeError: class constructors must be invoked with 'new'
```

### Trường hợp hợp lệ

```js example-good
class X {}

new X();
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Operators/new", "new")}}
