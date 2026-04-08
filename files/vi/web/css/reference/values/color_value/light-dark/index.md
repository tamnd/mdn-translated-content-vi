---
title: light-dark()
slug: Web/CSS/Reference/Values/color_value/light-dark
page-type: css-function
browser-compat: css.types.color.light-dark
sidebar: cssref
---

[Hàm `<color>`](/vi/docs/Web/CSS/Reference/Values/Functions#color_functions) của [CSS](/vi/docs/Web/CSS) **`light-dark()`** cho phép đặt hai màu cho một thuộc tính - trả về một trong hai tùy chọn màu bằng cách phát hiện liệu nhà phát triển đã đặt giao diện màu sáng hay tối hoặc người dùng đã yêu cầu giao diện màu sáng hay tối - mà không cần bao bọc màu giao diện trong truy vấn tính năng media [`prefers-color-scheme`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme).
Người dùng có thể chỉ định tùy chọn giao diện màu của họ thông qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc cài đặt user agent. Hàm `light-dark()` cho phép cung cấp hai giá trị màu trong đó bất kỳ giá trị `<color>` nào đều được chấp nhận. Hàm màu CSS `light-dark()` trả về giá trị đầu tiên nếu tùy chọn của người dùng được đặt là `light` hoặc nếu không có tùy chọn nào được đặt, và giá trị thứ hai nếu tùy chọn của người dùng được đặt là `dark`.

Để kích hoạt hỗ trợ cho hàm màu `light-dark()`, {{CSSXref("color-scheme")}} phải có giá trị `light dark`, thường được đặt trên [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{CSSXref(":root")}}.

```css
:root {
  color-scheme: light dark;
}
body {
  color: light-dark(#333b3c, #efefec);
  background-color: light-dark(#efedea, #223a2c);
}
```

## Cú pháp

```css
/* Giá trị màu có tên */
color: light-dark(black, white);

/* Giá trị màu RGB */
color: light-dark(rgb(0 0 0), rgb(255 255 255));

/* Thuộc tính tùy chỉnh */
color: light-dark(var(--light), var(--dark));
```

### Giá trị

Ký hiệu hàm: `light-dark(light-color, dark-color)`

- `light-color`
  - : Giá trị {{CSSXref("&lt;color&gt;")}} để đặt cho {{CSSXref("color-scheme")}} sáng.

- `dark-color`
  - : Giá trị {{CSSXref("&lt;color&gt;")}} để đặt cho {{CSSXref("color-scheme")}} tối.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Đặt màu dựa trên giao diện màu

Theo mặc định, trong các trình duyệt hỗ trợ, màu được trả về bởi hàm màu `light-dark()` phụ thuộc vào tùy chọn người dùng được đặt qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc từ cài đặt user agent. Bạn cũng có thể thay đổi cài đặt này trong {{glossary("developer tools", "công cụ dành cho nhà phát triển")}} của trình duyệt.

#### HTML

Chúng ta bao gồm ba phần để kích hoạt việc nhắm mục tiêu màu sáng, màu tối, và màu được chọn dựa trên giao diện màu ưa thích của người dùng.

```html
<h1><code>light-dark()</code> CSS function</h1>
<section>
  <h2>Automatic</h2>
  <p>This section will react to the users system or user agent setting.</p>
</section>
<section class="light">
  <h2>Light</h2>
  <p>
    This section will be light due to the <code>color-scheme: light;</code>.
  </p>
</section>
<section class="dark">
  <h2>Dark</h2>
  <p>This section will be dark due to the <code>color-scheme: dark;</code>.</p>
</section>
```

#### CSS

Chúng ta bao gồm các màu cho cả giao diện sáng và tối. Chúng ta cũng định nghĩa `color-scheme` cho tài liệu trên `:root` để kích hoạt hàm màu `light-dark()` cho toàn bộ tài liệu.

```css-nolint
:root {
  /* phải được đặt để chuyển đổi giữa sáng hoặc tối */
  color-scheme: light dark;

  --light-bg: ghostwhite;
  --light-color: darkslategray;
  --light-code: tomato;

  --dark-bg: darkslategray;
  --dark-color: ghostwhite;
  --dark-code: gold;
}
* {
  background-color: light-dark(var(--light-bg), var(--dark-bg));
  color: light-dark(var(--light-color), var(--dark-color));
}
code {
  color: light-dark(var(--light-code), var(--dark-code));
}
```

Ngoài việc kích hoạt hàm `light-dark()`, thuộc tính `color-scheme` cho phép ghi đè giao diện màu của người dùng cho các phần tài liệu. Có thể buộc một phần trang chỉ sử dụng giao diện màu sáng hoặc tối bằng cách đặt thuộc tính `color-scheme` thành `light` hoặc `dark`.

> [!NOTE]
> Thông thường điều này không nên được thực hiện, chúng ta sử dụng nó ở đây chỉ để minh họa. Nếu người dùng đã đặt tùy chọn, thông thường bạn không nên ghi đè tùy chọn của họ.

```css
.light {
  /* buộc giao diện màu sáng */
  color-scheme: light;
}
.dark {
  /* buộc giao diện màu tối */
  color-scheme: dark;
}
```

```css hidden
section {
  padding: 0.8rem;
}
```

#### Kết quả

{{EmbedLiveSample("setting_colors_based_on_color_scheme", "100%", 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("color-scheme")}}
- {{CSSXref("&lt;color&gt;")}}
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- Tính năng [`prefers-contrast`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast) {{cssxref("@media")}}
- [`contrast()`](/vi/docs/Web/CSS/Reference/Values/filter-function/contrast)
- [WCAG: color contrast](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
- [Thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--*) và {{cssxref("var")}}
