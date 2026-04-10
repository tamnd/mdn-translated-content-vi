---
title: "ShadowRoot: thuộc tính styleSheets"
short-title: styleSheets
slug: Web/API/ShadowRoot/styleSheets
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.styleSheets
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`styleSheets`** của giao diện {{domxref("ShadowRoot")}} trả về một {{domxref('StyleSheetList')}} gồm các đối tượng {{domxref('CSSStyleSheet')}}, cho các stylesheet được liên kết rõ ràng hoặc nhúng vào một cây shadow.

## Giá trị

Một {{domxref('StyleSheetList')}} gồm các đối tượng {{domxref('CSSStyleSheet')}}.

## Ví dụ

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
let styleSheets = shadow.styleSheets;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
