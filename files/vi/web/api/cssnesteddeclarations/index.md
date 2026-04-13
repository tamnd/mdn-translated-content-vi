---
title: CSSNestedDeclarations
slug: Web/API/CSSNestedDeclarations
page-type: web-api-interface
browser-compat: api.CSSNestedDeclarations
---

{{APIRef("CSSOM")}}

Giao diện **`CSSNestedDeclarations`** của [CSS Rule API](/en-US/docs/Web/API/CSSRule) được sử dụng để nhóm các {{domxref("CSSRule")}} lồng nhau.

Giao diện này cho phép [CSS Object Model (CSSOM](/en-US/docs/Web/API/CSS_Object_Model) phản ánh cấu trúc của các tài liệu CSS có các quy tắc CSS lồng nhau, và đảm bảo rằng các quy tắc được phân tích và đánh giá theo thứ tự chúng được khai báo.

> [!NOTE]
> Các triển khai không hỗ trợ giao diện này có thể phân tích các quy tắc lồng nhau theo thứ tự sai.
> Xem [Tương thích trình duyệt](#browser_compatibility) để biết thêm thông tin.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ lớp tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSNestedDeclarations.style")}} {{ReadOnlyInline}}
  - : Trả về giá trị của các quy tắc lồng nhau.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa phương thức từ lớp tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

### CSS

CSS bên dưới bao gồm một bộ chọn `.foo` chứa hai khai báo và một media query.

```css
.foo {
  background-color: silver;
  @media screen {
    color: tomato;
  }
  color: black;
}
```

Điều này được đại diện bởi một số đối tượng JavaScript trong [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model):

- Đối tượng {{domxref("CSSStyleRule")}} đại diện cho quy tắc `background-color: silver`.
  Có thể được trả về qua `document.styleSheets[0].cssRules[0]`.
- Đối tượng {{domxref("CSSMediaRule")}} đại diện cho quy tắc `@media screen`, và có thể được trả về qua `document.styleSheets[0].cssRules[0].cssRules[0]`.
  - Đối tượng `CSSMediaRule` chứa đối tượng `CSSNestedDeclaration` đại diện cho quy tắc `color: tomato` được lồng bởi quy tắc `@media screen`.
    Có thể được trả về qua `document.styleSheets[0].cssRules[0].cssRules[0].cssRules[0]`.
- Quy tắc cuối cùng là đối tượng `CSSNestedDeclaration` đại diện cho quy tắc `color: black` trong stylesheet, và có thể được trả về qua `document.styleSheets[0].cssRules[0].cssRules[1]`.

> [!NOTE]
> Tất cả các kiểu cấp cao nhất sau `CSSNestedDeclaration` đầu tiên cũng phải được biểu diễn dưới dạng đối tượng `CSSNestedDeclaration` để tuân theo [quy tắc khai báo lồng nhau CSS](/en-US/docs/Web/CSS/Guides/Nesting/Using#nested_declarations_rule)

### CSSOM (CSS Object Model)

```plain
↳ CSSStyleRule
  .style
    - background-color: silver
  ↳ CSSMediaRule
    ↳ CSSNestedDeclarations
      .style (CSSStyleDeclaration, 1) =
      - color: tomato
  ↳ CSSNestedDeclarations
    .style (CSSStyleDeclaration, 1) =
      - color: black
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSNestedDeclarations.style")}}
- [Quy tắc khai báo lồng nhau](/en-US/docs/Web/CSS/Guides/Nesting/Using#nested_declarations_rule)
