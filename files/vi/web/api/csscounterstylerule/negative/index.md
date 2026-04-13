---
title: "CSSCounterStyleRule: negative"
short-title: negative
slug: Web/API/CSSCounterStyleRule/negative
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.negative
---

{{APIRef("CSSOM")}}

Thuộc tính **`negative`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/negative","negative")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `negative` sẽ cho ta giá trị "-".

```css
@counter-style neg {
  system: numeric;
  symbols: "0" "1" "2" "3" "4" "5" "6" "7" "8" "9";
  negative: "-";
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].negative); // "-"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
