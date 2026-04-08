---
title: "<dashed-function>: hàm tùy chỉnh CSS"
slug: Web/CSS/Reference/Values/dashed-function
page-type: css-type
status:
  - experimental
browser-compat: css.types.dashed-function
sidebar: cssref
---

{{SeeCompatTable}}

Kiểu dữ liệu **`<dashed-function>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu thị cú pháp dùng để gọi [hàm tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions), được định nghĩa bằng quy tắc at-rule {{cssxref("@function")}}.

## Cú pháp

Giá trị `<dashed-function>` bao gồm [`--tên-hàm`](/vi/docs/Web/CSS/Reference/At-rules/@function#--function-name), theo sau là dấu ngoặc đơn chứa các đối số của hàm (ví dụ: `--my-function(30px, 3)`).

Bạn có thể dùng giá trị `<dashed-function>` thay cho các giá trị thuộc tính CSS thông thường hoặc các thành phần giá trị thuộc tính, trong trường hợp bạn muốn tính toán động các giá trị dựa trên logic của hàm thay vì cung cấp giá trị tĩnh.

Trong trường hợp bạn muốn [truyền các giá trị có dấu phẩy làm đối số](/vi/docs/Web/CSS/Reference/At-rules/@function#passing_comma-containing_values_as_arguments), bạn có thể làm điều đó bằng cách bọc chúng trong dấu ngoặc nhọn (`{ }`).

## Ví dụ

Để xem thêm ví dụ, hãy tham khảo hướng dẫn [Sử dụng hàm tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions) của chúng tôi.

### Cách dùng cơ bản `<dashed-function>`

Ví dụ này minh họa một hàm cơ bản trả về phiên bản bán trong suốt của màu được truyền vào.

#### HTML

Phần đánh dấu gồm một phần tử {{htmlelement("p")}} chứa một số nội dung văn bản:

```html live-sample___basic-example
<p>Some content</p>
```

#### CSS

Trong các kiểu dáng, trước tiên chúng ta định nghĩa hàm tùy chỉnh CSS. Hàm được đặt tên là `--transparent` và nhận hai tham số: một màu và một giá trị kênh alpha kiểu số. Bên trong thân hàm, chúng ta sử dụng [cú pháp màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors) để chuyển đổi màu được truyền vào thành màu [`oklch()`](/vi/docs/Web/CSS/Reference/Values/color_value/oklch) với kênh alpha bằng giá trị alpha được truyền vào; đây trở thành `result` của hàm:

```css live-sample___basic-example
@function --transparent(--color <color>, --alpha <number>) {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Tiếp theo, chúng ta định nghĩa một thuộc tính tùy chỉnh `--base-color` với giá trị `#faa6ff` trên phần tử `:root`. Chúng ta gán thuộc tính đó làm giá trị màu {{cssxref("border")}} của phần tử `<p>`, sau đó đặt giá trị {{cssxref("background-color")}} của nó bằng phiên bản trong suốt của cùng màu đó. Điều này được thực hiện bằng cách đặt giá trị bằng cú pháp `<dashed-function>`, chỉ định hàm `--transparent()` và truyền các đối số `var(--base-color)` và `0.8`.

```css hidden live-sample___basic-example
html,
body {
  height: 100%;
}

body {
  margin: 0;
  display: grid;
  place-items: center;
  font-family: system-ui;
  background-image: repeating-linear-gradient(
    -45deg,
    transparent 0 20px,
    lightgrey 20px 40px
  );
}
```

```css live-sample___basic-example
:root {
  --base-color: #faa6ff;
}

p {
  width: 50%;
  padding: 30px;
  border-radius: 20px;
  border: 3px solid var(--base-color);
  background-color: --transparent(var(--base-color), 0.8);
}
```

#### Kết quả

{{ EmbedLiveSample('basic-example', '100%', '150px') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--)
- At-rule {{cssxref("@function")}}
- Hàm [`type()`](/vi/docs/Web/CSS/Reference/Values/type)
- [Sử dụng hàm tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions)
- Module [hàm tùy chỉnh và mixin CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins)
