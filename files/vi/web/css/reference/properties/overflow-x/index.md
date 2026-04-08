---
title: overflow-x
slug: Web/CSS/Reference/Properties/overflow-x
page-type: css-property
browser-compat: css.properties.overflow-x
sidebar: cssref
---

Thuộc tính CSS **`overflow-x`** thiết lập nội dung hiển thị khi nội dung tràn qua các cạnh trái và phải của một phần tử cấp khối. Đây có thể là không hiển thị, một thanh cuộn, hoặc nội dung tràn. Thuộc tính này cũng có thể được thiết lập bằng thuộc tính viết tắt {{cssxref("overflow")}}.

{{InteractiveExample("CSS Demo: overflow-x")}}

```css interactive-example-choice
overflow-x: visible;
```

```css interactive-example-choice
overflow-x: hidden;
```

```css interactive-example-choice
overflow-x: clip;
```

```css interactive-example-choice
overflow-x: scroll;
```

```css interactive-example-choice
overflow-x: auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
    The value of Pi is 3.1415926535897932384626433832795029. The value of e is
    2.7182818284590452353602874713526625.
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 15em;
  height: 9em;
  border: medium dotted;
  padding: 0.75em;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-x: visible;
overflow-x: hidden;
overflow-x: clip;
overflow-x: scroll;
overflow-x: auto;

/* Giá trị toàn cục */
overflow-x: inherit;
overflow-x: initial;
overflow-x: revert;
overflow-x: revert-layer;
overflow-x: unset;
```

Thuộc tính `overflow-x` được chỉ định bằng một giá trị từ khóa {{CSSXref("overflow_value", "&lt;overflow&gt;")}} duy nhất.

Nếu {{cssxref("overflow-y")}} là `hidden`, `scroll` hoặc `auto`, và thuộc tính `overflow-x` là `visible` (mặc định), giá trị sẽ được tính ngầm định là `auto`.

### Giá trị

- `visible`
  - : Nội dung tràn không bị cắt xén và có thể hiển thị bên ngoài hộp đệm của phần tử ở cạnh trái và phải. Hộp phần tử không phải là {{glossary("scroll container")}}.
- `hidden`
  - : Nội dung tràn bị cắt xén nếu cần để vừa theo chiều ngang trong hộp đệm của phần tử. Không có thanh cuộn nào được cung cấp.
- `clip`
  - : Nội dung tràn bị cắt tại _cạnh cắt tràn_ của phần tử, được xác định bằng thuộc tính {{cssxref("overflow-clip-margin")}}. Kết quả là, nội dung tràn ra khỏi hộp đệm của phần tử bằng giá trị {{cssxref("&lt;length&gt;")}} của `overflow-clip-margin` hoặc bằng `0px` nếu chưa được thiết lập. Sự khác biệt giữa `clip` và `hidden` là từ khóa `clip` cũng cấm tất cả các cuộn, kể cả cuộn theo chương trình. Không có ngữ cảnh định dạng mới nào được tạo ra. Để thiết lập ngữ cảnh định dạng, sử dụng `overflow: clip` cùng với {{cssxref("display", "display: flow-root", "#flow-root")}}. Hộp phần tử không phải là vùng chứa cuộn.
- `scroll`
  - : Nội dung tràn bị cắt xén nếu cần để vừa theo chiều ngang trong hộp đệm của phần tử. Trình duyệt hiển thị thanh cuộn theo chiều ngang dù có hay không có nội dung bị cắt xén thực sự. (Điều này ngăn thanh cuộn xuất hiện hoặc biến mất khi nội dung thay đổi.) Máy in vẫn có thể in nội dung tràn.
- `auto`
  - : Nội dung tràn bị cắt tại hộp đệm của phần tử, và nội dung tràn có thể được cuộn để xem. Khác với `scroll`, tác nhân người dùng chỉ hiển thị thanh cuộn _khi_ nội dung bị tràn và ẩn thanh cuộn theo mặc định. Nếu nội dung vừa trong hộp đệm của phần tử, nó trông giống `visible`, nhưng vẫn thiết lập một ngữ cảnh định dạng khối mới. Trình duyệt máy tính để bàn cung cấp thanh cuộn nếu nội dung bị tràn.

> [!NOTE]
> Giá trị từ khóa `overlay` là một bí danh giá trị cũ cho `auto`. Với `overlay`, các thanh cuộn được vẽ trên nội dung thay vì chiếm không gian.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<ul>
  <li>
    <code>overflow-x:hidden</code> — ẩn văn bản ngoài hộp
    <div id="div1">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-x:scroll</code> — luôn thêm thanh cuộn
    <div id="div2">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-x:visible</code> — hiển thị văn bản ngoài hộp nếu cần
    <div id="div3">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-x:auto</code> — trên hầu hết các trình duyệt, tương đương với
    <code>scroll</code>
    <div id="div4">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
</ul>
```

### CSS

```css
#div1,
#div2,
#div3,
#div4 {
  border: 1px solid black;
  width: 250px;
  margin-bottom: 12px;
}

#div1 {
  overflow-x: hidden;
}
#div2 {
  overflow-x: scroll;
}
#div3 {
  overflow-x: visible;
}
#div4 {
  overflow-x: auto;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "270")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("clip")}}, {{Cssxref("display")}}, {{cssxref("text-overflow")}}, {{cssxref("white-space")}}
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [Learn: Overflowing content](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)
