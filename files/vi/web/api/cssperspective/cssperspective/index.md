---
title: "CSSPerspective: hàm khởi tạo CSSPerspective()"
short-title: CSSPerspective()
slug: Web/API/CSSPerspective/CSSPerspective
page-type: web-api-constructor
browser-compat: api.CSSPerspective.CSSPerspective
---

{{APIRef("CSS Typed OM")}}

Hàm khởi tạo **`CSSPerspective()`** tạo một đối tượng {{domxref("CSSPerspective")}} mới biểu thị giá trị {{cssxref("transform-function/perspective", "perspective()")}} của thuộc tính {{CSSXref('transform')}} riêng lẻ trong CSS.

## Cú pháp

```js-nolint
new CSSPerspective(length)
```

### Tham số

- {{domxref('CSSPerspective.length','length')}}
  - : Một giá trị cho khoảng cách từ z=0 của đối tượng {{domxref('CSSPerspective')}} cần tạo. Đây phải là {{cssxref('length')}}.

### Ngoại lệ

- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : Được ném ra nếu giá trị của `CSSPerspective.length` tồn tại nhưng không phải là {{cssxref('length')}}.

## Ví dụ

Sẽ được thêm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
