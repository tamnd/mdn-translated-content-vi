---
title: Logical properties for margins, borders, and padding
short-title: For margins, borders, and padding
slug: Web/CSS/Guides/Logical_properties_and_values/Margins_borders_padding
page-type: guide
sidebar: cssref
---

Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) định nghĩa các ánh xạ flow-relative cho các thuộc tính margin, border và padding cùng với các shorthand của chúng. Trong hướng dẫn này, chúng ta sẽ xem xét những thuộc tính này.

Nếu bạn xem qua module [logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values), bạn có thể nhận thấy danh sách các thuộc tính trong module khá dài. Điều này chủ yếu là vì có bốn giá trị longhand cho mỗi cạnh của margin, border và padding, cộng với tất cả các giá trị shorthand.

## Ánh xạ cho margin, border và padding

Module chi tiết các ánh xạ cho mỗi giá trị logic tới đối ứng vật lý. Bảng bên dưới ánh xạ những giá trị này khi {{cssxref("writing-mode")}} là `horizontal-tb` — với hướng từ trái sang phải. Do đó, chiều inline chạy ngang — từ trái sang phải — và {{cssxref("margin-inline-start")}} sẽ tương đương với {{cssxref("margin-left")}}.

Nếu bạn sử dụng `horizontal-tb` writing mode với hướng văn bản từ phải sang trái thì {{cssxref("margin-inline-start")}} sẽ tương đương với {{cssxref("margin-right")}}, và trong vertical writing mode sẽ tương đương với việc dùng {{cssxref("margin-top")}}.

| {{glossary("Logical properties","Logical property")}} | {{glossary("Physical properties", "Physical property")}} |
| ----------------------------------------------------- | -------------------------------------------------------- |
| {{cssxref("border-block-end")}}                       | {{cssxref("border-bottom")}}                             |
| {{cssxref("border-block-end-color")}}                 | {{cssxref("border-bottom-color")}}                       |
| {{cssxref("border-block-end-style")}}                 | {{cssxref("border-bottom-style")}}                       |
| {{cssxref("border-block-end-width")}}                 | {{cssxref("border-bottom-width")}}                       |
| {{cssxref("border-block-start")}}                     | {{cssxref("border-top")}}                                |
| {{cssxref("border-block-start-color")}}               | {{cssxref("border-top-color")}}                          |
| {{cssxref("border-block-start-style")}}               | {{cssxref("border-top-style")}}                          |
| {{cssxref("border-block-start-width")}}               | {{cssxref("border-top-width")}}                          |
| {{cssxref("border-inline-end")}}                      | {{cssxref("border-right")}}                              |
| {{cssxref("border-inline-end-color")}}                | {{cssxref("border-right-color")}}                        |
| {{cssxref("border-inline-end-style")}}                | {{cssxref("border-right-style")}}                        |
| {{cssxref("border-inline-end-width")}}                | {{cssxref("border-right-width")}}                        |
| {{cssxref("border-inline-start")}}                    | {{cssxref("border-left")}}                               |
| {{cssxref("border-inline-start-color")}}              | {{cssxref("border-left-color")}}                         |
| {{cssxref("border-inline-start-style")}}              | {{cssxref("border-left-style")}}                         |
| {{cssxref("border-inline-start-width")}}              | {{cssxref("border-left-width")}}                         |
| {{cssxref("border-start-start-radius")}}              | {{cssxref("border-top-left-radius")}}                    |
| {{cssxref("border-end-start-radius")}}                | {{cssxref("border-bottom-left-radius")}}                 |
| {{cssxref("border-start-end-radius")}}                | {{cssxref("border-top-right-radius")}}                   |
| {{cssxref("border-end-end-radius")}}                  | {{cssxref("border-bottom-right-radius")}}                |
| {{cssxref("margin-block-end")}}                       | {{cssxref("margin-bottom")}}                             |
| {{cssxref("margin-block-start")}}                     | {{cssxref("margin-top")}}                                |
| {{cssxref("margin-inline-end")}}                      | {{cssxref("margin-right")}}                              |
| {{cssxref("margin-inline-start")}}                    | {{cssxref("margin-left")}}                               |
| {{cssxref("padding-block-end")}}                      | {{cssxref("padding-bottom")}}                            |
| {{cssxref("padding-block-start")}}                    | {{cssxref("padding-top")}}                               |
| {{cssxref("padding-inline-end")}}                     | {{cssxref("padding-right")}}                             |
| {{cssxref("padding-inline-start")}}                   | {{cssxref("padding-left")}}                              |

Ngoài ra còn có một số shorthand bổ sung, được tạo ra nhờ khả năng nhắm vào cả hai cạnh block hoặc cả hai cạnh inline của hộp cùng lúc. Những shorthand này không có đối ứng vật lý.

