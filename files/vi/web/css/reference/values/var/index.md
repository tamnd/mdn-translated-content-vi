---
title: var()
slug: Web/CSS/Reference/Values/var
page-type: css-function
browser-compat: css.types.var
sidebar: cssref
---

Hàm **`var()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) có thể được dùng để chèn giá trị của một [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) (đôi khi còn được gọi là "biến CSS") thay cho bất kỳ phần nào của giá trị của một thuộc tính khác.

{{InteractiveExample("CSS Demo: var()")}}

```css interactive-example-choice
border-color: var(--color-a);
```

```css interactive-example-choice
border-color: var(--color-b);
```

```css interactive-example-choice
border-color: var(--color-c);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
    Three color options have been set on the :root use these to change the
    border color.
  </div>
</section>
```

```css interactive-example
:root {
  --color-a: pink;
  --color-b: green;
  --color-c: rebeccapurple;
}

#example-element {
  border: 10px solid black;
  padding: 10px;
}
```

Hàm `var()` không thể được dùng trong tên thuộc tính, bộ chọn hoặc bất kỳ thứ gì khác ngoài giá trị thuộc tính. (Làm như vậy thường tạo ra cú pháp không hợp lệ, hoặc một giá trị mà ý nghĩa của nó không liên quan đến biến.)

## Cú pháp

```css
/* Cách dùng cơ bản */
var(--custom-prop);

/* Với giá trị dự phòng */
var(--custom-prop,);  /* giá trị rỗng làm dự phòng */
var(--custom-prop, initial); /* giá trị khởi tạo của thuộc tính làm dự phòng */
var(--custom-prop, red);
var(--custom-prop, var(--default-value));
var(--custom-prop, var(--default-value, red));
```

Đối số đầu tiên của hàm là tên của thuộc tính tùy chỉnh cần thay thế. Đối số thứ hai tùy chọn của hàm đóng vai trò là giá trị dự phòng. Nếu thuộc tính tùy chỉnh được tham chiếu bởi đối số đầu tiên không được định nghĩa hoặc bằng một [từ khóa toàn CSS](/vi/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords), hàm sẽ sử dụng giá trị thứ hai.

Cú pháp của giá trị dự phòng, giống như cú pháp của thuộc tính tùy chỉnh, cho phép dấu phẩy. Ví dụ, `var(--foo, red, blue)` định nghĩa giá trị dự phòng là `red, blue`; tức là, bất cứ thứ gì giữa dấu phẩy đầu tiên và cuối hàm đều được coi là giá trị dự phòng.

### Giá trị

- `<custom-property-name>`
  - : Tên của một thuộc tính tùy chỉnh được biểu diễn bằng một định danh bắt đầu bằng hai dấu gạch ngang. Thuộc tính tùy chỉnh chỉ được dùng bởi tác giả và người dùng; CSS sẽ không bao giờ gán cho chúng ý nghĩa nào khác ngoài những gì được trình bày ở đây.

- `<declaration-value>`
  - : Giá trị dự phòng của thuộc tính tùy chỉnh, được dùng trong trường hợp thuộc tính tùy chỉnh không được định nghĩa hoặc bằng một [từ khóa toàn CSS](/vi/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords). Giá trị này có thể chứa bất kỳ ký tự nào trừ một số ký tự có ý nghĩa đặc biệt như ký tự xuống dòng, dấu ngoặc đóng không khớp, tức là `)`, `]`, hoặc `}`, dấu chấm phẩy cấp cao nhất, hoặc dấu chấm than. Bản thân giá trị dự phòng có thể là thuộc tính tùy chỉnh sử dụng cú pháp `var()`. Nếu giá trị dự phòng bị bỏ qua và thuộc tính tùy chỉnh không được định nghĩa, hàm `var()` sẽ phân giải thành [giá trị không hợp lệ](#invalid_values).

    > [!NOTE]
    > `var(--a,)` là hợp lệ, chỉ định rằng nếu thuộc tính tùy chỉnh `--a` không được định nghĩa hoặc bằng một [từ khóa toàn CSS](/vi/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords), thì `var()` sẽ được thay thế bằng không có gì.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng thuộc tính tùy chỉnh được đặt trên :root

#### CSS

```css
:root {
  --main-bg-color: pink;
}

