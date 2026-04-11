---
title: CSSStyleRule
slug: Web/API/CSSStyleRule
page-type: web-api-interface
browser-compat: api.CSSStyleRule
---

{{ APIRef("CSSOM") }}

Giao diện **`CSSStyleRule`** đại diện cho một quy tắc kiểu CSS đơn lẻ.

{{InheritanceDiagram}}

## Thuộc tính của thể hiện

_Kế thừa các thuộc tính từ các lớp cha của nó là {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

- {{domxref("CSSStyleRule.selectorText")}}
  - : Trả về biểu diễn văn bản của bộ chọn cho quy tắc này, ví dụ `"h1, h2"`.
- {{domxref("CSSStyleRule.style")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("CSSStyleProperties")}} của quy tắc, đại diện cho các style của nó.
- {{domxref("CSSStyleRule.styleMap")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref('StylePropertyMap')}}, cung cấp quyền truy cập vào các cặp thuộc tính-giá trị của quy tắc.

## Phương thức của thể hiện

_Kế thừa các phương thức từ các lớp cha của nó là {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

### Lấy một style rule

CSS dưới đây định nghĩa style rule cho bộ chọn `h1`, được biểu diễn trong code bằng một thể hiện `CSSStyleRule`.

```css
h1 {
  color: pink;
}
```

Giả sử style rule ở trên là quy tắc đầu tiên trong tài liệu, nó sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0].style` trả về một đối tượng {{domxref("CSSStyleProperties")}} đại diện cho các khai báo được định nghĩa cho `h1`.

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0]); // a CSSStyleRule representing the h1.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
