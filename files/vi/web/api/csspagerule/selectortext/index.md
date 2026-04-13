---
title: "CSSPageRule: thuộc tính selectorText"
short-title: selectorText
slug: Web/API/CSSPageRule/selectorText
page-type: web-api-instance-property
browser-compat: api.CSSPageRule.selectorText
---

{{APIRef("CSSOM")}}

Thuộc tính **`selectorText`** của giao diện {{domxref("CSSPageRule")}} lấy và thiết lập các bộ chọn liên kết với `CSSPageRule`.

## Giá trị

Một chuỗi.

## Ví dụ

Stylesheet bao gồm hai quy tắc {{cssxref("@page")}}. Thuộc tính `selectorText` sẽ trả về văn bản bộ chọn chính xác của `:first` dưới dạng chuỗi.

```css
@page {
  margin: 1cm;
}

@page :first {
  margin: 2cm;
}
```

```js
const myRules = document.styleSheets[0].cssRules; // Two myRules
console.log(myRules[1].selectorText); // ":first"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
