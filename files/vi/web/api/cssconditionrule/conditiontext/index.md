---
title: "CSSConditionRule: thuộc tính conditionText"
short-title: conditionText
slug: Web/API/CSSConditionRule/conditionText
page-type: web-api-instance-property
browser-compat: api.CSSConditionRule.conditionText
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`conditionText`** của giao diện {{domxref("CSSConditionRule")}} trả về hoặc đặt văn bản của quy tắc CSS.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ dưới đây minh họa việc đọc giá trị của `conditionText` trên một {{domxref("CSSMediaRule")}} triển khai giao diện {{domxref("CSSConditionRule")}}.

```css
@media (width >= 500px) {
  body {
    color: blue;
  }
}
```

```js
const targetRule = document.styleSheets[0].cssRules[0];
console.log(targetRule.conditionText); // "(width >= 500px)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thông tin kiểu dáng động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
