---
title: CSSSupportsRule
slug: Web/API/CSSSupportsRule
page-type: web-api-interface
browser-compat: api.CSSSupportsRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSSupportsRule`** đại diện cho một CSS [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@supports")}} đơn lẻ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

CSS bao gồm một feature query CSS sử dụng at-rule {{cssxref("@supports")}}, chứa một quy tắc kiểu. Đây sẽ là CSSRule đầu tiên được trả về bởi `document.styleSheets[0].cssRules`. `myRules[0]` do đó trả về đối tượng `CSSSupportsRule`.

```css
@supports (display: grid) {
  body {
    color: blue;
  }
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0]); // a CSSSupportsRule representing the feature query.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@supports")}}
