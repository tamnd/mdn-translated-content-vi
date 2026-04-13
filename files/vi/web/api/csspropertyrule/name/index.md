---
title: CSSPropertyRule.name
slug: Web/API/CSSPropertyRule/name
page-type: web-api-instance-property
browser-compat: api.CSSPropertyRule.name
---

{{APIRef("CSS Properties and Values API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("CSSPropertyRule")}} trả về tên của quy tắc thuộc tính CSS tùy chỉnh được đại diện bởi đối tượng {{cssxref("@property")}}. Đây luôn bắt đầu bằng hai dấu gạch ngang.

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
console.log(myRules[0].name); // "--property-name"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
