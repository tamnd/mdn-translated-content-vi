---
title: CSSFunctionDeclarations
slug: Web/API/CSSFunctionDeclarations
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSFunctionDeclarations
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Giao diện **`CSSFunctionDeclarations`** của [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho một chuỗi khai báo CSS liên tục được bao gồm trong phần thân {{cssxref("@function")}}.

Điều này có thể bao gồm [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) và giá trị của descriptor `results` bên trong phần thân `@function`, nhưng không bao gồm các khối như at-rule {{cssxref("@media")}} có thể được bao gồm. Một khối như vậy, được bao gồm ở giữa một tập hợp khai báo, sẽ khiến nội dung phần thân bị chia thành các đối tượng `CSSFunctionDeclarations` riêng biệt, như được thấy trong bản demo [Multiple `CSSFunctionDeclarations`](#multiple_cssfunctiondeclarations) của chúng ta.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("CSSRule")}}._

- {{domxref("CSSFunctionDeclarations.style")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một đối tượng {{domxref("CSSFunctionDescriptors")}} đại diện cho các descriptor có sẵn trong phần thân at-rule {{cssxref("@function")}}.

## Ví dụ

### Sử dụng cơ bản `CSSFunctionDeclarations`

Trong ví dụ này, chúng ta định nghĩa một hàm CSS tùy chỉnh và sau đó truy cập các khai báo của nó bằng CSSOM.

#### CSS

CSS của chúng ta định nghĩa một hàm tùy chỉnh sử dụng at-rule {{cssxref("@function")}}. Hàm được gọi là `--lighter()` và xuất ra phiên bản sáng hơn của một màu đầu vào.

```css live-sample___cssfunctiondeclarations-basics
@function --lighter(--color <color>, --lightness-adjust <number>: 0.2) returns
  <color> {
  --someVar: 100;
  result: oklch(from var(--color) calc(l + var(--lightness-adjust)) c h);
}
```

#### JavaScript

```js live-sample___cssfunctiondeclarations-basics
// Get a CSSFunctionRule
const cssFunc = document.getElementById("css-output").sheet.cssRules[0];

// Accessing CSSFunctionDeclarations and CSSFunctionDescriptors
console.log(cssFunc.cssRules[0]); // CSSFunctionDeclarations
console.log(cssFunc.cssRules[0].style); // CSSFunctionDescriptors
console.log(cssFunc.cssRules[0].style.length);
console.log(cssFunc.cssRules[0].style.result);
```

### Nhiều `CSSFunctionDeclarations`

Trong ví dụ này, chúng ta cho thấy cách một at-rule `@media` được chèn vào giữa một tập hợp khai báo gây ra hai đối tượng `CSSFunctionDeclarations` được tạo ra.

#### CSS

```css live-sample___multiple-cssfunctiondeclarations
@function --bar() {
  --x: 42;
  result: var(--y);
  @media (width > 1000px) {
    /* ... */
  }
  --y: var(--x);
}
```

#### JavaScript

```js live-sample___multiple-cssfunctiondeclarations
// Get a CSSFunctionRule
const cssFunc = document.getElementById("css-output").sheet.cssRules[0];

// Accessing both CSSFunctionDeclarations
console.log(cssFunc.cssRules);
```

```js live-sample___multiple-cssfunctiondeclarations
console.log(cssFunc.cssRules[0]); // First CSSFunctionDeclarations
console.log(cssFunc.cssRules[0].style); // CSSFunctionDescriptors
console.log(cssFunc.cssRules[0].style.result);

console.log(cssFunc.cssRules[2]); // Second CSSFunctionDeclarations
console.log(cssFunc.cssRules[2].style); // CSSFunctionDescriptors
console.log(cssFunc.cssRules[2].style.result);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@function")}}
- {{domxref("CSSFunctionRule")}}
- {{domxref("CSSFunctionDescriptors")}}
