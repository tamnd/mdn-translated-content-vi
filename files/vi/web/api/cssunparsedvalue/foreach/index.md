---
title: "CSSUnparsedValue: phương thức forEach()"
short-title: forEach()
slug: Web/API/CSSUnparsedValue/forEach
page-type: web-api-instance-method
browser-compat: api.CSSUnparsedValue.forEach
---

{{APIRef("CSS Typed OM")}}

Phương thức **`CSSUnparsedValue.forEach()`** thực thi một hàm được cung cấp một lần cho mỗi phần tử của {{domxref('CSSUnparsedValue')}}.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử, nhận ba đối số:
    - `currentValue`
      - : Giá trị của phần tử hiện tại đang được xử lý.
    - `index` {{optional_inline}}
      - : Chỉ mục của phần tử hiện tại đang được xử lý.
    - `array` {{optional_inline}}
      - : `CSSUnparsedValue` mà `forEach()` đang được gọi trên.

- `thisArg` {{Optional_inline}}
  - : Giá trị để sử dụng làm **`this`** (tức là tham chiếu `Object`) khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}}
- {{domxref("CSSUnparsedValue.entries")}}
- {{domxref("CSSUnparsedValue.keys")}}
- {{domxref("CSSUnparsedValue.length")}}
- {{domxref("CSSUnparsedValue.values")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
