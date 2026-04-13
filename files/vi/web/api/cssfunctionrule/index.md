---
title: CSSFunctionRule
slug: Web/API/CSSFunctionRule
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSFunctionRule
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Giao diện **`CSSFunctionRule`** của [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho các [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) CSS {{cssxref("@function")}} (hàm tùy chỉnh).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("CSSGroupingRule")}}._

- {{domxref("CSSFunctionRule.name")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về chuỗi đại diện cho tên của hàm tùy chỉnh.
- {{domxref("CSSFunctionRule.returnType")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về chuỗi đại diện cho kiểu trả về của hàm tùy chỉnh.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("CSSGroupingRule")}}._

- {{domxref("CSSFunctionRule.getParameters()")}} {{experimental_inline}}
  - : Trả về mảng các đối tượng đại diện cho các tham số của hàm tùy chỉnh.

## Ví dụ

### Sử dụng cơ bản `CSSFunctionRule`

Trong ví dụ này, chúng ta định nghĩa một hàm CSS tùy chỉnh và sau đó truy cập nó bằng CSSOM.

#### CSS

CSS của chúng ta định nghĩa một hàm tùy chỉnh bằng at-rule {{cssxref("@function")}}. Hàm được gọi là `--lighter()` và xuất ra phiên bản sáng hơn của màu đầu vào. `--lighter()` nhận hai tham số, {{cssxref("&lt;color&gt;")}} và {{cssxref("&lt;number&gt;")}}. Nó trả về màu {{cssxref("color_value/oklch", "oklch()")}} được tạo bằng [cú pháp màu tương đối](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors); màu đầu vào được chuyển thành màu `oklch()` và kênh độ sáng của nó tăng lên theo số đầu vào.

```css live-sample___cssfunctionrule-basics
@function --lighter(--color <color>, --lightness-adjust <number>: 0.2) returns
  <color> {
  result: oklch(from var(--color) calc(l + var(--lightness-adjust)) c h);
}
```

#### JavaScript

Script của chúng ta bắt đầu bằng cách lấy tham chiếu đến bảng kiểu được gắn vào tài liệu bằng {{domxref("HTMLStyleElement.sheet")}}, sau đó lấy tham chiếu đến quy tắc duy nhất trong bảng kiểu, là `CSSFunctionRule`, thông qua {{domxref("CSSStylesheet.cssRules")}}. Sau đó chúng ta ghi mỗi thành viên `CSSFunctionRule` vào console.

```js live-sample___cssfunctionrule-basics
// Get a CSSFunctionRule
const cssFunc = document.getElementById("css-output").sheet.cssRules[0];

// Accessing CSSFunctionRule members
console.log(cssFunc.name);
console.log(cssFunc.returnType);
console.log(cssFunc.getParameters());
```

- Thuộc tính `name` bằng `--lighter`.
- Thuộc tính `returnType` bằng `<color>`.
- Phương thức `getParameters()` trả về mảng trông như thế này:
  ```js
  [
    { name: "--color", type: "<color>" },
    { defaultValue: "0.2", name: "--lightness-adjust", type: "<number>" },
  ];
  ```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@function")}}
- {{domxref("CSSFunctionDescriptors")}}
- {{domxref("CSSFunctionDeclarations")}}
