---
title: CSSPropertyRule.initialValue
slug: Web/API/CSSPropertyRule/initialValue
page-type: web-api-instance-property
browser-compat: api.CSSPropertyRule.initialValue
---

{{APIRef("CSS Properties and Values API")}}

Thuộc tính chỉ đọc **`initialValue`** của giao diện {{domxref("CSSPropertyRule")}} trả về giá trị ban đầu của quy tắc thuộc tính CSS tùy chỉnh được đại diện bởi đối tượng {{cssxref("@property")}}.

## Giá trị

Chuỗi trả về giá trị ban đầu của thuộc tính. Có thể là `null` nếu `initial-value` không được khai báo. Theo spec, đây là `null` chỉ khi cú pháp là `"*"`.

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
console.log(myRules[0].initialValue); // "#c0ffee"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