| Thuộc tính                         | Mục đích                                                                                                             |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| {{cssxref("border-block")}}        | Đặt {{cssxref("border-color")}}, {{cssxref("border-style")}} và {{cssxref("border-width")}} cho cả hai border block. |
| {{cssxref("border-block-color")}}  | Đặt `border-color` cho cả hai border block.                                                                          |
| {{cssxref("border-block-style")}}  | Đặt `border-style` cho cả hai border block.                                                                          |
| {{cssxref("border-block-width")}}  | Đặt `border-width` cho cả hai border block.                                                                          |
| {{cssxref("border-inline")}}       | Đặt `border-color`, `-style` và `-width` cho cả hai border inline.                                                   |
| {{cssxref("border-inline-color")}} | Đặt `border-color` cho cả hai border inline.                                                                         |
| {{cssxref("border-inline-style")}} | Đặt `border-style` cho cả hai border inline.                                                                         |
| {{cssxref("border-inline-width")}} | Đặt `border-width` cho cả hai border inline.                                                                         |
| {{cssxref("margin-block")}}        | Đặt tất cả các {{cssxref("margin")}} block.                                                                          |
| {{cssxref("margin-inline")}}       | Đặt tất cả các `margin` inline.                                                                                      |
| {{cssxref("padding-block")}}       | Đặt {{cssxref("padding")}} block.                                                                                    |
| {{cssxref("padding-inline")}}      | Đặt `padding` inline.                                                                                                |

## Ví dụ về margin

Các thuộc tính margin được ánh xạ gồm {{cssxref("margin-inline-start")}}, {{cssxref("margin-inline-end")}}, {{cssxref("margin-block-start")}} và {{cssxref("margin-inline-end")}} có thể được dùng thay cho các đối ứng vật lý của chúng.

Ví dụ này có hai hộp với margin có kích thước khác nhau ở mỗi cạnh. Một container thêm với border đã được thêm vào để làm rõ margin hơn.

Một hộp dùng thuộc tính vật lý và hộp kia dùng thuộc tính logic. Hãy thử thay đổi thuộc tính {{cssxref("direction")}} thành `rtl` để khiến các hộp hiển thị theo hướng từ phải sang trái; các margin trên hộp đầu tiên sẽ giữ nguyên vị trí, trong khi các margin trên chiều inline của hộp thứ hai sẽ hoán đổi.

Ngoài ra, hãy thử thay đổi `writing-mode` từ `horizontal-tb` sang `vertical-rl`. Lưu ý cách các margin giữ nguyên vị trí cho hộp đầu tiên, nhưng xoay quanh để theo hướng văn bản trong hộp thứ hai.

```html live-sample___margin-longhands
<div class="container">
  <div class="inner">
    <div class="physical box">
      margin-top: 5px<br />
      margin-right: 0<br />
      margin-bottom: 2em<br />
      margin-left: 50px
    </div>
  </div>
  <div class="inner">
    <div class="logical box">
      margin-block-start: 5px<br />
      margin-inline-end: 0<br />
      margin-block-end: 2em<br />
      margin-inline-start: 50px
    </div>
  </div>
</div>
```

```css hidden live-sample___margin-longhands
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}
.inner {
  border: 2px dotted grey;
}
.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  width: 220px;
  height: 220px;
}
```

```css live-sample___margin-longhands
.box {
  writing-mode: horizontal-tb;
  direction: ltr;
}

.physical {
  margin-top: 5px;
  margin-right: 0;
  margin-bottom: 2em;
  margin-left: 50px;
}

.logical {
  margin-block-start: 5px;
  margin-inline-end: 0;
  margin-block-end: 2em;
  margin-inline-start: 50px;
}
```

{{EmbedLiveSample("margin-longhands", "", "300px")}}

### Margin shorthand

Có các shorthand để nhắm vào cả hai cạnh inline hoặc cả hai cạnh block, lần lượt là {{cssxref("margin-inline")}} và {{cssxref("margin-block")}}. Mỗi shorthand chấp nhận hai giá trị. Giá trị đầu tiên sẽ áp dụng cho điểm bắt đầu của chiều đó, giá trị thứ hai cho điểm kết thúc. Nếu chỉ có một giá trị được đặt, nó sẽ áp dụng cho cả hai.

Trong horizontal writing mode, CSS này sẽ áp dụng margin `5px` cho phần trên của hộp và margin `10px` cho phần dưới.

```css
.box {
  margin-block: 5px 10px;
}
```

## Ví dụ về padding

Các thuộc tính padding được ánh xạ gồm {{cssxref("padding-inline-start")}}, {{cssxref("padding-inline-end")}}, {{cssxref("padding-block-start")}} và {{cssxref("padding-inline-end")}} có thể được dùng thay cho các đối ứng vật lý của chúng.

Trong ví dụ này, có hai hộp. Một hộp có các thuộc tính padding vật lý và hộp kia dùng các thuộc tính padding logic. Với `writing-mode` là `horizontal-tb`, cả hai hộp sẽ trông giống nhau.

Hãy thử thay đổi thuộc tính `direction` thành `rtl` để khiến các hộp hiển thị theo hướng từ phải sang trái. Padding trên hộp đầu tiên sẽ giữ nguyên vị trí, trong khi padding trên chiều inline của hộp thứ hai sẽ hoán đổi.

Bạn cũng có thể thử thay đổi `writing-mode` từ `horizontal-tb` sang `vertical-rl`. Một lần nữa, lưu ý cách padding giữ nguyên vị trí cho hộp đầu tiên, nhưng xoay quanh để theo hướng văn bản trong hộp thứ hai.

