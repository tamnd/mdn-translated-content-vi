---
title: "TypeError: null/undefined has no properties"
slug: Web/JavaScript/Reference/Errors/No_properties
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "null (or undefined) has no properties" xảy ra khi bạn cố gắng truy cập các thuộc tính của [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}. Chúng không có thuộc tính nào.

## Thông báo

```plain
TypeError: Cannot read properties of undefined (reading 'x') (V8-based)
TypeError: Cannot destructure 'x' as it is undefined. (V8-based)
TypeError: Cannot destructure property 'x' of 'y' as it is undefined. (V8-based)
TypeError: null has no properties (Firefox)
TypeError: undefined has no properties (Firefox)
TypeError: undefined is not an object (evaluating 'undefined.x') (Safari)
TypeError: Right side of assignment cannot be destructured (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Nguyên nhân?

Cả [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và {{jsxref("undefined")}} đều không có thuộc tính mà bạn có thể truy cập. Do đó, bạn không thể sử dụng [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) trên chúng, hay [destructure](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) chúng.

## Ví dụ

### null và undefined không có thuộc tính

```js example-bad
null.foo;
// TypeError: null has no properties

undefined.bar;
// TypeError: undefined has no properties
```

## Xem thêm

- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
- {{jsxref("undefined")}}
