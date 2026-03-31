---
title: Number.MAX_VALUE
short-title: MAX_VALUE
slug: Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.MAX_VALUE
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.MAX_VALUE`** biểu diễn giá trị số tối đa có thể biểu diễn trong JavaScript.

{{InteractiveExample("JavaScript Demo: Number.MAX_VALUE")}}

```js interactive-example
function multiply(x, y) {
  if (x * y > Number.MAX_VALUE) {
    return "Process as Infinity";
  }
  return x * y;
}

console.log(multiply(1.7976931348623157e308, 1));
// Expected output: 1.7976931348623157e+308

console.log(multiply(1.7976931348623157e308, 2));
// Expected output: "Process as Infinity"
```

## Giá trị

2<sup>1024</sup> - 2<sup>971</sup>, hay xấp xỉ `1.7976931348623157E+308`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Các giá trị lớn hơn `MAX_VALUE` được biểu diễn là {{jsxref("Infinity")}} và sẽ mất giá trị thực của chúng. Như đề cập trong {{jsxref("Number.EPSILON")}}, độ chính xác của số phụ thuộc vào độ lớn của chúng. Các số nguyên chỉ có thể được biểu diễn chính xác lên đến {{jsxref("Number.MAX_SAFE_INTEGER")}}, là 2<sup>53</sup> - 1.

Vì `MAX_VALUE` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.MAX_VALUE`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Sử dụng MAX_VALUE

Đoạn mã sau nhân hai giá trị số. Nếu kết quả nhỏ hơn hoặc bằng `MAX_VALUE`, hàm `func1` được gọi; ngược lại, hàm `func2` được gọi.

```js
if (num1 * num2 <= Number.MAX_VALUE) {
  func1();
} else {
  func2();
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.MIN_VALUE")}}
- {{jsxref("Number.MAX_SAFE_INTEGER")}}
- {{jsxref("Number")}}
