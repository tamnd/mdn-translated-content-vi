---
title: "CSSCounterStyleRule: pad"
short-title: pad
slug: Web/API/CSSCounterStyleRule/pad
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.pad
---

{{APIRef("CSSOM")}}

Thuộc tính **`pad`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/pad", "pad")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `pad` sẽ cho ta giá trị "0".

```css
@counter-style box-corner {
  system: numeric;
  symbols: "0" "1" "2" "3" "4" "5";
  pad: 2 "0";
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].pad); // "0"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
