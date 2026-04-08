---
title: :heading()
slug: Web/CSS/Reference/Selectors/:heading_function
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.headingfunction
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`:heading()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho tất cả [phần tử tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) có cấp độ khớp với danh sách số nguyên được phân cách bằng dấu phẩy. Điều này cho phép bạn tạo kiểu cho các phần tử ở các cấp tiêu đề cụ thể cùng một lúc, thay vì phải khớp và tạo kiểu cho từng phần tử riêng lẻ.

> [!NOTE]
> Lớp giả hàm `:heading()` có cùng [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#how_is_specificity_calculated) với bộ chọn lớp, tức là `0-1-0`. Ví dụ, `section:heading()` có độ đặc hiệu là `0-1-1`.

## Cú pháp

```css-nolint
:heading( <integer># ) {
  /* ... */
}
```

### Tham số

Hàm lớp giả `:heading()` nhận một danh sách {{cssxref("&lt;integer&gt;")}} được phân cách bằng dấu phẩy, đại diện cho các cấp tiêu đề cần tạo kiểu.

## Ghi chú sử dụng

Lớp giả hàm `:heading()` chỉ khớp với các phần tử được nhận diện về mặt ngữ nghĩa là tiêu đề. Nó không khớp với các phần tử sử dụng thuộc tính [`role="heading"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role) hoặc ['aria-level'](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level).

Cấp tiêu đề được dùng bởi `:heading()` có thể khác với [bộ chọn kiểu](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) của phần tử trong trường hợp trình duyệt tính toán cấp tiêu đề hiển thị khác. Ví dụ, `h1:heading(3)` sẽ khớp với bất kỳ phần tử `<h1>` nào được hiển thị là tiêu đề cấp 3.

## Ví dụ

### Chọn các cấp tiêu đề cụ thể

Trong ví dụ này, một danh sách giá trị được phân cách bằng dấu phẩy được dùng để nhắm mục tiêu các tiêu đề ở cấp lẻ (`<h1>` và `<h3>`) và cấp chẵn (`<h2>` và `<h4>`).

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
```

```css
:heading(1, 3) {
  color: tomato;
}
:heading(2, 4) {
  color: slateblue;
}
```

{{EmbedLiveSample("selecting_specific_heading_levels", "", "215")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":heading")}}
