---
title: -moz-user-focus
slug: Web/CSS/Reference/Properties/-moz-user-focus
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.-moz-user-focus
sidebar: cssref
---

{{deprecated_header}}{{non-standard_header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-moz-user-focus`** được dùng để chỉ định liệu một phần tử có thể nhận focus hay không.

Bằng cách đặt giá trị thành `ignore`, bạn có thể vô hiệu hóa việc focus vào phần tử, nghĩa là người dùng sẽ không thể kích hoạt phần tử đó, và phần tử sẽ bị bỏ qua trong trình tự Tab.
Giá trị mặc định là `none`, sẽ vô hiệu hóa focus vào phần tử và xóa focus khỏi các phần tử khác nếu có cố gắng chọn phần tử.

## Cú pháp

```css
/* Giá trị từ khóa */
-moz-user-focus: none;
-moz-user-focus: normal;
-moz-user-focus: ignore;

/* Giá trị toàn cục */
-moz-user-focus: inherit;
-moz-user-focus: initial;
-moz-user-focus: unset;
```

### Giá trị

- `ignore`
  - : Phần tử không nhận focus từ bàn phím và sẽ bị bỏ qua trong thứ tự Tab.
- `normal`
  - : Phần tử có thể nhận focus từ bàn phím.
- `none`
  - : Phần tử không nhận focus từ bàn phím.
    Cố gắng chọn phần tử sẽ xóa focus khỏi bất kỳ phần tử nào khác.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-moz-user-focus = ignore | normal | none`)}}

## Ví dụ

### HTML

```html
<input class="ignored" value="Người dùng không thể focus vào phần tử này." />
```

### CSS

```css
.ignored {
  -moz-user-focus: ignore;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("-moz-user-input")}}
- {{cssxref("user-modify")}}
- {{cssxref("user-select", "-moz-user-select")}}
