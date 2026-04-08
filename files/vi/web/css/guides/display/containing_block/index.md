---
title: Layout and the containing block
slug: Web/CSS/Guides/Display/Containing_block
page-type: guide
sidebar: cssref
---

Kích thước và vị trí của một phần tử thường bị ảnh hưởng bởi **containing block** của nó. Thông thường, containing block là [vùng nội dung](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#content_area) của phần tử [block-level](/en-US/docs/Glossary/Block-level_content) tổ tiên gần nhất, nhưng điều này không phải lúc nào cũng đúng. Trong bài viết này, chúng ta xem xét các yếu tố xác định containing block của một phần tử.

Khi một user agent (như trình duyệt của bạn) trình bày một tài liệu, nó tạo ra một hộp cho mỗi phần tử. Mỗi hộp được chia thành bốn vùng:

1. Vùng nội dung
2. Vùng padding
3. Vùng border
4. Vùng margin

![Diagram of the box model](box-model.png)

Nhiều developer tin rằng containing block của một phần tử luôn là vùng nội dung của cha của nó, nhưng điều đó không nhất thiết đúng. Hãy điều tra các yếu tố xác định containing block của một phần tử là gì.

## Hiệu ứng của containing block

Trước khi tìm hiểu điều gì xác định containing block của một phần tử, việc biết tại sao điều đó quan trọng là hữu ích.

Kích thước và vị trí của một phần tử thường bị ảnh hưởng bởi containing block của nó. Các giá trị phần trăm được áp dụng cho các thuộc tính {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("padding")}}, {{cssxref("margin")}}, và các thuộc tính offset của một phần tử được định vị tuyệt đối (tức là có {{cssxref("position")}} được đặt thành `absolute` hoặc `fixed`) được tính từ containing block của phần tử.

## Xác định containing block

Quá trình xác định containing block phụ thuộc hoàn toàn vào giá trị của thuộc tính {{cssxref("position")}} của phần tử:

1. Nếu thuộc tính `position` là **`static`**, **`relative`**, hoặc **`sticky`**, containing block được tạo bởi cạnh của _content box_ của phần tử tổ tiên gần nhất là **block container** (như phần tử inline-block, block, hoặc list-item) hoặc **thiết lập một formatting context** (như table container, flex container, grid container, hoặc bản thân block container).
2. Nếu thuộc tính `position` là **`absolute`**, containing block được tạo bởi cạnh của _padding box_ của phần tử tổ tiên gần nhất có giá trị `position` khác `static` (`fixed`, `absolute`, `relative`, hoặc `sticky`).
3. Nếu thuộc tính `position` là **`fixed`**, containing block được thiết lập bởi {{glossary("viewport")}} (trong trường hợp media liên tục) hoặc vùng trang (trong trường hợp paged media).
4. Nếu thuộc tính `position` là **`absolute`** hoặc **`fixed`**, containing block cũng có thể được tạo bởi cạnh của _padding box_ của phần tử tổ tiên gần nhất có bất kỳ điều nào sau đây:
   - Giá trị {{cssxref("filter")}}, {{cssxref("backdrop-filter")}}, {{cssxref("transform")}}, {{cssxref("perspective")}}, {{cssxref("rotate")}}, {{cssxref("scale")}}, hoặc {{cssxref("translate")}} khác `none`.
   - Giá trị {{cssxref("contain")}} là `layout`, `paint`, `strict` hoặc `content` (ví dụ: `contain: paint;`).
   - Giá trị {{cssxref("container-type")}} khác `normal`.
   - Giá trị {{cssxref("will-change")}} chứa một thuộc tính mà giá trị không phải ban đầu sẽ tạo thành containing block (ví dụ: `filter` hoặc `transform`).
   - Giá trị {{cssxref("content-visibility")}} là `auto`.

> [!NOTE]
> Containing block mà phần tử gốc ({{HTMLElement("html")}}) tồn tại là một hình chữ nhật được gọi là **initial containing block**. Nó có kích thước của viewport (đối với media liên tục) hoặc vùng trang (đối với paged media).

> [!NOTE]
> Có sự không nhất quán giữa các trình duyệt với `perspective` và `filter` đóng góp vào việc tạo thành containing block.

## Tính giá trị phần trăm từ containing block

Như đã lưu ý ở trên, khi một số thuộc tính được cho một giá trị phần trăm, giá trị được tính phụ thuộc vào containing block của phần tử. Các thuộc tính hoạt động theo cách này là **thuộc tính box model** và **thuộc tính offset**:

1. Các thuộc tính {{cssxref("height")}}, {{cssxref("top")}}, và {{cssxref("bottom")}} tính giá trị phần trăm từ `height` của containing block.
2. Các thuộc tính {{cssxref("width")}}, {{cssxref("left")}}, {{cssxref("right")}}, {{cssxref("padding")}}, và {{cssxref("margin")}} tính giá trị phần trăm từ `width` của containing block.

