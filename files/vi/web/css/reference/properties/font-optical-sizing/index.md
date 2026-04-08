---
title: font-optical-sizing
slug: Web/CSS/Reference/Properties/font-optical-sizing
page-type: css-property
browser-compat: css.properties.font-optical-sizing
sidebar: cssref
---

Thuộc tính **`font-optical-sizing`** [CSS](/en-US/docs/Web/CSS) đặt xem việc hiển thị văn bản có được tối ưu hóa để xem ở các kích thước khác nhau hay không.

{{InteractiveExample("CSS Demo: font-optical-sizing")}}

```css interactive-example-choice
font-optical-sizing: auto;
```

```css interactive-example-choice
font-optical-sizing: none;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <h2>Chapter 3</h2>
    <p>
      On this particular Thursday, something was moving quietly through the
      ionosphere many miles above the surface of the planet; several somethings
      in fact, several dozen huge yellow chunky slablike somethings, huge as
      office blocks, silent as birds.
    </p>
  </div>
</section>
```

```css interactive-example
@font-face {
  src: url("/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.ttf");
  font-family: "Amstelvar";
  font-style: normal;
}

#example-element {
  font-family: "Amstelvar", serif;
  text-align: left;
}

#example-element h2 {
  font-size: 36px;
}

#example-element p {
  font-size: 12px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
font-optical-sizing: none;
font-optical-sizing: auto; /* mặc định */

/* Giá trị toàn cục */
font-optical-sizing: inherit;
font-optical-sizing: initial;
font-optical-sizing: revert;
font-optical-sizing: revert-layer;
font-optical-sizing: unset;
```

### Các giá trị

- none
  - : Trình duyệt sẽ không chỉnh sửa hình dạng glyph để xem tối ưu.
- auto
  - : Trình duyệt sẽ chỉnh sửa hình dạng glyph để xem tối ưu.

## Mô tả

Optical sizing được bật theo mặc định cho các font có trục biến thiên kích thước quang học. Trục biến thiên kích thước quang học được biểu diễn bằng `opsz` trong {{cssxref("font-variation-settings")}}.

Khi optical sizing được dùng, văn bản nhỏ thường được hiển thị với các nét dày hơn và chân chữ lớn hơn, trong khi văn bản lớn hơn thường được hiển thị tinh tế hơn với nhiều độ tương phản hơn giữa các nét dày và mỏng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tắt optical sizing

```html
<p class="optical-sizing">
  This paragraph is optically sized. This is the default across browsers.
</p>

<p class="no-optical-sizing">
  This paragraph is not optically sized. You should see a difference in
  supporting browsers.
</p>
```

```css
@font-face {
  src: url("AmstelvarAlpha-VF.ttf");
  font-family: "Amstelvar";
  font-style: normal;
}

p {
  font-size: 36px;
  font-family: "Amstelvar", serif;
}

.no-optical-sizing {
  font-optical-sizing: none;
}
```

> [!NOTE]
> Font được tham chiếu ở trên — bao gồm optical sizing và được cấp phép tự do — rất tốt để kiểm thử. Bạn có thể [tải về trên GitHub](https://github.com/googlefonts/amstelvar/releases).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-size")}}
- {{cssxref("font-size-adjust")}}
- [Học: Định dạng văn bản và font cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
