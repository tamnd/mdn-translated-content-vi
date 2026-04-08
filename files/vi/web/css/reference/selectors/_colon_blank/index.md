---
title: :blank
slug: Web/CSS/Reference/Selectors/:blank
page-type: css-pseudo-class
status:
  - experimental
spec-urls: https://drafts.csswg.org/selectors/#blank-pseudo
sidebar: cssref
---

{{SeeCompatTable}}

> [!NOTE]
> Bộ chọn `:blank` được coi là có nguy cơ thay đổi, vì CSSWG liên tục sửa đổi nó.
>
> Xem [vấn đề CSSWG #1967](https://github.com/w3c/csswg-drafts/issues/1967).

**`:blank`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) chọn các phần tử nhập liệu của người dùng trống (ví dụ: {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}}).

## Cú pháp

```css
:blank {
  /* ... */
}
```

## Ví dụ

### Ví dụ :blank cơ bản

Trong các trình duyệt hỗ trợ trong tương lai, lớp giả `:blank` sẽ cho phép các nhà phát triển làm nổi bật theo một cách nào đó các điều khiển input không bắt buộc nhưng vẫn chưa có nội dung nào được điền vào, có thể như một lời nhắc nhở cho người dùng.

#### HTML

```html
<textarea></textarea>
```

#### CSS

```css
textarea:blank {
  border: 3px solid red;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_blank_example', '100%', 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- {{CSSxRef(":empty")}}
- Module [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
