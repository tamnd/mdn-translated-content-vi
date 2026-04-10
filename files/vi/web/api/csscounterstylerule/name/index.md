---
title: "CSSCounterStyleRule: name"
short-title: name
slug: Web/API/CSSCounterStyleRule/name
page-type: web-api-instance-property
browser-compat: api.CSSCounterStyleRule.name
---

{{APIRef("CSSOM")}}

Thuộc tính **`name`** của giao diện {{domxref("CSSCounterStyleRule")}} lấy và thiết lập {{CSSxRef("&lt;custom-ident&gt;")}} được định nghĩa là `name` cho quy tắc tương ứng.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau đây cho thấy một quy tắc {{cssxref("@counter-style")}}. Trong JavaScript, `myRules[0]` là quy tắc `@counter-style` này, khi trả về `name` sẽ cho ta định danh tùy chỉnh "box-corner".

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
console.log(myRules[0].name); // "box-corner"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
