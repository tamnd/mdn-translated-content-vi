---
title: CSS reference
short-title: Reference
slug: Web/CSS/Reference
page-type: landing-page
sidebar: cssref
---

Sử dụng **tham chiếu CSS** này để duyệt qua [chỉ mục theo thứ tự bảng chữ cái](#index) của tất cả các [thuộc tính](/en-US/docs/Web/CSS/Reference/Properties), [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes), [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), [kiểu dữ liệu](/en-US/docs/Web/CSS/Reference/Values/Data_types), [ký hiệu hàm](/en-US/docs/Web/CSS/Reference/Values/Functions) và [at-rule](/en-US/docs/Web/CSS/Reference/At-rules) tiêu chuẩn của [CSS](/en-US/docs/Web/CSS). Bạn cũng có thể duyệt qua [các khái niệm CSS chính](#concepts) và danh sách [bộ chọn được tổ chức theo loại](#selectors). Ngoài ra còn có tham chiếu ngắn gọn về [DOM-CSS / CSSOM](#dom-css_cssom).

## Cú pháp quy tắc cơ bản

### Cú pháp quy tắc kiểu

```plain
style-rule ::=
    selectors-list {
      properties-list
    }
```

Trong đó:

```plain
selectors-list ::=
    selector[:pseudo-class] [::pseudo-element]
    [, selectors-list]

properties-list ::=
    [property : value] [; properties-list]
```

Xem chỉ mục của [_bộ chọn_](#selectors), [_lớp giả_](#pseudo), và _[phần tử giả](#pseudo)_ bên dưới. Cú pháp cho mỗi _giá trị_ được chỉ định phụ thuộc vào kiểu dữ liệu được định nghĩa cho mỗi _thuộc tính_ được chỉ định.

#### Ví dụ quy tắc kiểu

```css
strong {
  color: red;
}

div.menu-bar li:hover > ul {
  display: block;
}
```

Để có phần giới thiệu cấp độ người mới bắt đầu về cú pháp của bộ chọn, hãy xem [hướng dẫn về Bộ chọn CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors). Lưu ý rằng bất kỳ lỗi [cú pháp](/en-US/docs/Web/CSS/Guides/Syntax/Introduction) nào trong định nghĩa quy tắc sẽ làm mất hiệu lực toàn bộ quy tắc đó. Các quy tắc không hợp lệ bị trình duyệt bỏ qua. Lưu ý rằng định nghĩa quy tắc CSS hoàn toàn dựa trên [văn bản](https://drafts.csswg.org/css-syntax/#intro) (Unicode), trong khi DOM-CSS / CSSOM (hệ thống quản lý quy tắc) dựa trên [đối tượng](https://drafts.csswg.org/cssom/#introduction).

### Cú pháp at-rule

Do cấu trúc của at-rule thay đổi đáng kể, vui lòng xem [At-rule](/en-US/docs/Web/CSS/Reference/At-rules) để tìm cú pháp của at-rule cụ thể bạn muốn.

## Chỉ mục

> [!NOTE]
> Chỉ mục này không bao gồm các thuộc tính trình bày dành riêng cho SVG, có thể được sử dụng như các thuộc tính CSS trên các phần tử [SVG](/en-US/docs/Web/SVG).

> [!NOTE]
> Tên thuộc tính trong chỉ mục này **không** bao gồm các tên JavaScript khác với tên tiêu chuẩn CSS.

{{CSS_Ref}}

## Bộ chọn

Sau đây là các [bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors) khác nhau, cho phép các kiểu phụ thuộc vào nhiều tính năng khác nhau của các phần tử trong DOM.

### Bộ chọn cơ bản

**Bộ chọn cơ bản** là các bộ chọn cơ sở; đây là các bộ chọn cơ bản nhất thường được kết hợp để tạo ra các bộ chọn phức tạp hơn.

- [Bộ chọn phổ quát](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) `*`
- [Bộ chọn theo loại](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) `elementname`
- [Bộ chọn theo class](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) `.classname`
- [Bộ chọn theo ID](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors) `#idname`
- [Bộ chọn theo thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[attr=value]`

### Bộ chọn nhóm

- [Danh sách bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list) `A, B`
  - : Chỉ định rằng cả phần tử `A` và `B` đều được chọn. Đây là phương thức nhóm để chọn nhiều phần tử phù hợp.

### Bộ kết hợp

Bộ kết hợp là các bộ chọn thiết lập mối quan hệ giữa hai hoặc nhiều bộ chọn đơn giản, chẳng hạn như "`A` là con của `B`" hoặc "`A` ở liền kề với `B`", tạo ra một bộ chọn phức tạp.

- [Bộ kết hợp anh em kế tiếp](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator) `A + B`
  - : Chỉ định rằng các phần tử được chọn bởi cả `A` và `B` có cùng cha và phần tử được chọn bởi `B` ngay sau phần tử được chọn bởi `A` theo chiều ngang.
- [Bộ kết hợp anh em tiếp theo](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator) `A ~ B`
  - : Chỉ định rằng các phần tử được chọn bởi cả `A` và `B` có cùng cha và phần tử được chọn bởi `A` xuất hiện trước - nhưng không nhất thiết là ngay trước - phần tử được chọn bởi `B`.
- [Bộ kết hợp con trực tiếp](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator) `A > B`
  - : Chỉ định rằng phần tử được chọn bởi `B` là con trực tiếp của phần tử được chọn bởi `A`.
- [Bộ kết hợp hậu duệ](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator) `A B`
  - : Chỉ định rằng phần tử được chọn bởi `B` là hậu duệ của phần tử được chọn bởi `A`, nhưng không nhất thiết là con trực tiếp.
- [Bộ kết hợp cột](/en-US/docs/Web/CSS/Reference/Selectors/Column_combinator) `A || B` {{Experimental_Inline}}
  - : Chỉ định rằng phần tử được chọn bởi `B` nằm trong cột bảng được chỉ định bởi `A`. Các phần tử trải dài nhiều cột được coi là thành viên của tất cả các cột đó.

### Lớp giả và phần tử giả

- [Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) `:`
  - : Chỉ định trạng thái đặc biệt của các phần tử được chọn.
- [Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) `::`
  - : Đại diện cho các thực thể không được bao gồm trong HTML.

> [!CALLOUT]
>
> Xem thêm [bộ chọn trong đặc tả Selectors](https://drafts.csswg.org/selectors/) và [đặc tả pseudo-element](https://drafts.csswg.org/css-pseudo/).

## Khái niệm

### Cú pháp và ngữ nghĩa

- [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [At-rule](/en-US/docs/Web/CSS/Reference/At-rules)
- [Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Ghi chú (Comment)](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
- [Descriptor](/en-US/docs/Glossary/CSS_Descriptor)
- [Kế thừa (Inheritance)](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [Thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
- [Độ đặc hiệu (Specificity)](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Giá trị](/en-US/docs/Web/CSS/Reference/Values)
- [Cú pháp định nghĩa giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- [Giá trị và đơn vị CSS](/en-US/docs/Web/CSS/Guides/Values_and_units)
- [Ký hiệu hàm CSS](/en-US/docs/Web/CSS/Reference/Values/Functions)

### Giá trị

- [Giá trị thực tế](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Giá trị đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
- [Giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
- [Giá trị đã giải quyết](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#resolved_value)
- [Giá trị được chỉ định](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#specified_value)
- [Giá trị đã dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)

### Bố cục

- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Mô hình hộp (Box model)](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- [Containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- [Chế độ bố cục](/en-US/docs/Glossary/Layout_mode)
- [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- {{glossary("Replaced elements")}}
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)

## DOM-CSS / CSSOM

### Các loại đối tượng chính

- {{DOMxRef("Document.styleSheets")}}
- {{DOMxRef("HTMLElement.style")}}
- {{DOMxRef("Element.className")}}
- {{DOMxRef("Element.classList")}}
- {{DOMxRef("StyleSheetList")}}
- {{DOMxRef("CSSRuleList")}}
- {{DOMxRef("CSSRule")}}
- {{DOMxRef("CSSStyleRule")}}
- {{DOMxRef("CSSStyleDeclaration")}}

### Các phương thức quan trọng

- {{DOMxRef("CSSStyleSheet.insertRule()")}}
- {{DOMxRef("CSSStyleSheet.deleteRule()")}}

## Xem thêm

- [Phần mở rộng CSS của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) (có tiền tố `-moz-`)
- [Phần mở rộng CSS của WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) (chủ yếu có tiền tố `-webkit-`)

## Liên kết ngoài

- [CSS Indices (w3.org)](https://www.w3.org/TR/css/#indices)
