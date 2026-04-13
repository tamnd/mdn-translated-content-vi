---
title: CSSPropertyRule.inherits
slug: Web/API/CSSPropertyRule/inherits
page-type: web-api-instance-property
browser-compat: api.CSSPropertyRule.inherits
---

{{APIRef("CSS Properties and Values API")}}

Thuộc tính chỉ đọc **`inherits`** của giao diện {{domxref("CSSPropertyRule")}} trả về cờ kế thừa của quy tắc thuộc tính CSS tùy chỉnh được đại diện bởi đối tượng {{cssxref("@property")}}. Giá trị này là `true` nếu thuộc tính này kế thừa theo mặc định, `false` nếu không.

## Giá trị

Giá trị boolean.

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
console.log(myRules[0].inherits); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
