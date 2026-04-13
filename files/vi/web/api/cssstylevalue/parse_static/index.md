---
title: "CSSStyleValue: phương thức tĩnh parse()"
short-title: parse()
slug: Web/API/CSSStyleValue/parse_static
page-type: web-api-static-method
browser-compat: api.CSSStyleValue.parse_static
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức tĩnh **`parse()`** của giao diện {{domxref("CSSStyleValue")}} đặt một thuộc tính CSS cụ thể thành các giá trị được chỉ định và trả về giá trị đầu tiên dưới dạng đối tượng {{domxref('CSSStyleValue')}}.

## Cú pháp

```js-nolint
CSSStyleValue.parse(property, cssText)
```

### Tham số

- `property`
  - : Một thuộc tính CSS cần đặt.
- `cssText`
  - : Một chuỗi phân cách bằng dấu phẩy chứa một hoặc nhiều giá trị để áp dụng cho thuộc tính được cung cấp.

### Giá trị trả về

Một đối tượng `CSSStyleValue` chứa giá trị được cung cấp đầu tiên.

## Ví dụ

Mã dưới đây phân tích một tập hợp các khai báo cho thuộc tính `transform`.
Khối mã thứ hai hiển thị cấu trúc của đối tượng được trả về như nó sẽ hiển thị trong bảng điều khiển công cụ nhà phát triển.

```js
const css = CSSStyleValue.parse(
  "transform",
  "translate3d(10px,10px,0) scale(0.5)",
);
```

```plain
CSSTransformValue {0: CSSTranslate, 1: CSSScale, length: 2, is2D: false}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`CSSStyleValue.parseAll()`](/en-US/docs/Web/API/CSSStyleValue/parseAll_static)
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
