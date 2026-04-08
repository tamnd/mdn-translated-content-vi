---
title: outline-style
slug: Web/CSS/Reference/Properties/outline-style
page-type: css-property
browser-compat: css.properties.outline-style
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`outline-style`** đặt kiểu của outline một phần tử. Outline là đường kẻ được vẽ xung quanh một phần tử, bên ngoài {{cssxref("border")}}.

{{InteractiveExample("CSS Demo: outline-style")}}

```css interactive-example-choice
outline-style: none;
```

```css interactive-example-choice
outline-style: dotted;
```

```css interactive-example-choice
outline-style: solid;
```

```css interactive-example-choice
outline-style: groove;
```

```css interactive-example-choice
outline-style: inset;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with an outline around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  outline: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}
```

Thường tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("outline")}} khi xác định giao diện của outline.

## Cú pháp

```css
/* Giá trị từ khóa */
outline-style: auto;
outline-style: none;
outline-style: dotted;
outline-style: dashed;
outline-style: solid;
outline-style: double;
outline-style: groove;
outline-style: ridge;
outline-style: inset;
outline-style: outset;

/* Giá trị toàn cục */
outline-style: inherit;
outline-style: initial;
outline-style: revert;
outline-style: revert-layer;
outline-style: unset;
```

Thuộc tính `outline-style` được chỉ định là bất kỳ một trong các giá trị liệt kê bên dưới.

### Giá trị

- `auto`
  - : Cho phép tác nhân người dùng hiển thị kiểu outline tùy chỉnh.
- `none`
  - : Không sử dụng outline. {{cssxref("outline-width")}} là `0`.
- `dotted`
  - : Outline là một chuỗi các chấm.
- `dashed`
  - : Outline là một chuỗi các đoạn đường ngắn.
- `solid`
  - : Outline là một đường đơn.
- `double`
  - : Outline là hai đường đơn. {{cssxref("outline-width")}} là tổng của hai đường và khoảng cách giữa chúng.
- `groove`
  - : Outline trông như thể được khắc vào trang.
- `ridge`
  - : Ngược lại với `groove`: outline trông như thể được đùn ra từ trang.
- `inset`
  - : Outline làm cho hộp trông như thể được nhúng vào trang.
- `outset`
  - : Ngược lại với `inset`: outline làm cho hộp trông như thể đang nhô ra khỏi trang.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt outline-style thành auto

Giá trị `auto` chỉ ra một kiểu outline tùy chỉnh, được mô tả trong [đặc tả](https://drafts.csswg.org/css-ui/#outline-style) là "thường là một kiểu \[là] mặc định giao diện người dùng cho nền tảng, hoặc có thể là một kiểu phong phú hơn những gì có thể mô tả chi tiết trong CSS, ví dụ như outline với cạnh bo tròn và các pixel bên ngoài bán trong suốt trông như phát sáng".

#### HTML

```html
<div>
  <p class="auto">Outline Demo</p>
</div>
```

#### CSS

```css
.auto {
  outline-style: auto; /* same result as "outline: auto" */
}

/* To make the Demo clearer */
* {
  outline-width: 10px;
  padding: 15px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_outline_style_to_auto') }}

### Đặt outline-style thành dashed và dotted

#### HTML

```html
<div>
  <div class="dotted">
    <p class="dashed">Outline Demo</p>
  </div>
</div>
```

#### CSS

```css
.dotted {
  outline-style: dotted; /* same result as "outline: dotted" */
}
.dashed {
  outline-style: dashed;
}

/* To make the Demo clearer */
* {
  outline-width: 10px;
  padding: 15px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_outline_style_to_dashed_and_dotted') }}

### Đặt outline-style thành solid và double

#### HTML

```html
<div>
  <div class="solid">
    <p class="double">Outline Demo</p>
  </div>
</div>
```

#### CSS

```css
.solid {
  outline-style: solid;
}
.double {
  outline-style: double;
}

/* To make the Demo clearer */
* {
  outline-width: 10px;
  padding: 15px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_outline_style_to_solid_and_double') }}

### Đặt outline-style thành groove và ridge

#### HTML

```html
<div>
  <div class="groove">
    <p class="ridge">Outline Demo</p>
  </div>
</div>
```

#### CSS

```css
.groove {
  outline-style: groove;
}
.ridge {
  outline-style: ridge;
}

/* To make the Demo clearer */
* {
  outline-width: 10px;
  padding: 15px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_outline_style_to_groove_and_ridge') }}

### Đặt outline-style thành inset và outset

#### HTML

```html
<div>
  <div class="inset">
    <p class="outset">Outline Demo</p>
  </div>
</div>
```

#### CSS

```css
.inset {
  outline-style: inset;
}
.outset {
  outline-style: outset;
}

/* To make the Demo clearer */
* {
  outline-width: 10px;
  padding: 15px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_outline_style_to_inset_and_outset') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("outline")}}
- {{cssxref("outline-width")}}
- {{cssxref("outline-color")}}
