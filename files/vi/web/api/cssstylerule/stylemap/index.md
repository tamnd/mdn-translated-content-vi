---
title: "CSSStyleRule: styleMap property"
short-title: styleMap
slug: Web/API/CSSStyleRule/styleMap
page-type: web-api-instance-property
browser-compat: api.CSSStyleRule.styleMap
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ-đọc **`styleMap`** của giao diện {{domxref("CSSStyleRule")}} trả về một đối tượng {{domxref('StylePropertyMap')}} cung cấp quyền truy cập vào các cặp thuộc tính-giá trị của quy tắc.

## Giá trị

Một đối tượng {{domxref('StylePropertyMap')}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng `styleMap` để sửa đổi một style bằng phương thức {{domxref('StylePropertyMap.set()')}}.

```js
const stylesheet = document.styleSheets[0];

Object.values(stylesheet.cssRules).forEach((block) => {
  if (block.selectorText === "button") {
    block.styleMap.set("--main-color", "black");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
