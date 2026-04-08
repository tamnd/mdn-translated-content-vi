---
title: rule-list
slug: Web/CSS/Reference/Values/rule-list
page-type: css-type
spec-urls: https://drafts.csswg.org/css-syntax-3/#typedef-rule-list
sidebar: cssref
---

Kiểu dữ liệu **`<rule-list>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một chuỗi **không hoặc nhiều quy tắc CSS**. Nó được sử dụng để xác định các vị trí trong CSS nơi có thể xuất hiện nhiều quy tắc, chẳng hạn như cấp cao nhất của một stylesheet hoặc bên trong các at-rule nhóm như `@media` hoặc `@supports`.

`<rule-list>` không được viết trực tiếp. Thay vào đó, nó mô tả cách trình phân tích CSS thu thập và diễn giải các quy tắc bên trong một khối hoặc stylesheet.

## Cú pháp

`<rule-list>` được xác định là một chuỗi **không hoặc nhiều**:

- **Quy tắc kiểu** (ví dụ: `p { color: red; }`).
- **At-rule đủ tiêu chuẩn** (ví dụ: `@media (width < 600px) { ... }`).
- **Câu lệnh bị bỏ qua** (ví dụ: các lỗi phân tích được xử lý bởi trình phân tích, mà trình phân tích tự động bỏ qua).

Tất cả khoảng trắng, chú thích và các cấu trúc không hợp lệ hoặc bị lỗi đều được xử lý theo các quy tắc phân tích CSS.

## Mô tả

Kiểu `<rule-list>` xuất hiện trong đặc tả ở bất cứ đâu CSS được xác định để chứa "danh sách các quy tắc".

Ví dụ bao gồm:

- **Cấp cao nhất** của một stylesheet.
- Phần thân của **các at-rule nhóm** như `@media`, `@custom-media`, `@supports`, `@layer`, `@container`.
- Nội dung của **bộ chọn lồng nhau** (CSS Nesting).

Mặc dù các tác giả không thể viết `<rule-list>` một cách rõ ràng, việc hiểu nó rất quan trọng khi diễn giải cách CSS phân tích các cấu trúc lồng nhau, cách các quy tắc không hợp lệ bị loại bỏ, và cách cascade hình thành trong các khối có điều kiện.

## Ví dụ

### `<rule-list>` trong một stylesheet

Stylesheet sau được xử lý như một `<rule-list>` chứa hai quy tắc kiểu và một at-rule.

```css
p {
  margin: 0;
}

h1 {
  font-size: 2rem;
}

@media (width < 600px) {
  body {
    background: lightgray;
  }
}
```

### `<rule-list>` bên trong at-rule `@media`

Khối chứa bên trong at-rule `@media` là một `<rule-list>` chứa một hoặc nhiều quy tắc kiểu. Ví dụ sau chứa hai quy tắc kiểu.

```css
@media (prefers-color-scheme: dark) {
  main {
    background: black;
    color: white;
  }

  a {
    color: skyblue;
  }
}
```

### Các quy tắc không hợp lệ bên trong `<rule-list>`

Chuỗi token không hợp lệ (`!invalid-rule`) bị trình phân tích bỏ qua. Phần còn lại của các quy tắc tạo thành một `<rule-list>` hợp lệ.

```plain
body {
  color: black;
}

!invalid-rule

@supports (display: grid) {
  section {
    display: grid;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- At-rule CSS {{cssxref("@supports")}}
- At-rule CSS {{cssxref("@media")}}
- At-rule CSS {{cssxref("@custom-media")}}
