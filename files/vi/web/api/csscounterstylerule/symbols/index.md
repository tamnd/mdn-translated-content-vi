---
title: "CSSCounterStyleRule: symbols"
short-title: symbols
slug: Web/API/CSSCounterStyleRule/symbols
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.symbols
---

{{APIRef("CSSOM")}}

Thuộc tính **`symbols`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/symbols","symbols")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `symbols` sẽ cho ta giá trị "◰ ◳ ◲ ◱".

```css
@counter-style box-corner {
  system: fixed;
  symbols: ◰ ◳ ◲ ◱;
  suffix: ": ";
  negative: "-";
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].symbols); // "◰ ◳ ◲ ◱"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
