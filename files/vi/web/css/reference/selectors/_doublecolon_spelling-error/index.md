---
title: ::spelling-error
slug: Web/CSS/Reference/Selectors/::spelling-error
page-type: css-pseudo-element
browser-compat: css.selectors.spelling-error
sidebar: cssref
---

Phần tử giả **`::spelling-error`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho một đoạn văn bản mà {{glossary("user agent")}} đã đánh dấu là sai chính tả.

Phần tử giả `::spelling-error` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

## Các thuộc tính được phép sử dụng

Chỉ một tập hợp nhỏ các thuộc tính CSS có thể được dùng trong quy tắc có `::spelling-error` trong bộ chọn:

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
::spelling-error {
  /* ... */
}
```

## Ví dụ

### Kiểm tra chính tả tài liệu cơ bản

Trong ví dụ này, các trình duyệt hỗ trợ sẽ làm nổi bật bất kỳ lỗi chính tả nào được phát hiện với các kiểu được hiển thị.

#### HTML

```html
<p contenteditable spellcheck="true">
  My friends are coegdfgfddffbgning to the party tonight.
</p>
```

#### CSS

```css
::spelling-error {
  text-decoration: wavy red underline;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_document_spell_check', '100%', 60)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::grammar-error")}}
- {{cssxref("text-decoration-line")}}
