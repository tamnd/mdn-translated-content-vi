---
title: Logical properties for sizing
short-title: For sizing
slug: Web/CSS/Guides/Logical_properties_and_values/Sizing
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta sẽ giải thích các ánh xạ flow-relative giữa các thuộc tính kích thước vật lý và các thuộc tính logic được dùng để định kích thước các phần tử trên trang.

Khi chỉ định kích thước của một phần tử, module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) cho phép bạn chỉ định kích thước theo luồng văn bản (inline và block) thay vì kích thước vật lý liên quan đến chiều ngang và dọc (ví dụ: trái và phải). Mặc dù các ánh xạ flow relative này có thể trở thành mặc định cho nhiều người trong chúng ta, trong một thiết kế bạn hoàn toàn có thể dùng cả kích thước vật lý lẫn logic. Bạn có thể muốn một số tính năng luôn liên quan đến chiều vật lý dù writing mode là gì.

## Ánh xạ cho kích thước

Bảng dưới đây cung cấp các ánh xạ giữa thuộc tính logic và vật lý. Những ánh xạ này giả định bạn đang ở `horizontal-tb` writing mode, chẳng hạn như tiếng Anh hay tiếng Ả Rập, trong đó {{CSSxRef("width")}} sẽ được ánh xạ tới {{CSSxRef("inline-size")}}.

Nếu bạn ở vertical writing mode thì {{CSSxRef("inline-size")}} sẽ được ánh xạ tới {{CSSxRef("height")}}.

| Thuộc tính logic               | Thuộc tính vật lý         |
| ------------------------------ | ------------------------- |
| {{CSSxRef("inline-size")}}     | {{CSSxRef("width")}}      |
| {{CSSxRef("block-size")}}      | {{CSSxRef("height")}}     |
| {{CSSxRef("min-inline-size")}} | {{CSSxRef("min-width")}}  |
| {{CSSxRef("min-block-size")}}  | {{CSSxRef("min-height")}} |
| {{CSSxRef("max-inline-size")}} | {{CSSxRef("max-width")}}  |
| {{CSSxRef("max-block-size")}}  | {{CSSxRef("max-height")}} |

## Ví dụ về width và height

Các ánh xạ logic cho {{CSSxRef("width")}} và {{CSSxRef("height")}} là {{CSSxRef("inline-size")}}, đặt chiều dài trên chiều inline, và {{CSSxRef("block-size")}}, đặt chiều dài trên chiều block. Khi làm việc với tiếng Anh, thay `width` bằng `inline-size` và `height` bằng `block-size` sẽ cho ra cùng bố cục.

Trong ví dụ trực tiếp bên dưới, `writing-mode` được đặt thành `horizontal-tb`. Thay đổi thành `vertical-rl` và bạn sẽ thấy ví dụ đầu tiên — dùng `width` và `height` — vẫn giữ nguyên kích thước trên mỗi chiều dù văn bản trở thành dọc. Ví dụ thứ hai — dùng `inline-size` và `block-size` — sẽ đi theo hướng văn bản như thể toàn bộ khối đã xoay.

```html live-sample___size-inline-block
<div class="container">
  <div class="physical box">I have a width of 200px and a height of 100px.</div>

  <div class="logical box">
    I have an inline-size of 200px and a block-size of 100px.
  </div>
</div>
```

```css hidden live-sample___size-inline-block
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}
.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  margin: 10px;
}
```

```css live-sample___size-inline-block
.box {
  writing-mode: horizontal-tb;
}

.physical {
  width: 200px;
  height: 100px;
}

.logical {
  inline-size: 200px;
  block-size: 100px;
}
```

{{EmbedLiveSample("size-inline-block")}}

## Ví dụ về min-width và min-height

Cũng có các ánh xạ cho {{CSSxRef("min-width")}} và {{CSSxRef("min-height")}} — đó là {{CSSxRef("min-inline-size")}} và {{CSSxRef("min-block-size")}}. Chúng hoạt động theo cùng cách với các thuộc tính `inline-size` và `block-size`, nhưng đặt kích thước tối thiểu thay vì kích thước cố định.

Hãy thử thay đổi ví dụ bên dưới thành `vertical-rl`, giống như ví dụ đầu tiên, để xem hiệu ứng. Tôi đang dùng `min-height` trong ví dụ đầu tiên và `min-block-size` trong ví dụ thứ hai.

```html live-sample___size-min
<div class="container">
  <div class="physical box">
    I have a width of 200px and a min-height of 5em.
  </div>

  <div class="logical box">
    I have an inline-size of 200px and a min-block-size of 5em.
  </div>
</div>
```

```css hidden live-sample___size-min
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}
.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  margin: 10px;
}
```

```css live-sample___size-min
.box {
  writing-mode: horizontal-tb;
}

.physical {
  width: 200px;
  min-height: 5em;
}

.logical {
  inline-size: 200px;
  min-block-size: 5em;
}
```

{{EmbedLiveSample("size-min")}}

## Ví dụ về max-width và max-height

Cuối cùng bạn có thể dùng {{CSSxRef("max-inline-size")}} và {{CSSxRef("max-block-size")}} là các thay thế logic cho {{CSSxRef("max-width")}} và {{CSSxRef("max-height")}}. Hãy thử thao tác với ví dụ bên dưới theo cách tương tự như trước.

```html live-sample___size-max
<div class="container">
  <div class="physical box">I have a max-width of 200px.</div>

  <div class="logical box">I have a max-inline-size of 200px.</div>
</div>
```

```css hidden live-sample___size-max
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}
.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  margin: 10px;
}
```

```css live-sample___size-max
.box {
  writing-mode: horizontal-tb;
}

.physical {
  max-width: 200px;
}

.logical {
  max-inline-size: 200px;
}
```

{{EmbedLiveSample("size-max")}}

## Từ khóa logic cho resize

Thuộc tính {{CSSxRef("resize")}} đặt liệu một phần tử có thể được thay đổi kích thước hay không và có các giá trị vật lý là `horizontal` và `vertical`. Thuộc tính `resize` cũng có các giá trị từ khóa logic. Dùng `resize: inline` cho phép thay đổi kích thước trên chiều inline và `resize: block` cho phép thay đổi kích thước trên chiều block.

Giá trị từ khóa `both` cho thuộc tính resize hoạt động dù bạn đang nghĩ theo chiều vật lý hay logic. Nó đặt cả hai chiều cùng lúc. Hãy thử thao tác với ví dụ bên dưới.

```html live-sample___size-resize
<div class="container">
  <div class="physical box">
    I have a width of 200px and a height of 100px. I can be resized
    horizontally.
  </div>

  <div class="logical box">
    I have an inline-size of 200px and a block-size of 100px. I can be resized
    in the inline direction.
  </div>
</div>
```

```css hidden live-sample___size-resize
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}
.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  margin: 10px;
}
```

```css live-sample___size-resize
.box {
  writing-mode: horizontal-tb;
  overflow: scroll;
}

.physical {
  width: 200px;
  height: 100px;
  resize: horizontal;
}

.logical {
  inline-size: 200px;
  block-size: 100px;
  resize: inline;
}
```

{{EmbedLiveSample("size-resize")}}
