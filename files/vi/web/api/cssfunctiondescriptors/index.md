---
title: CSSFunctionDescriptors
slug: Web/API/CSSFunctionDescriptors
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSFunctionDescriptors
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Giao diện **`CSSFunctionDescriptors`** của [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho các descriptor có trong một tập hợp khai báo CSS được biểu diễn bởi đối tượng {{domxref("CSSFunctionDeclarations")}}.

Đối tượng `CSSFunctionDescriptors` được truy cập qua thuộc tính {{domxref("CSSFunctionDeclarations.style")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("CSSStyleDeclaration")}}._

- {{domxref("CSSFunctionDescriptors.result")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một chuỗi đại diện cho descriptor `result`, nếu có trong tập hợp khai báo liên quan.

## Ví dụ

### Sử dụng cơ bản `CSSFunctionDescriptors`

Trong ví dụ này, chúng ta định nghĩa một hàm CSS tùy chỉnh và sau đó truy cập các khai báo của nó bằng CSSOM.

#### CSS

```css live-sample___cssfunctiondescriptors-basics
@function --lighter(--color <color>, --lightness-adjust <number>: 0.2) returns
  <color> {
  result: oklch(from var(--color) calc(l + var(--lightness-adjust)) c h);
}
```

#### JavaScript

```js live-sample___cssfunctiondescriptors-basics
// Get a CSSFunctionRule
const cssFunc = document.getElementById("css-output").sheet.cssRules[0];

// Accessing CSSFunctionDeclarations and CSSFunctionDescriptors
console.log(cssFunc.cssRules[0]); // CSSFunctionDeclarations
console.log(cssFunc.cssRules[0].style); // CSSFunctionDescriptors
console.log(cssFunc.cssRules[0].style.result);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@function")}}
- {{domxref("CSSFunctionRule")}}
- {{domxref("CSSFunctionDeclarations")}}
