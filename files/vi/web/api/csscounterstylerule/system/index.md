---
title: "CSSCounterStyleRule: system"
short-title: system
slug: Web/API/CSSCounterStyleRule/system
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.system
---

{{APIRef("CSSOM")}}

Thuộc tính **`system`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/system", "system")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `system` sẽ cho ta giá trị "fixed".

```css
@counter-style box-corner {
  system: fixed;
  symbols: ◰ ◳ ◲ ◱;
  suffix: ": ";
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].system); // "fixed"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
