---
title: CSS Declaration
slug: Web/API/CSS_Object_Model/CSS_Declaration
page-type: guide
spec-urls: https://drafts.csswg.org/cssom/#css-declarations
---

{{DefaultAPISidebar("CSSOM")}}

**CSS declaration** là một khái niệm trừu tượng không được hiển thị như một đối tượng trong DOM. Nó đại diện cho một cặp thuộc tính và giá trị CSS.

CSS declaration có các thuộc tính liên quan sau:

- property name
  - : Tên thuộc tính của declaration, ví dụ {{cssxref("background-color")}}.
- value
  - : Giá trị của declaration dưới dạng một danh sách các giá trị thành phần.
- important flag
  - : Được bật hoặc tắt.
- case-sensitive flag
  - : Được bật nếu tên thuộc tính được đặc tả là phân biệt hoa thường, ngược lại thì tắt.

## Ví dụ cơ bản

Ví dụ sau cho thấy một quy tắc CSS với một [CSS declaration block](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration_Block) cho phần tử {{htmlelement("Heading_Elements","&lt;h1&gt;")}}. CSS declaration block là các dòng nằm giữa dấu ngoặc nhọn, và nó chứa hai CSS declaration. Một cho {{cssxref("font-style")}} và một cho {{cssxref("color")}}.

```css
h1 {
  font-style: italic;
  color: rebeccapurple;
}
```

## Thông số kỹ thuật

{{Specifications}}
