---
title: :heading
slug: Web/CSS/Reference/Selectors/:heading
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.heading
sidebar: cssref
---

{{SeeCompatTable}}

**`:heading`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) khớp với tất cả [phần tử tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) trong tài liệu.

## Cú pháp

```css
:heading {
  /* ... */
}
```

## Mô tả

Lớp giả `:heading` cho phép bạn áp dụng kiểu cho tất cả các tiêu đề cùng lúc, thay vì phải khớp và tạo kiểu cho từng tiêu đề riêng lẻ.

Lớp giả này chỉ khớp với những phần tử được mặc định nhận diện về mặt ngữ nghĩa là tiêu đề (`<h1>` đến `<h6>`). Các phần tử có [`role="heading"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role) sẽ không được khớp; bạn có thể chọn chúng bằng cách dùng [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[role="heading"]`.

Lớp giả `:heading` có cùng [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#how_is_specificity_calculated) với bộ chọn lớp, tức là `0-1-0`. Vì vậy `:heading` có độ đặc hiệu `0-1-0`, trong khi `h1, h2, h3, h4, h5, h6` có độ đặc hiệu `0-0-1` và `section:heading` có độ đặc hiệu `0-1-1`.

## Ví dụ

### Tạo kiểu cho tất cả tiêu đề

Trong ví dụ này, chúng ta dùng lớp giả `:heading` để tạo kiểu cho nhiều cấp độ tiêu đề.

#### HTML

Tài liệu chứa các tiêu đề ở ba cấp độ khác nhau, cùng với các phần tử đoạn văn {{htmlelement("p")}}.

```html
<h1>Mastering CSS</h1>
<h2>Chapter 1: Selectors</h2>
<p>
  A CSS selector is the part of a CSS rule that describes what elements in a
  document the rule will match.
</p>
<h3>1.1 Pseudo-classes</h3>
<p>
  CSS pseudo-classes enable selecting elements based on information that lies
  outside of the document tree.
</p>
```

#### CSS

Chúng ta đặt các phần tử tiêu đề thành in nghiêng và màu đỏ cà chua.

```css
:heading {
  color: tomato;
  font-style: italic;
}
```

#### Kết quả

{{EmbedLiveSample("styling_all_headings", "", "170")}}

Lớp giả `:heading` áp dụng {{cssxref("color")}} và {{cssxref("font-style")}} cho tất cả các tiêu đề trong tài liệu, nhưng không áp dụng cho các đoạn văn:

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`:heading()`](/en-US/docs/Web/CSS/Reference/Selectors/:heading_function)
