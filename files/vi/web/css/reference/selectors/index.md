---
title: CSS selectors
short-title: Selectors
slug: Web/CSS/Reference/Selectors
page-type: listing-page
spec-urls: https://drafts.csswg.org/selectors/
sidebar: cssref
---

**Bộ chọn CSS** là các mẫu được sử dụng trong [các quy tắc CSS](/vi/docs/Web/CSS/Guides/Syntax/Introduction#css_rulesets) để nhắm đến và chọn các phần tử cụ thể để tạo kiểu.

> [!NOTE]
> Trang này là chỉ mục của tất cả các bộ chọn trong CSS. Trang [bộ chọn CSS](/vi/docs/Web/CSS/Guides/Selectors) giới thiệu mô-đun xác định một số, nhưng không phải tất cả, các bộ chọn này.

Ví dụ, để tạo kiểu cho các đoạn văn, bạn sẽ sử dụng [bộ chọn kiểu](/vi/docs/Web/CSS/Reference/Selectors/Type_selectors) `p` để chọn tất cả các phần tử {{HTMLElement("p")}} và áp dụng kiểu cho chúng:

```css
/* Set font size on all <p> elements */
p {
  font-size: 12px;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Select elements and apply styles */
selector {
  property: value;
}
```

## Chỉ mục bộ chọn

- [Bộ chọn lồng nhau &](/vi/docs/Web/CSS/Reference/Selectors/Nesting_selector)
- [Bộ chọn thuộc tính](/vi/docs/Web/CSS/Reference/Selectors/Attribute_selectors)
- [Bộ chọn lớp](/vi/docs/Web/CSS/Reference/Selectors/Class_selectors)
- [Bộ chọn ID](/vi/docs/Web/CSS/Reference/Selectors/ID_selectors)
- [Bộ chọn keyframe](/vi/docs/Web/CSS/Reference/Selectors/Keyframe_selectors)
- [Dấu phân cách không gian tên (`|`)](/vi/docs/Web/CSS/Reference/Selectors/Namespace_separator)
- [Bộ chọn lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [Bộ chọn phần tử giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
- [Danh sách bộ chọn](/vi/docs/Web/CSS/Reference/Selectors/Selector_list)
- [Bộ chọn kiểu](/vi/docs/Web/CSS/Reference/Selectors/Type_selectors)
- [Bộ chọn toàn cục](/vi/docs/Web/CSS/Reference/Selectors/Universal_selectors)

## Thông số kỹ thuật

{{Specifications}}

Xem trang [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes#specifications) và [phần tử giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements#specifications) để biết các bảng thông số kỹ thuật tương ứng.

## Xem thêm

- Mô-đun [bộ chọn CSS](/vi/docs/Web/CSS/Guides/Selectors)
- [Cấu trúc bộ chọn CSS](/vi/docs/Web/CSS/Guides/Selectors/Selector_structure)
- [Bộ kết hợp CSS](/vi/docs/Web/CSS/Reference/Selectors/Combinators)
- [Danh sách bộ chọn](/vi/docs/Web/CSS/Reference/Selectors/Selector_list)
- [Bộ chọn và bộ kết hợp](/vi/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
- Mô-đun [phần tử giả CSS](/vi/docs/Web/CSS/Guides/Pseudo-elements)
- Mô-đun [lồng nhau CSS](/vi/docs/Web/CSS/Guides/Nesting)
- [Độ ưu tiên](/vi/docs/Web/CSS/Guides/Cascade/Specificity)
