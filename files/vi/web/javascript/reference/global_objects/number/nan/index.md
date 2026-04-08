---
title: Number.NaN
short-title: NaN
slug: Web/JavaScript/Reference/Global_Objects/Number/NaN
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.NaN
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.NaN`** biểu diễn Not-A-Number (Không phải số), tương đương với {{jsxref("NaN")}}. Để biết thêm thông tin về hành vi của `NaN`, xem [mô tả cho thuộc tính toàn cục](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN).

{{InteractiveExample("JavaScript Demo: Number.NaN", "taller")}}

```js interactive-example
function clean(x) {
  if (x === Number.NaN) {
    // Can never be true
    return null;
  }
  if (isNaN(x)) {
    return 0;
  }
}

console.log(clean(Number.NaN));
// Expected output: 0
```

## Giá trị

Giá trị số {{jsxref("NaN")}}.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `NaN` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.NaN`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Kiểm tra xem các giá trị có phải là số hay không

```js
function sanitize(x) {
  if (isNaN(x)) {
    return Number.NaN;
  }
  return x;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("NaN")}}
- {{jsxref("Number.isNaN()")}}
