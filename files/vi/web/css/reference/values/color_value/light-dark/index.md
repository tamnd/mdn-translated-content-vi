---
title: light-dark()
slug: Web/CSS/Reference/Values/color_value/light-dark
page-type: css-function
browser-compat: css.types.color.light-dark
sidebar: cssref
---

Hàm [CSS](/vi/docs/Web/CSS) [`<color>` function](/vi/docs/Web/CSS/Reference/Values/Functions#color_functions) **`light-dark()`** cho phép đặt hai màu cho một thuộc tính - trả về một trong hai màu tùy chọn bằng cách phát hiện xem nhà phát triển đã đặt bố cục màu sáng hay tối, hoặc người dùng đã yêu cầu chủ đề màu sáng hay tối - mà không cần bao bọc màu chủ đề trong truy vấn [media feature](/vi/docs/Web/CSS/Guides/Media_queries/Using#targeting_media_features) [`prefers-color-scheme`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme).
Người dùng có thể chỉ định tùy chọn bố cục màu của mình thông qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc cài đặt user agent. Hàm `light-dark()` cho phép cung cấp hai giá trị màu trong đó bất kỳ giá trị `<color>` nào đều được chấp nhận. Hàm màu CSS `light-dark()` trả về giá trị đầu tiên nếu tùy chọn của người dùng được đặt thành `light` hoặc không có tùy chọn nào được đặt, và giá trị thứ hai nếu tùy chọn của người dùng được đặt thành `dark`.

Để bật hỗ trợ cho hàm màu `light-dark()`, {{CSSXref("color-scheme")}} phải có giá trị `light dark`, thường được đặt trên [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{CSSXref(":root")}}.

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
  - : Giá trị {{CSSXref("&lt;color&gt;")}} được đặt cho {{CSSXref("color-scheme")}} sáng.

- `dark-color`
  - : Giá trị {{CSSXref("&lt;color&gt;")}} được đặt cho {{CSSXref("color-scheme")}} tối.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Đặt màu dựa trên bố cục màu

Theo mặc định, trong các trình duyệt hỗ trợ, màu trả về bởi hàm màu `light-dark()` phụ thuộc vào tùy chọn người dùng được đặt thông qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc từ cài đặt user agent. Bạn cũng có thể thay đổi cài đặt này trong {{glossary("developer tools")}} của trình duyệt.

#### HTML

Chúng ta bao gồm ba phần để có thể nhắm mục tiêu màu sáng, màu tối và màu được chọn dựa trên tùy chọn bố cục màu của người dùng.

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

Chúng ta bao gồm màu cho cả chủ đề sáng và tối. Chúng ta cũng định nghĩa `color-scheme` cho tài liệu trên `:root` để bật hàm màu `light-dark()` cho toàn bộ tài liệu.

```css-nolint
:root {
  /* this has to be set to switch between light or dark */
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

Ngoài việc bật hàm `light-dark()`, thuộc tính `color-scheme` còn cho phép ghi đè bố cục màu của người dùng cho các phần của tài liệu. Việc buộc một phần trang chỉ sử dụng bố cục màu sáng hoặc tối có thể được thực hiện bằng cách đặt thuộc tính `color-scheme` thành `light` hoặc `dark`.

> [!NOTE]
> Nói chung, điều này không nên được thực hiện; chúng tôi sử dụng nó ở đây cho mục đích minh họa. Nếu người dùng đã đặt tùy chọn, bạn thường không nên ghi đè tùy chọn của họ.

```css
.light {
  /* forces light color-scheme */
  color-scheme: light;
}
.dark {
  /* forces dark color-scheme */
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

## Đặc tả kỹ thuật

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
