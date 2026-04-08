---
title: CSS combinators
short-title: Combinators
slug: Web/CSS/Reference/Selectors/Combinators
page-type: listing-page
sidebar: cssref
---

**Bộ kết hợp** CSS xác định các mối quan hệ giữa các [bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors). Chúng cho phép bạn chọn các phần tử dựa trên mối quan hệ của chúng với các phần tử khác trong cây tài liệu.

Ví dụ, để chỉ áp dụng kiểu cho các phần tử đoạn văn là phần tử con trực tiếp của một {{HTMLElement("div")}}, bạn có thể dùng bộ kết hợp con (`>`):

```css
/* Set top margin on <p> elements that are direct children of <div> */
div > p {
  margin-top: 0;
}
```

## Cú pháp

```css
/* Combine selectors to express relationships */
selector1 combinator selector2 {
  property: value;
}
```

## Danh sách bộ kết hợp

- [Bộ kết hợp con (`>`)](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator)
- [Bộ kết hợp cột (`||`)](/en-US/docs/Web/CSS/Reference/Selectors/Column_combinator)
- [Bộ kết hợp hậu duệ (" ")](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator)
- [Bộ kết hợp anh/chị em liền kề (`+`)](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator)
- [Bộ kết hợp anh/chị em tiếp theo (`~`)](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator)

## Xem thêm

- Mô-đun [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
- [Bộ chọn và bộ kết hợp](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