```html live-sample___padding-longhands
<div class="container">
  <div class="physical box">
    padding-top: 5px<br />
    padding-right: 0<br />
    padding-bottom: 2em<br />
    padding-left: 50px
  </div>

  <div class="logical box">
    padding-block-start: 5px<br />
    padding-inline-end: 0<br />
    padding-block-end: 2em<br />
    padding-inline-start: 50px
  </div>
</div>
```

```css hidden live-sample___padding-longhands
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
  margin: 10px;
  width: 220px;
  height: 220px;
}
```

```css live-sample___padding-longhands
.box {
  writing-mode: horizontal-tb;
  direction: ltr;
}

.physical {
  padding-top: 5px;
  padding-right: 0;
  padding-bottom: 2em;
  padding-left: 50px;
}

.logical {
  padding-block-start: 5px;
  padding-inline-end: 0;
  padding-block-end: 2em;
  padding-inline-start: 50px;
}
```

{{EmbedLiveSample("padding-longhands", "", "300px")}}

### Padding shorthand

Giống như margin, có các shorthand hai giá trị cho padding — {{cssxref("padding-inline")}} và {{cssxref("padding-block")}} — cho phép bạn đặt padding của hai chiều inline và hai chiều block tương ứng.

Trong `writing-mode` ngang, CSS này sẽ áp dụng padding `5px` cho phần trên của hộp và padding `10px` cho phần dưới:

```css
.box {
  padding-block: 5px 10px;
}
```

## Ví dụ về border

Các thuộc tính border là lý do chính khiến module này có vẻ có quá nhiều thuộc tính, vì nó cung cấp các thuộc tính longhand logic cho màu sắc, độ rộng và kiểu dáng của border trên mỗi cạnh của hộp, cùng với shorthand để đặt cả ba cùng lúc cho mỗi cạnh. Giống như margin và padding, có phiên bản ánh xạ cho mỗi thuộc tính vật lý.

Demo bên dưới sử dụng một số longhand và ba giá trị shorthand. Giống như các demo khác, hãy thử thay đổi thuộc tính `direction` thành `rtl` để khiến các hộp hiển thị theo hướng từ phải sang trái, hoặc thay đổi `writing-mode` từ `horizontal-tb` sang `vertical-rl`.

```html live-sample___border-longhands
<div class="container">
  <div class="physical box">Borders using physical properties.</div>
  <div class="logical box">Borders using logical properties.</div>
</div>
```

```css hidden live-sample___border-longhands
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  display: flex;
}
.box {
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  margin: 10px;
  width: 220px;
  height: 220px;
}
```

```css live-sample___border-longhands
.box {
  writing-mode: horizontal-tb;
  direction: ltr;
}

.physical {
  border-top: 2px solid hotpink;
  border-right-style: dotted;
  border-right-color: goldenrod;
  border-right-width: 5px;
  border-bottom: 4px double black;
  border-left: none;
}

.logical {
  border-block-start: 2px solid hotpink;
  border-inline-end-style: dotted;
  border-inline-end-color: goldenrod;
  border-inline-end-width: 5px;
  border-block-end: 4px double black;
  border-inline-start: none;
}
```

{{EmbedLiveSample("border-longhands", "", "260px")}}

### Border shorthand

Có các shorthand hai giá trị để đặt width, style và color của chiều block hoặc inline, cùng các shorthand để đặt cả ba giá trị trong chiều block hoặc inline. Đoạn code bên dưới, trong horizontal writing mode, sẽ cho bạn border `2px green solid` ở phía trên và dưới của hộp, và border `4px dotted purple` ở phía trái và phải.

```css
.box {
  border-block: 2px solid green;
  border-inline-width: 4px;
  border-inline-style: dotted;
  border-inline-color: rebeccapurple;
}
```

### Thuộc tính border-radius theo flow relative

Module có các đối ứng flow-relative cho các longhand {{cssxref("border-radius")}}. Ví dụ bên dưới, trong `writing-mode` ngang, sẽ đặt border radius góc trên-phải là `1em`, góc dưới-phải là `0`, góc dưới-trái là `20px` và góc trên-trái là `40px`.

```css
.box {
  border-end-start-radius: 1em;
  border-end-end-radius: 0;
  border-start-end-radius: 20px;
  border-start-start-radius: 40px;
}
```

## Chỉ định giá trị logic cho cú pháp shorthand 4 giá trị

Đặc tả đưa ra gợi ý cho các shorthand bốn giá trị như thuộc tính `margin`, tuy nhiên quyết định cuối cùng về cách biểu thị điều này vẫn chưa được giải quyết và đang được thảo luận trong [issue này](https://github.com/w3c/csswg-drafts/issues/1282).

Việc sử dụng bất kỳ shorthand bốn giá trị nào như `margin`, `padding` hay `border` hiện tại vẫn sẽ dùng các phiên bản vật lý, vì vậy nếu việc theo luồng của tài liệu là quan trọng, hãy dùng các thuộc tính longhand trong thời điểm này.
