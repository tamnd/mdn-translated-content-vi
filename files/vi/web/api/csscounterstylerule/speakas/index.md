---
title: "CSSCounterStyleRule: speakAs"
short-title: speakAs
slug: Web/API/CSSCounterStyleRule/speakAs
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.speakAs
---

{{APIRef("CSSOM")}}

Thuộc tính **`speakAs`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập giá trị của bộ mô tả {{cssxref("@counter-style/speak-as","speak-as")}}. Nếu bộ mô tả không có giá trị nào được thiết lập, thuộc tính này sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `speakAs` sẽ cho ta giá trị "bullets".

```css
@counter-style box-corner {
  system: fixed;
  symbols: ◰ ◳ ◲ ◱;
  suffix: ": ";
  speak-as: bullets;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].speakAs); // "bullets"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