> [!NOTE]
> Một **block container** (như phần tử inline-block, block, hoặc list-item) chứa chỉ các hộp inline-level tham gia vào inline formatting context, hoặc chỉ các hộp block-level tham gia vào block formatting context. Một phần tử là block container chỉ khi nó chứa các hộp block-level hoặc inline-level.

## Một số ví dụ

Mã HTML cho tất cả các ví dụ của chúng ta là:

```html
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

Chỉ có CSS được thay đổi trong mỗi trường hợp dưới đây.

### Ví dụ 1

Trong ví dụ này, đoạn văn được định vị tĩnh, vì vậy containing block của nó là {{HTMLElement("section")}} vì đó là tổ tiên gần nhất là block container (vì `display: block`).

```html hidden
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

```css
body {
  background: beige;
}

section {
  display: block;
  width: 400px;
  height: 160px;
  background: lightgray;
}

p {
  width: 50%; /* == 400px * .5 = 200px */
  height: 25%; /* == 160px * .25 = 40px */
  margin: 5%; /* == 400px * .05 = 20px */
  padding: 5%; /* == 400px * .05 = 20px */
  background: cyan;
}
```

{{EmbedLiveSample('Example_1','100%','300')}}

### Ví dụ 2

Trong ví dụ này, containing block của đoạn văn là phần tử {{HTMLElement("body")}}, vì `<section>` không phải là block container (vì `display: inline`) và không thiết lập formatting context.

```html hidden
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

```css
body {
  background: beige;
}

section {
  display: inline;
  background: lightgray;
}

p {
  width: 50%; /* == half the body's width */
  height: 200px; /* Note: a percentage would be 0 */
  background: cyan;
}
```

{{EmbedLiveSample('Example_2','100%','300')}}

### Ví dụ 3

Trong ví dụ này, containing block của đoạn văn là `<section>` vì `position` của nó là `absolute`. Các giá trị phần trăm của đoạn văn bị ảnh hưởng bởi `padding` của containing block của nó, mặc dù nếu giá trị {{cssxref("box-sizing")}} của containing block là `border-box` thì điều này sẽ không xảy ra.

```html hidden
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

```css
body {
  background: beige;
}

section {
  position: absolute;
  left: 30px;
  top: 30px;
  width: 400px;
  height: 160px;
  padding: 30px 20px;
  background: lightgray;
}

p {
  position: absolute;
  width: 50%; /* == (400px + 20px + 20px) * .5 = 220px */
  height: 25%; /* == (160px + 30px + 30px) * .25 = 55px */
  margin: 5%; /* == (400px + 20px + 20px) * .05 = 22px */
  padding: 5%; /* == (400px + 20px + 20px) * .05 = 22px */
  background: cyan;
}
```

{{EmbedLiveSample('Example_3','100%','300')}}

### Ví dụ 4

Trong ví dụ này, `position` của đoạn văn là `fixed`, vì vậy containing block của nó là initial containing block (trên màn hình, là viewport). Do đó, kích thước của đoạn văn thay đổi dựa trên kích thước của cửa sổ trình duyệt.

```html hidden
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

```css
body {
  background: beige;
}

section {
  width: 400px;
  height: 480px;
  margin: 30px;
  padding: 15px;
  background: lightgray;
}

p {
  position: fixed;
  width: 50%; /* == (50vw - (width of vertical scrollbar)) */
  height: 50%; /* == (50vh - (height of horizontal scrollbar)) */
  margin: 5%; /* == (5vw - (width of vertical scrollbar)) */
  padding: 5%; /* == (5vw - (width of vertical scrollbar)) */
  background: cyan;
}
```

{{EmbedLiveSample('Example_4','100%','300')}}

### Ví dụ 5

Trong ví dụ này, `position` của đoạn văn là `absolute`, vì vậy containing block của nó là `<section>`, là tổ tiên gần nhất có thuộc tính {{cssxref("transform")}} khác `none`.

```html hidden
<body>
  <section>
    <p>This is a paragraph!</p>
  </section>
</body>
```

```css
body {
  background: beige;
}

section {
  transform: rotate(0deg);
  width: 400px;
  height: 160px;
  background: lightgray;
}

p {
  position: absolute;
  left: 80px;
  top: 30px;
  width: 50%; /* == 200px */
  height: 25%; /* == 40px */
  margin: 5%; /* == 20px */
  padding: 5%; /* == 20px */
  background: cyan;
}
```

{{EmbedLiveSample('Example_5','100%','300')}}

## Xem thêm

- {{cssxref("all")}} property
- {{cssxref("contain")}} property
- {{cssxref("aspect-ratio")}} property
- {{cssxref("box-sizing")}} property
- {{cssxref("min-content")}} and {{cssxref("max-content")}} size values
- [Learn: sizing items in CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing)
- [Box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model) module
- [Layout modes](/en-US/docs/Glossary/Layout_mode)
- [Visual formatting models](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- [Initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value), and [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value) values
- {{glossary("Replaced elements")}}
- {{glossary("Intrinsic size")}}
