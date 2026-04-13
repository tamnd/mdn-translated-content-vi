---
title: "CSSCounterStyleRule: fallback"
short-title: fallback
slug: Web/API/CSSCounterStyleRule/fallback
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.fallback
---

{{APIRef("CSSOM")}}

Thuộc tính **`fallback`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/fallback","fallback")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `fallback` sẽ cho ta giá trị "disc".

```css
@counter-style box-corner {
  system: fixed;
  symbols: ◰ ◳ ◲ ◱;
  suffix: ": ";
  fallback: disc;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].fallback); // "disc"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
