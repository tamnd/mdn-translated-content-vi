---
title: "TypeError: can't set prototype: it would cause a prototype chain cycle"
slug: Web/JavaScript/Reference/Errors/Cyclic_prototype
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "TypeError: can't set prototype: it would cause a prototype chain cycle" xảy ra khi prototype của một đối tượng được thiết lập thành một đối tượng khiến [chuỗi prototype](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes#the_prototype_chain) trở thành vòng tròn (cả `a` và `b` đều có nhau trong chuỗi prototype của mình).

## Thông báo

```plain
TypeError: Cyclic __proto__ value (V8-based)
TypeError: can't set prototype: it would cause a prototype chain cycle (Firefox)
TypeError: cyclic __proto__ value (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Một vòng lặp, còn gọi là chu kỳ, đã được tạo ra trong một chuỗi prototype. Điều đó có nghĩa là khi duyệt qua chuỗi prototype này, cùng một vị trí sẽ được truy cập lặp đi lặp lại, thay vì cuối cùng đến `null`.

Lỗi này được ném ra tại thời điểm thiết lập prototype. Trong một phép toán như `Object.setPrototypeOf(a, b)`, nếu `a` đã tồn tại trong chuỗi prototype của `b`, lỗi này sẽ được ném ra.

## Ví dụ

```js example-bad
const a = {};
Object.setPrototypeOf(a, a);
// TypeError: can't set prototype: it would cause a prototype chain cycle
```

```js example-bad
const a = {};
const b = {};
const c = {};
Object.setPrototypeOf(a, b);
Object.setPrototypeOf(b, c);
Object.setPrototypeOf(c, a);
// TypeError: can't set prototype: it would cause a prototype chain cycle
```

## Xem thêm

- [Object Prototypes](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes)
- [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
