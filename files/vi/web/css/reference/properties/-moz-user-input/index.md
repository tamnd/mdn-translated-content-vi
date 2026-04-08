---
title: -moz-user-input
slug: Web/CSS/Reference/Properties/-moz-user-input
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.-moz-user-input
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

Trong các ứng dụng Mozilla, **`-moz-user-input`** xác định xem một phần tử có chấp nhận đầu vào của người dùng hay không.

Kể từ Firefox 60, thuộc tính này không còn có thể cấp cho phần tử khả năng chấp nhận đầu vào của người dùng nếu nó thường không làm vậy. Thuộc tính chỉ có thể dùng để vô hiệu hóa đầu vào người dùng.

Thuộc tính `user-input` hiện không có trong lộ trình tiêu chuẩn hóa.

## Cú pháp

```css
/* Giá trị từ khóa */
-moz-user-input: auto;
-moz-user-input: none;

/* Giá trị toàn cục */
-moz-user-input: inherit;
-moz-user-input: initial;
-moz-user-input: unset;
```

### Giá trị

- `auto`
  - : Phần tử sẽ phản hồi đầu vào người dùng nếu nó thường nhận đầu vào người dùng, ví dụ như {{HTMLElement("textarea")}}.
- `none`
  - : Phần tử không phản hồi đầu vào người dùng và không trở thành {{CSSxRef(":active")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-moz-user-input = auto | none`)}}

## Ví dụ

### Vô hiệu hóa đầu vào người dùng cho một phần tử

```css
input.example {
  /* Người dùng có thể chọn văn bản, nhưng không thể thay đổi nó. */
  -moz-user-input: none;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("-moz-user-focus")}}
- {{CSSxRef("user-modify", "-moz-user-modify")}}
- {{CSSxRef("user-select", "-moz-user-select")}}
