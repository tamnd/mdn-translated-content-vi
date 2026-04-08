---
title: Selector list
slug: Web/CSS/Reference/Selectors/Selector_list
page-type: css-selector
browser-compat: css.selectors.list
sidebar: cssref
---

**Danh sách bộ chọn** CSS (`,`) chọn tất cả các nút khớp. Danh sách bộ chọn là một danh sách các bộ chọn được phân cách bằng dấu phẩy.

## Mô tả

Khi nhiều bộ chọn chia sẻ cùng các khai báo, chúng có thể được nhóm lại thành một danh sách phân cách bằng dấu phẩy. Danh sách bộ chọn cũng có thể được truyền dưới dạng tham số cho một số pseudo-class CSS hàm. Khoảng trắng có thể xuất hiện trước và/hoặc sau dấu phẩy.

Ba khai báo sau đây tương đương nhau:

```css
span {
  border: red 2px solid;
}
div {
  border: red 2px solid;
}
```

```css
span,
div {
  border: red 2px solid;
}
```

```css
:is(span, div) {
  border: red 2px solid;
}
```

## Ví dụ

Khi áp dụng các kiểu giống nhau cho các phần tử khớp với các tiêu chí khác nhau, việc nhóm các bộ chọn trong một danh sách phân cách bằng dấu phẩy có thể cải thiện tính nhất quán trong khi giảm kích thước style sheet.

### Nhóm một dòng

Ví dụ này hiển thị cách nhóm các bộ chọn trong một dòng sử dụng danh sách phân cách bằng dấu phẩy.

```css-nolint
h1, h2, h3, h4, h5, h6 {
  font-family: "Helvetica", "Arial";
}
```

### Nhóm nhiều dòng

Ví dụ này hiển thị cách nhóm các bộ chọn trong nhiều dòng sử dụng danh sách phân cách bằng dấu phẩy.

```css
#main,
.content,
article,
h1 + p {
  font-size: 1.1em;
}
```

## Danh sách bộ chọn hợp lệ và không hợp lệ

Bộ chọn không hợp lệ đại diện, và do đó không khớp với bất kỳ thứ gì. Khi một danh sách bộ chọn chứa bộ chọn không hợp lệ, toàn bộ khối kiểu bị bỏ qua, ngoại trừ các pseudo-class {{cssxref(":is()")}} và {{cssxref(":where()")}} chấp nhận [danh sách bộ chọn tha thứ](#forgiving_selector_list).

### Danh sách bộ chọn không hợp lệ

Nhược điểm của việc sử dụng danh sách bộ chọn là một bộ chọn không được hỗ trợ trong danh sách bộ chọn sẽ làm vô hiệu toàn bộ quy tắc.

Xem xét hai bộ quy tắc CSS sau:

```css
h1 {
  font-family: sans-serif;
}
h2:invalid-pseudo {
  font-family: sans-serif;
}
h3 {
  font-family: sans-serif;
}
```

```css
h1,
h2:invalid-pseudo,
h3 {
  font-family: sans-serif;
}
```

Chúng không tương đương. Trong bộ quy tắc đầu tiên, các kiểu sẽ được áp dụng cho các phần tử `h1` và `h3`, nhưng quy tắc `h2:invalid-pseudo` sẽ không được phân tích. Trong bộ quy tắc thứ hai, vì một bộ chọn trong danh sách không hợp lệ, toàn bộ quy tắc sẽ không được phân tích. Do đó, không có kiểu nào được áp dụng cho các phần tử `h1` và `h3`, vì khi bất kỳ bộ chọn nào trong danh sách các bộ chọn không hợp lệ, toàn bộ khối kiểu sẽ bị bỏ qua.

### Danh sách bộ chọn tha thứ

Một cách khắc phục vấn đề [danh sách bộ chọn không hợp lệ](#invalid_selector_list) là sử dụng pseudo-class {{cssxref(":is()")}} hoặc {{cssxref(":where()")}}, chấp nhận danh sách bộ chọn tha thứ. Mỗi bộ chọn trong danh sách bộ chọn tha thứ được phân tích riêng lẻ. Vì vậy, bất kỳ bộ chọn không hợp lệ nào trong danh sách đều bị bỏ qua và những bộ chọn hợp lệ được sử dụng.

Tiếp tục từ ví dụ trước, hai bộ quy tắc CSS sau hiện tương đương nhau:

```css
h1 {
  font-family: sans-serif;
}
h2:maybe-unsupported {
  font-family: sans-serif;
}
h3 {
  font-family: sans-serif;
}
```

```css
:is(h1, h2:maybe-unsupported, h3) {
  font-family: sans-serif;
}
```

Sự khác biệt giữa hai cách là specificity của `:is()` là đối số cụ thể nhất của nó, trong khi bộ chọn `:where()` và tham số danh sách bộ chọn tha thứ không thêm bất kỳ trọng số specificity nào.

### Danh sách bộ chọn tương đối

Danh sách bộ chọn tương đối là danh sách bộ chọn phân cách bằng dấu phẩy được phân tích như [bộ chọn tương đối](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#relative_selector), bắt đầu bằng một bộ kết hợp rõ ràng hoặc ngầm hiểu.

```css
h2:has(+ p, + ul.red) {
  font-style: italic;
}
```

Trong ví dụ trên, kiểu in nghiêng sẽ được áp dụng cho bất kỳ tiêu đề `h2` nào ngay lập tức theo sau bởi `<p>` hoặc `<ul class="red">`. Lưu ý rằng pseudo-element và bộ chọn `:has()` không hợp lệ trong danh sách bộ chọn tương đối [`:has()`](/en-US/docs/Web/CSS/Reference/Selectors/:has).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các pseudo-class [`:is()`](/en-US/docs/Web/CSS/Reference/Selectors/:is) và [`:where()`](/en-US/docs/Web/CSS/Reference/Selectors/:where) chấp nhận danh sách bộ chọn tha thứ.
- Pseudo-class [`:not()`](/en-US/docs/Web/CSS/Reference/Selectors/:not) chấp nhận danh sách bộ chọn thông thường.
- Pseudo-class [`:has()`](/en-US/docs/Web/CSS/Reference/Selectors/:has) chấp nhận danh sách bộ chọn tương đối.
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [Selectors and combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
