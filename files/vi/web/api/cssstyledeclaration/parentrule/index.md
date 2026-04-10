---
title: "CSSStyleDeclaration: thuộc tính parentRule"
short-title: parentRule
slug: Web/API/CSSStyleDeclaration/parentRule
page-type: web-api-instance-property
browser-compat: api.CSSStyleDeclaration.parentRule
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **CSSStyleDeclaration.parentRule** trả về một {{domxref('CSSRule')}} là phần tử cha của khối kiểu này, ví dụ: một {{domxref('CSSStyleRule')}} đại diện cho kiểu của một bộ chọn CSS.

## Giá trị

Quy tắc CSS chứa khối khai báo này hoặc `null` nếu {{domxref('CSSStyleDeclaration')}} này không được gắn với một {{domxref('CSSRule')}}.

## Ví dụ

Mã JavaScript sau đây lấy quy tắc kiểu CSS cha từ một {{domxref('CSSStyleDeclaration')}}:

```js
const declaration = document.styleSheets[0].rules[0].style;
const rule = declaration.parentRule;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
