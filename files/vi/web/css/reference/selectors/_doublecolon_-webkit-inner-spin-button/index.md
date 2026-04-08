---
title: ::-webkit-inner-spin-button
slug: Web/CSS/Reference/Selectors/::-webkit-inner-spin-button
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-inner-spin-button
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-inner-spin-button`** trong [CSS](/en-US/docs/Web/CSS) được dùng để tạo kiểu cho phần bên trong của nút spinner (nút tăng/giảm) trên các phần tử input dạng number picker.

## Cú pháp

```css
::-webkit-inner-spin-button {
  /* ... */
}
```

## Ví dụ

Các ví dụ này chỉ hoạt động trên trình duyệt dựa trên WebKit và Blink.

### Thay đổi con trỏ trong các nút điều khiển spinner

Trong ví dụ này, CSS {{cssxref("cursor")}} được đổi thành `pointer` khi con trỏ di chuyển đến phần bên trong của các nút điều khiển spinner của input.

#### HTML

```html
<input type="number" />
```

#### CSS

```css
input[type="number"]::-webkit-inner-spin-button {
  cursor: pointer;
}
```

#### Kết quả

{{EmbedLiveSample("Changing_the_cursor_in_the_spin_controls", 200, 30)}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::-webkit-textfield-decoration-container")}}
- [Styling Form Controls – WebKit](https://trac.webkit.org/wiki/Styling%20Form%20Controls#inputelement)
