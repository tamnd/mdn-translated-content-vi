---
title: CSS Declaration Block
slug: Web/API/CSS_Object_Model/CSS_Declaration_Block
page-type: guide
spec-urls: https://drafts.csswg.org/cssom/#css-declaration-blocks
---

{{DefaultAPISidebar("CSSOM")}}

**CSS declaration block** là một tập hợp có thứ tự của các thuộc tính và giá trị CSS. Nó được biểu diễn trong DOM dưới dạng {{domxref("CSSStyleDeclaration")}}.

Mỗi cặp thuộc tính và giá trị được gọi là một [CSS declaration](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration). CSS declaration block có các thuộc tính liên quan sau:

- computed flag
  - : Được bật nếu đối tượng {{domxref("CSSStyleDeclaration")}} là kiểu đã tính toán thay vì kiểu đã khai báo. Mặc định là tắt.
- declarations
  - : Các [CSS declaration](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration) gắn với đối tượng này.
- parent CSS rule
  - : {{domxref("CSSRule")}} mà CSS declaration block này được gắn với, nếu không thì là null.
- owner node
  - : {{domxref("element")}} mà CSS declaration block này được gắn với, nếu không thì là null.
- updating flag
  - : Được bật khi CSS declaration block đang cập nhật thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của owner node.

Khi một {{domxref("CSSStyleDeclaration")}} được trả về bởi một giao diện [Mô hình đối tượng CSS (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model), các thuộc tính này được đặt thành các giá trị phù hợp như đặc tả quy định.

## Ví dụ cơ bản

Ví dụ sau cho thấy một quy tắc CSS với một declaration block cho phần tử {{htmlelement("Heading_Elements","h1")}}. CSS declaration block là các dòng nằm giữa dấu ngoặc nhọn.

```css
h1 {
  margin: 0 auto;
  font-family: "Helvetica Neue", "Arial", sans-serif;
  font-style: italic;
  color: rebeccapurple;
}
```

Chúng ta có thể trả về một {{domxref("CSSStyleDeclaration")}} biểu diễn CSS declaration block này bằng {{domxref("CSSStyleRule.style")}}.

```js
let myRules = document.styleSheets[0].cssRules;
let rule = myRules[0]; // a CSSStyleRule
console.log(rule.style); // a CSSStyleDeclaration object
```

## Thông số kỹ thuật

{{Specifications}}
