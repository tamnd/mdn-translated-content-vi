---
title: color-scheme
slug: Web/CSS/Reference/Properties/color-scheme
page-type: css-property
browser-compat: css.properties.color-scheme
sidebar: cssref
---

Thuộc tính **`color-scheme`** [CSS](/en-US/docs/Web/CSS) cho phép một phần tử chỉ ra các bảng màu mà nó có thể hiển thị thoải mái. Tác nhân người dùng thay đổi các khía cạnh sau của giao diện người dùng để khớp với bảng màu được dùng:

- Màu bề mặt canvas.
- Màu mặc định của thanh cuộn và các UI tương tác khác.
- Màu mặc định của điều khiển biểu mẫu.
- Màu mặc định của các UI do trình duyệt cung cấp khác, chẳng hạn như gạch chân "kiểm tra chính tả".

Các tác giả thành phần phải sử dụng tính năng phương tiện [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme) để hỗ trợ các bảng màu trên các phần tử còn lại.

Các lựa chọn phổ biến cho bảng màu hệ điều hành là "sáng" và "tối", hoặc "chế độ ban ngày" và "chế độ ban đêm". Khi người dùng chọn một trong các bảng màu này, hệ điều hành điều chỉnh giao diện người dùng. Điều này bao gồm [điều khiển biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms), [thanh cuộn](/en-US/docs/Web/CSS/Guides/Scrollbars_styling), và các giá trị được dùng của [màu hệ thống CSS](/en-US/docs/Web/CSS/Reference/Values/system-color).

{{InteractiveExample("CSS Demo: color-scheme")}}

```css interactive-example-choice
color-scheme: normal;
```

```css interactive-example-choice
color-scheme: dark;
```

```css interactive-example-choice
color-scheme: light;
```

```html interactive-example
<section class="default-example container" id="default-example">
  <textarea id="example-element">Text Area</textarea>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 50%;
}
```

## Cú pháp

```css
color-scheme: normal;
color-scheme: light;
color-scheme: dark;
color-scheme: light dark;
color-scheme: only light;

/* Giá trị toàn cục */
color-scheme: inherit;
color-scheme: initial;
color-scheme: revert;
color-scheme: revert-layer;
color-scheme: unset;
```

Giá trị của thuộc tính `color-scheme` phải là một trong các từ khóa sau.

### Giá trị

- `normal`
  - : Chỉ ra rằng phần tử có thể được hiển thị bằng cài đặt [bảng màu](/en-US/docs/Web/HTML/Reference/Elements/meta/name/color-scheme) của trang. Nếu trang không có bảng màu nào được đặt, phần tử được hiển thị bằng cài đặt màu mặc định của trang.
- `light`
  - : Chỉ ra rằng phần tử có thể được hiển thị bằng bảng màu _sáng_ của hệ điều hành.
- `dark`
  - : Chỉ ra rằng phần tử có thể được hiển thị bằng bảng màu _tối_ của hệ điều hành.
- `only`
  - : Ngăn tác nhân người dùng ghi đè bảng màu cho phần tử.

    Có thể dùng để tắt các ghi đè màu do [Chủ đề tối tự động](https://developer.chrome.com/blog/auto-dark-theme/#per-element-opt-out) của Chrome gây ra, bằng cách áp dụng `color-scheme: only light;` trên một phần tử cụ thể hoặc `:root`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Khai báo sở thích bảng màu

Để toàn bộ trang chọn tham gia sở thích bảng màu của người dùng, hãy khai báo `color-scheme` trên phần tử {{cssxref(":root")}}.

```css
:root {
  color-scheme: light dark;
}
```

Để chọn tham gia cho các phần tử cụ thể theo sở thích bảng màu của người dùng, hãy khai báo `color-scheme` trên các phần tử đó.

```css
header {
  color-scheme: only light;
}
main {
  color-scheme: light dark;
}
footer {
  color-scheme: only dark;
}
```

Cùng với CSS trên, hãy bao gồm thẻ HTML {{HTMLElement("meta")}} [`<meta name="color-scheme">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/color-scheme) trong {{htmlelement("head")}}, trước bất kỳ thông tin CSS nào, để thông báo cho tác nhân người dùng về bảng màu ưa thích, giúp tránh hiện tượng nhấp nháy màn hình không mong muốn khi tải trang.

### Tạo kiểu dựa trên bảng màu

Để tạo kiểu cho các phần tử dựa trên sở thích bảng màu, hãy dùng truy vấn phương tiện [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme). Ví dụ dưới đây chọn tham gia cho toàn bộ trang sử dụng cả hai bảng màu sáng và tối của hệ điều hành thông qua thuộc tính `color-scheme`, sau đó dùng `prefers-color-scheme` để chỉ định màu nền trước và màu nền mong muốn cho các phần tử riêng lẻ trong các bảng màu đó.

```css
:root {
  color-scheme: light dark;
}

@media (prefers-color-scheme: light) {
  .element {
    color: black;
    background-color: white;
  }
}

@media (prefers-color-scheme: dark) {
  .element {
    color: white;
    background-color: black;
  }
}
```

Ngoài ra, dùng hàm [`light-dark()`](/en-US/docs/Web/CSS/Reference/Values/color_value/light-dark) [`<color>`](/en-US/docs/Web/CSS/Reference/Values/Functions#color_functions) để đặt màu nền trước và màu nền cho các bảng màu khác nhau bằng cấu trúc mã gọn hơn:

```css
:root {
  color-scheme: light dark;
}

.element {
  color: light-dark(black, white);
  background-color: light-dark(white, black);
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Truy vấn phương tiện [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme) để phát hiện sở thích bảng màu của người dùng.
- Hàm màu {{CSSXref("color_value/light-dark", "light-dark()")}} để đặt màu cho cả bảng màu sáng và tối.
- Các thuộc tính liên quan đến màu khác: {{cssxref("color")}}, {{cssxref("accent-color")}}, {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}} và {{cssxref("column-rule-color")}}
- {{cssxref("background-image")}}
- {{cssxref("print-color-adjust")}}
- [Sử dụng màu tương đối](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors)
