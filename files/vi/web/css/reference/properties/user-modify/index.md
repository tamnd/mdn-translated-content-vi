---
title: user-modify
slug: Web/CSS/Reference/Properties/user-modify
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.user-modify
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

Thuộc tính **`user-modify`** không có hiệu lực trong Firefox. Ban đầu nó được dự định để xác định liệu nội dung của một phần tử có thể được chỉnh sửa bởi người dùng hay không.

> [!WARNING]
> Thuộc tính này đã được thay thế bởi thuộc tính [`contenteditable`](/vi/docs/Web/HTML/Reference/Global_attributes/contenteditable).

## Cú pháp

```css
/* Giá trị từ khóa */
user-modify: read-only;
user-modify: read-write;
user-modify: write-only;

/* Giá trị toàn cục */
user-modify: inherit;
user-modify: initial;
user-modify: revert;
user-modify: unset;
```

Thuộc tính `-moz-user-modify` được chỉ định là một trong các giá trị từ khóa từ danh sách dưới đây.

### Giá trị

- `read-only`
  - : Giá trị mặc định. Nội dung chỉ đọc.
- `read-write`
  - : Người dùng có thể đọc và ghi nội dung.
- `read-write-plaintext-only`
  - : Giống như `read-write`, nhưng định dạng văn bản phong phú sẽ bị mất.
- `write-only`
  - : Người dùng có thể chỉnh sửa nội dung nhưng không thể đọc nó.

## Cú pháp chính thức

{{CSSSyntaxRaw(`user-modify = read-only | read-write | read-write-plaintext-only | write-only`)}}

## Ví dụ

### HTML

```html
<div class="readwrite">Người dùng có thể thay đổi văn bản này.</div>
```

### CSS

```css
.readwrite {
  -moz-user-modify: read-write;
  -webkit-user-modify: read-write;
}
```

## Thông số kỹ thuật

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("-moz-user-focus")}}
- {{CSSxRef("-moz-user-input")}}
- {{CSSxRef("user-select", "-moz-user-select")}}
