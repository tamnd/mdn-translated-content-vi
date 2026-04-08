---
title: max-block-size
slug: Web/CSS/Reference/Properties/max-block-size
page-type: css-property
browser-compat: css.properties.max-block-size
sidebar: cssref
---

Thuộc tính **`max-block-size`** trong [CSS](/en-US/docs/Web/CSS) xác định kích thước tối đa của một phần tử theo chiều ngược lại với hướng viết được chỉ định bởi {{cssxref("writing-mode")}}. Tức là, nếu hướng viết là ngang, thì `max-block-size` tương đương với {{cssxref("max-height")}}; nếu hướng viết là dọc, `max-block-size` giống với {{cssxref("max-width")}}.

Kích thước tối đa của chiều kia được chỉ định bằng thuộc tính {{cssxref("max-inline-size")}}.

Điều này hữu ích vì `max-width` luôn được sử dụng cho kích thước ngang và `max-height` luôn được sử dụng cho kích thước dọc, và nếu bạn cần đặt độ dài dựa trên kích thước nội dung văn bản, bạn cần có khả năng làm điều đó với hướng viết trong tâm trí.

Bất cứ khi nào bạn thường dùng `max-height` hoặc `max-width`, bạn nên dùng `max-block-size` để đặt "chiều cao" tối đa của nội dung (mặc dù đây có thể không phải là giá trị dọc) và `max-inline-size` để đặt "chiều rộng" tối đa của nội dung (mặc dù điều này có thể là dọc thay vì ngang). Xem [ví dụ về `writing-mode`](/en-US/docs/Web/CSS/Reference/Properties/writing-mode#examples), hiển thị các chế độ viết khác nhau đang hoạt động.

{{InteractiveExample("CSS Demo: max-block-size")}}

```css interactive-example-choice
max-block-size: 150px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
max-block-size: 150px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
max-block-size: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
max-block-size: 75%;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the maximum block size. <br />This will
    limit the size in the block dimension, potentially causing an overflow.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  justify-content: center;
  color: white;
}
```

## Cú pháp

```css
/* Giá trị <length> */
max-block-size: 300px;
max-block-size: 25em;
max-block-size: anchor-size(--my-anchor self-inline, 250px);
max-block-size: calc(anchor-size(width) / 2);

/* Giá trị <percentage> */
max-block-size: 75%;

/* Giá trị từ khóa */
max-block-size: none;
max-block-size: max-content;
max-block-size: min-content;
max-block-size: fit-content;
max-block-size: fit-content(20em);

/* Giá trị toàn cục */
max-block-size: inherit;
max-block-size: initial;
max-block-size: revert;
max-block-size: revert-layer;
max-block-size: unset;
```

### Giá trị

Giá trị của thuộc tính `max-block-size` có thể là bất kỳ giá trị nào hợp lệ cho thuộc tính {{cssxref("max-width")}} và {{cssxref("max-height")}}:

- {{cssxref("&lt;length&gt;")}}
  - : Xác định `max-block-size` dưới dạng giá trị tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định `max-block-size` dưới dạng phần trăm của kích thước hộp chứa theo trục block.
- `none`
  - : Không giới hạn kích thước của hộp.
- {{cssxref("max-content")}}
  - : `max-block-size` ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : `max-block-size` tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không nhiều hơn [max-content](/en-US/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức `fit-content` với không gian có sẵn được thay thế bởi đối số được chỉ định, tức là `min(max-content, max(min-content, argument))`.

### Cách `writing-mode` ảnh hưởng đến tính định hướng

Các giá trị của `writing-mode` ảnh hưởng đến ánh xạ của `max-block-size` thành `max-width` hoặc `max-height` như sau:

| Giá trị của `writing-mode`                                                | `max-block-size` tương đương với |
| ------------------------------------------------------------------------- | -------------------------------- |
| `horizontal-tb`, `lr`, `lr-tb`, `rl`, `rb`, `rb-rl`                       | {{cssxref("max-height")}}        |
| `vertical-rl`, `vertical-lr`, `sideways-rl`, `sideways-lr`, `tb`, `tb-rl` | {{cssxref("max-width")}}         |

> [!NOTE]
> Các giá trị `writing-mode` là `sideways-lr` và `sideways-rl` đã bị loại bỏ khỏi đặc tả CSS Writing Modes Level 3 vào cuối quá trình thiết kế. Chúng có thể được khôi phục lại trong Level 4.

> [!NOTE]
> Các chế độ viết `lr`, `lr-tb`, `rl`, `rb` và `rb-tl` không còn được phép trong các ngữ cảnh {{Glossary("HTML")}}; chúng chỉ có thể được sử dụng trong các ngữ cảnh {{Glossary("SVG")}} 1.x.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt max-block-size với văn bản ngang và dọc

Trong ví dụ này, cùng một văn bản (các câu mở đầu từ tiểu thuyết _[Moby-Dick](https://en.wikipedia.org/wiki/Moby-Dick)_ của [Herman Melville](https://en.wikipedia.org/wiki/Herman_Melville)) được trình bày trong cả hai chế độ viết `horizontal-tb` và `vertical-rl`.

Tất cả mọi thứ khác về hai hộp là giống nhau, bao gồm các giá trị được sử dụng cho `max-block-size`.

#### HTML

HTML thiết lập hai khối {{HTMLElement("div")}} sẽ được trình bày với {{cssxref("writing-mode")}} của chúng được đặt bằng cách sử dụng các lớp `horizontal` hoặc `vertical`. Cả hai hộp chia sẻ lớp `standard-box`, thiết lập màu sắc, đệm và các giá trị tương ứng của `max-block-size`.

```html
<p>Writing mode <code>horizontal-tb</code> (the default):</p>
<div class="standard-box horizontal">
  Call me Ishmael. Some years ago—never mind how long precisely—having little or
  no money in my purse, and nothing particular to interest me on shore, I
  thought I would sail about a little and see the watery part of the world. It
  is a way I have of driving off the spleen and regulating the circulation.
</div>

<p>Writing mode <code>vertical-rl</code>:</p>
<div class="standard-box vertical">
  Call me Ishmael. Some years ago—never mind how long precisely—having little or
  no money in my purse, and nothing particular to interest me on shore, I
  thought I would sail about a little and see the watery part of the world. It
  is a way I have of driving off the spleen and regulating the circulation.
</div>
```

#### CSS

CSS xác định ba lớp. Lớp đầu tiên, `standard-box`, được áp dụng cho cả hai hộp, như đã thấy ở trên. Nó cung cấp kiểu dáng tiêu chuẩn bao gồm kích thước khối tối thiểu và tối đa, kích thước phông chữ, v.v.

Sau đó là các lớp `horizontal` và `vertical`, thêm thuộc tính {{cssxref("writing-mode")}} vào hộp, với giá trị được đặt thành `horizontal-tb` hoặc `vertical-rl` tùy thuộc vào lớp nào được sử dụng.

```css
.standard-box {
  padding: 4px;
  background-color: #abcdef;
  color: black;
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
  max-block-size: 160px;
  min-block-size: 100px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_max-block-size_with_horizontal_and_vertical_text", 600, 850)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý được ánh xạ: {{cssxref("max-width")}} và {{cssxref("max-height")}}
- Đặt kích thước tối đa theo chiều kia: {{cssxref("max-inline-size")}}
- {{cssxref("writing-mode")}}