body {
  background-color: var(--main-bg-color);
}
```

#### Kết quả

{{EmbedLiveSample("Using a custom property set on :root")}}

Ở đây, giá trị của thuộc tính `background-color` đã được đặt thông qua thuộc tính tùy chỉnh `--main-bg-color`. Vì vậy, màu nền của phần thân HTML sẽ là màu hồng.

### Sử dụng thuộc tính tùy chỉnh trước khi nó được đặt

#### CSS

```css
body {
  background-color: var(--main-bg-color);
}

:root {
  --main-bg-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Using a custom property before it is set")}}

Trong ví dụ này, màu nền của phần thân HTML sẽ là màu hồng ngay cả khi thuộc tính tùy chỉnh được đặt sau.

### Sử dụng thuộc tính tùy chỉnh được đặt trong tệp khác

#### HTML

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="1.css" />
    <link rel="stylesheet" href="2.css" />
  </head>
  <body></body>
</html>
```

#### CSS

```css
/* 1.css */
body {
  background-color: var(--main-bg-color);
}
```

```css
/* 2.css */
:root {
  --main-bg-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Using a custom property set in another file")}}

Màu nền của phần thân HTML sẽ là màu hồng trong trường hợp này ngay cả khi thuộc tính tùy chỉnh được khai báo trong tệp khác.

### Thuộc tính tùy chỉnh với giá trị dự phòng để dùng khi thuộc tính chưa được đặt

#### HTML

```html
<div class="component">
  <h1 class="header">Header</h1>
  <p class="text">Text</p>
</div>
```

#### CSS

```css
/* In the component's style: */
.component .header {
  /* header-color isn't set, and so remains blue, the fallback value */
  color: var(--header-color, blue);
}

.component .text {
  color: var(--text-color, black);
}

/* In the larger application's style: */
.component {
  --text-color: #008800;
}
```

#### Kết quả

{{EmbedLiveSample("Custom properties with fallbacks for use when the property has not been set")}}

Vì `--header-color` không được đặt, văn bản "Header" sẽ có màu xanh lam, giá trị dự phòng.

### Sử dụng thuộc tính tùy chỉnh làm giá trị dự phòng

#### CSS

```css
:root {
  --backup-bg-color: teal;
}

body {
  background-color: var(--main-bg-color, var(--backup-bg-color, white));
}
```

#### Kết quả

{{EmbedLiveSample("Using a custom property as a fallback")}}

Vì `--main-bg-color` không được đặt, `background-color` của body sẽ dự phòng về `--backup-bg-color`, là màu teal.

### Giá trị không hợp lệ

Hàm `var()` có thể phân giải thành các giá trị không hợp lệ nếu:

- Thuộc tính tùy chỉnh không được định nghĩa và không có giá trị dự phòng được cung cấp.
- Thuộc tính tùy chỉnh được định nghĩa nhưng giá trị của nó là giá trị không hợp lệ cho thuộc tính mà nó được dùng trong đó.

Khi điều này xảy ra, thuộc tính được xử lý như thể nó có giá trị {{cssxref("unset")}}. Điều này là vì các biến không thể "thất bại sớm" như các lỗi cú pháp khác có thể, vì vậy đến thời điểm user agent nhận ra giá trị thuộc tính là không hợp lệ, nó đã loại bỏ các giá trị cascade khác.

Ví dụ:

#### HTML

```html
<p class="p1">Undefined variable</p>
<p class="p2">Invalid variable</p>
<p class="p3">Invalid literal color</p>
```

#### CSS

```css
p {
  color: red;
}

.p1 {
  color: var(--invalid-color);
}

.p2 {
  --invalid-color: 20px;
  color: var(--invalid-color);
}

.p3 {
  color: 20px;
}
```

#### Kết quả

{{EmbedLiveSample("Invalid values")}}

Lưu ý cách các đoạn văn sử dụng `var()` được đặt lại về màu đen mặc định, nhưng đoạn văn có màu ký tự không hợp lệ vẫn là màu đỏ, vì khai báo `color: 20px` đơn giản là bị bỏ qua.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("env","env(…)")}} – các biến môi trường chỉ đọc được kiểm soát bởi user-agent.
- [Sử dụng thuộc tính tùy chỉnh CSS (biến)](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties)
- At-rule {{cssxref("@property")}}
- [Đăng ký thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- Module [Thuộc tính tùy chỉnh CSS cho biến cascade](/vi/docs/Web/CSS/Guides/Cascading_variables)
