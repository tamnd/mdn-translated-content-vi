---
title: "CSSRule: parentRule property"
short-title: parentRule
slug: Web/API/CSSRule/parentRule
page-type: web-api-instance-property
browser-compat: api.CSSRule.parentRule
---

{{ APIRef("CSSOM") }}

Thuộc tính **`parentRule`** của {{domxref("CSSRule")}} trả về quy tắc bao chứa của quy tắc hiện tại nếu có, nếu không thì trả về `null`.

## Giá trị

Một {{domxref("CSSRule")}} là kiểu của quy tắc bao chứa. Nếu quy tắc hiện tại nằm trong một media query, nó sẽ trả về {{domxref("CSSMediaRule")}}. Nếu không, nó trả về `null`.

## Ví dụ

```css
@media (width >= 500px) {
  .box {
    width: 100px;
    height: 200px;
    background-color: red;
  }

  body {
    color: blue;
  }
}
```

```js
let myRules = document.styleSheets[0].cssRules;
let childRules = myRules[0].cssRules;
console.log(childRules[0].parentRule); // một CSSMediaRule
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
