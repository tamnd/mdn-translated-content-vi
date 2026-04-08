---
title: ::grammar-error
slug: Web/CSS/Reference/Selectors/::grammar-error
page-type: css-pseudo-element
browser-compat: css.selectors.grammar-error
sidebar: cssref
---

Phần tử giả **`::grammar-error`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho một đoạn văn bản mà {{glossary("user agent")}} đã đánh dấu là sai ngữ pháp.

Phần tử giả `::grammar-error` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

## Các thuộc tính được phép sử dụng

Chỉ một tập hợp nhỏ các thuộc tính CSS có thể được dùng trong quy tắc có `::grammar-error` trong bộ chọn:

- {{cssxref("color")}}
- {{cssxref("background-color")}}
- {{cssxref("cursor")}}
- {{cssxref("caret-color")}}
- {{cssxref("outline")}} và các thuộc tính dài hạn của nó
- {{cssxref("text-decoration")}} và các thuộc tính liên quan
- {{cssxref("text-emphasis-color")}}
- {{cssxref("text-shadow")}}

## Cú pháp

```css
::grammar-error {
  /* ... */
}
```

## Ví dụ

### Kiểm tra ngữ pháp tài liệu cơ bản

Trong ví dụ này, các trình duyệt hỗ trợ sẽ làm nổi bật bất kỳ lỗi ngữ pháp nào được phát hiện với các kiểu được hiển thị.

#### HTML

```html
<p contenteditable spellcheck="true">
  My friends is coming to the party tonight.
</p>
```

#### CSS

```css
::grammar-error {
  text-decoration: underline red;
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_document_grammar_check', '100%', 60)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::spelling-error")}}
- {{cssxref("text-decoration-line")}}
