---
title: "CSSCounterStyleRule: additiveSymbols"
short-title: additiveSymbols
slug: Web/API/CSSCounterStyleRule/additiveSymbols
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.additiveSymbols
---

{{APIRef("CSSOM")}}

Thuộc tính **`additiveSymbols`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/additive-symbols","additive-symbols")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `additiveSymbols` sẽ cho ta giá trị " V 5, IV 4, I 1".

```css
@counter-style additive-symbols-example {
  system: additive;
  additive-symbols:
    V 5,
    IV 4,
    I 1;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].additiveSymbols); // " V 5, IV 4, I 1"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
