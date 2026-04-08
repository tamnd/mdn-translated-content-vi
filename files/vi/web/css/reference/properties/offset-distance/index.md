---
title: offset-distance
slug: Web/CSS/Reference/Properties/offset-distance
page-type: css-property
browser-compat: css.properties.offset-distance
sidebar: cssref
---

Thuộc tính **`offset-distance`** [CSS](/en-US/docs/Web/CSS) chỉ định một vị trí dọc theo một {{CSSxRef("offset-path")}} để đặt phần tử.

{{InteractiveExample("CSS Demo: offset-distance")}}

```css interactive-example-choice
offset-distance: 0%;
```

```css interactive-example-choice
offset-distance: 80%;
```

```css interactive-example-choice
offset-distance: 50px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  width: 24px;
  height: 24px;
  background: #2bc4a2;
  offset-path: path("M-70,-40 C-70,70 70,70 70,-40");
  clip-path: polygon(0% 0%, 70% 0%, 100% 50%, 70% 100%, 0% 100%, 30% 50%);
}

/* Provides a reference image of what path the element is following */
#default-example {
  background-position: calc(50% - 12px) calc(50% + 14px);
  background-repeat: no-repeat;
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="-75 -45 150 140" width="150" height="140"><path d="M-70,-40 C-70,70 70,70 70,-40" fill="none" stroke="lightgrey" stroke-width="2" stroke-dasharray="4.5"/></svg>');
}
```

## Cú pháp

```css
/* Giá trị mặc định */
offset-distance: 0;

/* giữa offset-path */
offset-distance: 50%;

/* độ dài cố định được đặt dọc theo đường dẫn */
offset-distance: 40px;

/* Giá trị toàn cục */
offset-distance: inherit;
offset-distance: initial;
offset-distance: revert;
offset-distance: revert-layer;
offset-distance: unset;
```

- {{cssxref('&lt;length-percentage&gt;')}}
  - : Độ dài chỉ định khoảng cách phần tử dọc theo đường dẫn (được xác định bằng {{cssxref('offset-path')}}).

    100% đại diện cho tổng độ dài của đường dẫn (khi `offset-path` được xác định là một basic shape hoặc `path()`).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng offset-distance trong hoạt ảnh

Khía cạnh chuyển động trong CSS Motion Path thường đến từ việc tạo hoạt ảnh cho thuộc tính `offset-distance`. Nếu bạn muốn tạo hoạt ảnh cho phần tử dọc theo toàn bộ đường dẫn, bạn cần xác định {{cssxref('offset-path')}} của nó và sau đó thiết lập hoạt ảnh lấy `offset-distance` từ `0%` đến `100%`.

#### HTML

```html
<div id="motion-demo"></div>
```

#### CSS

```css
#motion-demo {
  offset-path: path("M20,20 C20,100 200,0 200,100");
  animation: move 3000ms infinite alternate ease-in-out;
  width: 40px;
  height: 40px;
  background: cyan;
}

@keyframes move {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Using_offset-distance_in_an_animation', '100%', 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("offset")}}
- {{cssxref("offset-anchor")}}
- {{cssxref("offset-path")}}
- {{cssxref("offset-position")}}
- {{cssxref("offset-rotate")}}
