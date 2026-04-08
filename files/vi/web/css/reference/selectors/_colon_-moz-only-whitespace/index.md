---
title: :-moz-only-whitespace
slug: Web/CSS/Reference/Selectors/:-moz-only-whitespace
page-type: css-pseudo-class
status:
  - non-standard
browser-compat: css.selectors.-moz-only-whitespace
sidebar: cssref
---

{{Non-standard_header}}

> [!NOTE]
> Trong [Selectors Level 4](https://drafts.csswg.org/selectors-4/#the-empty-pseudo), bộ chọn {{CSSxRef(":empty")}} đã được thay đổi để hoạt động giống như `:-moz-only-whitespace`, nhưng hiện tại chưa có trình duyệt nào hỗ trợ điều này.

**`:-moz-only-whitespace`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) khớp với các phần tử chỉ chứa các nút văn bản mà chỉ có {{Glossary("whitespace")}}. (Điều này bao gồm các phần tử có nút văn bản rỗng và các phần tử không có nút con.)

## Cú pháp

```css
:-moz-only-whitespace {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản về :-moz-only-whitespace

#### HTML

```html-nolint
<div> </div>
```

#### CSS

```css
div {
  border: 4px solid red;
}

:-moz-only-whitespace {
  border-color: lime;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_-moz-only-whitespace_example', '100%', 50)}}

## Thông số kỹ thuật

Được định nghĩa ngắn gọn là `:blank` trong [Selectors Level 4](https://drafts.csswg.org/selectors-4/#changes-2018-02), nhưng sau đó chức năng này đã được hợp nhất vào {{CSSxRef(":empty")}} và {{CSSxRef(":blank")}} được định nghĩa lại để chỉ {{HTMLElement("input")}} trống.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":blank")}}
- {{CSSxRef(":empty")}}
