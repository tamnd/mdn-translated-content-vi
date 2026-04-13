---
title: CSSPropertyRule.syntax
slug: Web/API/CSSPropertyRule/syntax
page-type: web-api-instance-property
browser-compat: api.CSSPropertyRule.syntax
---

{{APIRef("CSS Properties and Values API")}}

Thuộc tính chỉ đọc **`syntax`** của giao diện {{domxref("CSSPropertyRule")}} trả về cú pháp theo nghĩa đen của quy tắc thuộc tính CSS tùy chỉnh được đại diện bởi đối tượng {{cssxref("@property")}}. Đây là một chuỗi.

## Giá trị

Chuỗi.

## Ví dụ

Stylesheet này chứa một đơn {{cssxref("@property")}}. {{domxref("CSSPropertyRule")}} đầu tiên được trả về sẽ đại diện cho thuộc tính này.

```css
@property --property-name {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].syntax); // "<color>"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
