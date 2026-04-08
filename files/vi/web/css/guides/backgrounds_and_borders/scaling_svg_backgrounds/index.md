---
title: Scaling SVG backgrounds
slug: Web/CSS/Guides/Backgrounds_and_borders/Scaling_SVG_backgrounds
page-type: guide
sidebar: cssref
---

Với sự linh hoạt của hình ảnh SVG, có rất nhiều điều cần lưu ý khi sử dụng chúng làm background image với thuộc tính {{ cssxref("background-image") }}, và còn nhiều hơn nữa khi phóng to/thu nhỏ chúng bằng thuộc tính {{ cssxref("background-size") }}. Bài viết này mô tả cách việc phóng to/thu nhỏ hình ảnh SVG được xử lý khi sử dụng các thuộc tính này.

## Thuật toán định kích thước background

Thuật toán dùng để xác định kích thước background của một background image có thể được tóm tắt bằng bốn quy tắc sau. Có một số trường hợp ngoại lệ không được các quy tắc này bao phủ, nhưng đây là phần lớn các trường hợp.

1. Nếu {{ cssxref("background-size") }} chỉ định một kích thước cố định (tức là các đơn vị phần trăm và đơn vị tương đối được cố định theo ngữ cảnh của chúng), kích thước đó sẽ được ưu tiên.
2. Nếu hình ảnh có tỷ lệ cố hữu (tức là tỷ lệ width:height không đổi, chẳng hạn như 16:9, 4:3, 2.39:1, 1:1, v.v.), kích thước hiển thị sẽ giữ nguyên tỷ lệ đó.
3. Nếu hình ảnh chỉ định một kích thước và kích thước đó không bị thay đổi bởi `constrain` hoặc `cover`, kích thước đã chỉ định đó sẽ được ưu tiên.
4. Nếu không có trường hợp nào ở trên được đáp ứng, hình ảnh sẽ được hiển thị với cùng kích thước như vùng background.

Điều đáng chú ý là thuật toán định kích thước background chỉ quan tâm đến kích thước và tỷ lệ của hình ảnh, hoặc sự thiếu hụt của chúng. Một hình ảnh SVG với kích thước cố định sẽ được xử lý giống như một hình ảnh raster có cùng kích thước.

> [!NOTE]
> Nếu bạn đang cố gắng kéo giãn SVG của mình sang một {{glossary("aspect ratio")}} khác bằng CSS—ví dụ để kéo giãn nó phủ kín background của trang—hãy đảm bảo SVG của bạn bao gồm `preserveAspectRatio="none"`. Tìm hiểu thêm về {{svgattr("preserveAspectRatio")}}.

## Ví dụ về hình ảnh nguồn

Trước khi đi sâu vào xem kết quả khi sử dụng các loại hình ảnh SVG nguồn khác nhau và xem chúng trông như thế nào khi được dùng với {{ cssxref("background-size") }}, sẽ hữu ích khi nhìn vào một số hình ảnh nguồn ví dụ có kích thước và cài đặt khác nhau, mà chúng ta sẽ sử dụng làm giá trị `background-image` trong các ví dụ. Trình duyệt hiển thị hình ảnh {{SVGelement("svg")}} mặc định là `300px` rộng và `150px` cao.

### Không có kích thước và không có tỷ lệ

Hình ảnh gradient SVG này vừa không có kích thước vừa không có tỷ lệ. Nó không quan tâm đến kích thước của nó, cũng không quan tâm đến việc giữ nguyên một aspect ratio cụ thể. Đây sẽ là một background gradient tốt cho màn hình desktop, hoạt động bất kể kích thước màn hình và aspect ratio của bạn.

```html
<svg>
  <title>Corner-to-corner gradient</title>
  <defs>
    <linearGradient id="g" x1="0%" x2="100%" y1="0%" y2="100%">
      <stop stop-color="pink" offset="0" />
      <stop stop-color="goldenrod" offset="1" />
    </linearGradient>
  </defs>
  <rect fill="url('#g')" width="100%" height="100%" />
</svg>
```

{{ EmbedLiveSample('Dimensionless_and_proportionless', 200, 180) }}

### Một kích thước được chỉ định và không có tỷ lệ

Hình ảnh này chỉ định chiều rộng là 100 pixel nhưng không có chiều cao hay tỷ lệ cố hữu. Về cơ bản, đây là một dải wallpaper mỏng có thể được kéo dài trên toàn bộ chiều cao của một block.

```html
<svg width="100">
  <title>Vertical gradient, with a fixed width</title>
  <defs>
    <linearGradient id="g" x1="0%" x2="0%" y1="0%" y2="100%">
      <stop stop-color="purple" offset="0" />
      <stop stop-color="lime" offset="1" />
    </linearGradient>
  </defs>
  <rect fill="url('#g')" width="100%" height="100%" />
</svg>
```

{{ EmbedLiveSample('One specified dimension and proportionless', 200, 180) }}

### Một kích thước được chỉ định với tỷ lệ cố hữu

Hình ảnh này chỉ định chiều cao là 100 pixel nhưng không có chiều rộng. Nó cũng chỉ định một aspect ratio cố hữu là 3:4. Điều này đảm bảo rằng tỷ lệ width:height của nó luôn là 3:4, trừ khi nó được cố ý phóng to/thu nhỏ sang kích thước không tương xứng (tức là bằng cách chỉ định rõ ràng cả chiều rộng và chiều cao không theo tỷ lệ đó).

Điều này rất giống với việc chỉ định một chiều rộng và chiều cao cụ thể; vì một khi bạn có một kích thước và một tỷ lệ, kích thước còn lại sẽ được ngụ ý.

```html
<svg height="100" viewBox="0 0 3 4" preserveAspectRatio="none">
  <title>Vertical gradient, with a fixed height and intrinsic ratio</title>
  <defs>
    <linearGradient id="g" x1="0%" x2="0%" y1="0%" y2="100%">
      <stop stop-color="teal" offset="0" />
      <stop stop-color="orange" offset="1" />
    </linearGradient>
  </defs>
  <rect fill="url('#g')" width="100%" height="100%" />
</svg>
```

{{ EmbedLiveSample('One specified dimension with intrinsic ratio', 200, 180) }}

### Không có chiều rộng hoặc chiều cao với tỷ lệ cố hữu

Hình ảnh này không chỉ định chiều rộng hoặc chiều cao; thay vào đó, nó chỉ định một tỷ lệ cố hữu là 1:1. Nó luôn là hình vuông và có thể sử dụng ở bất kỳ kích thước nào, chẳng hạn như 32x32, 128x128, hoặc 512x512.

```html
<svg viewBox="0 0 1 1" preserveAspectRatio="none">
  <title>Intrinsic ratio</title>
  <defs>
    <linearGradient id="g" x1="0%" x2="100%" y1="0%" y2="0%">
      <stop stop-color="navy" offset="0" />
      <stop stop-color="maroon" offset="1" />
    </linearGradient>
  </defs>
  <rect fill="url('#g')" width="100%" height="100%" />
</svg>
```

{{ EmbedLiveSample('No width or height with intrinsic ratio', 200, 180) }}

## Ví dụ về phóng to/thu nhỏ

Bây giờ hãy xem một số ví dụ về những gì xảy ra khi chúng ta áp dụng các mức phóng to/thu nhỏ khác nhau cho những hình ảnh này. Trong mỗi ví dụ dưới đây, các phần tử {{htmlelement("div")}} bao quanh có chiều rộng 300 pixel và chiều cao 200 pixel, với đường viền rộng 2 pixel. Để đảm bảo chúng ta chỉ hiển thị SVG background image một lần cho các minh họa này, chúng ta đặt {{ cssxref("background-repeat") }} thành `no-repeat`.

```css
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

### Chỉ định độ dài cố định cho cả hai chiều

Nếu bạn sử dụng {{ cssxref("background-size") }} để chỉ định độ dài cố định cho cả hai chiều, những độ dài đó luôn được sử dụng, theo quy tắc 1 ở trên. Nói cách khác, hình ảnh sẽ luôn được kéo giãn đến các kích thước bạn chỉ định, bất kể hình ảnh nguồn có chỉ định kích thước và/hoặc aspect ratio hay không.

#### Không có kích thước hoặc tỷ lệ cố hữu

Trong ví dụ này, hình ảnh không có kích thước hoặc tỷ lệ cố hữu được đặt:

```html hidden live-sample___scaling1
<div></div>
```

```css hidden live-sample___scaling1
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___scaling1
div {
  background-image: url("no-dimensions-or-ratio.svg");
  background-size: 125px 175px;
}
```

{{ EmbedLiveSample('scaling1', 200, 230) }}

#### Một kích thước được chỉ định, không có tỷ lệ cố hữu

Trong ví dụ này, hình ảnh có một kích thước được chỉ định và không có tỷ lệ cố hữu:

```html hidden live-sample___scaling2
<div></div>
```

```css hidden live-sample___scaling2
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___scaling2
div {
  background-image: url("100px-wide-no-height-or-ratio.svg");
  background-size: 250px 150px;
}
```

{{ EmbedLiveSample('scaling2', 200, 230) }}

#### Một kích thước được chỉ định với tỷ lệ cố hữu

```html hidden live-sample___scaling3
<div></div>
```

Trong ví dụ này, hình ảnh có một kích thước được đặt rõ ràng, cùng với một tỷ lệ cố hữu, có nghĩa là cả hai chiều đều được xác định hiệu quả. Đặt chiều cao và chiều rộng tuyệt đối cho `background-size` sẽ ghi đè các kích thước được đặt trong SVG:

```css hidden live-sample___scaling3
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___scaling3
div {
  background-image: url("100px-height-3x4-ratio.svg");
  background-size: 275px 125px;
}
```

{{ EmbedLiveSample('scaling3', 200, 230) }}

#### Không có chiều rộng hoặc chiều cao được chỉ định với tỷ lệ cố hữu

Trong ví dụ này, hình ảnh có tỷ lệ cố hữu nhưng không có kích thước được đặt:

```html hidden live-sample___scaling4
<div></div>
```

```css hidden live-sample___scaling4
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___scaling4
div {
  background-image: url("no-dimensions-1x1-ratio.svg");
  background-size: 250px 100px;
}
```

{{ EmbedLiveSample('scaling4', 200, 230) }}

### Sử dụng contain hoặc cover

Chỉ định `cover` cho {{ cssxref("background-size") }} khiến hình ảnh nhỏ nhất có thể trong khi vẫn phủ kín toàn bộ vùng background. `contain`, ngược lại, khiến hình ảnh lớn nhất có thể mà không bị cắt bởi vùng background.

Đối với một hình ảnh có tỷ lệ cố hữu, chính xác một kích thước đáp ứng tiêu chí `cover`/fit một mình. Nhưng nếu không có tỷ lệ cố hữu nào được chỉ định, `cover`/fit không đủ, vì vậy ràng buộc lớn/nhỏ sẽ chọn kích thước kết quả.

#### Không có kích thước hoặc tỷ lệ cố hữu

Trong ví dụ này, hình ảnh không có kích thước hoặc tỷ lệ cố hữu được đặt. Nếu một hình ảnh không chỉ định cả kích thước lẫn tỷ lệ cố hữu, cả quy tắc 2 lẫn quy tắc 3 đều không áp dụng, vì vậy quy tắc 4 được áp dụng: background image được hiển thị phủ kín toàn bộ vùng background. Điều này thỏa mãn ràng buộc lớn nhất hoặc nhỏ nhất.

```html hidden live-sample___cc1
<div></div>
```

```css hidden live-sample___cc1
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc1
div {
  background-image: url("no-dimensions-or-ratio.svg");
  background-size: contain;
}
```

{{ EmbedLiveSample('cc1', 200, 230) }}

#### Một kích thước được chỉ định, không có tỷ lệ cố hữu

Trong ví dụ này, hình ảnh có một kích thước được chỉ định nhưng không có tỷ lệ cố hữu, quy tắc 4 được áp dụng và hình ảnh được phóng to/thu nhỏ để phủ kín toàn bộ vùng background.

```html hidden live-sample___cc2
<div></div>
```

```css hidden live-sample___cc2
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc2
div {
  background-image: url("100px-wide-no-height-or-ratio.svg");
  background-size: contain;
}
```

{{ EmbedLiveSample('cc2', 200, 230) }}

#### Một kích thước được chỉ định với tỷ lệ cố hữu

Trong các ví dụ này, hình ảnh có một kích thước được đặt rõ ràng, cùng với một tỷ lệ cố hữu.

Mọi thứ thay đổi khi bạn chỉ định một tỷ lệ cố hữu. Trong trường hợp này, quy tắc 1 không liên quan, vì vậy quy tắc 2 được áp dụng: chúng ta cố gắng giữ nguyên bất kỳ tỷ lệ cố hữu nào (trong khi tôn trọng `contain` hoặc `cover`). Ví dụ, giữ nguyên aspect ratio cố hữu 3:4 cho một hộp 300x200 với `contain` có nghĩa là vẽ background 150x200.

##### Trường hợp contain

```html hidden live-sample___cc3
<div></div>
```

Với CSS này:

```css hidden live-sample___cc3
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc3
div {
  background-image: url("100px-height-3x4-ratio.svg");
  background-size: contain;
}
```

{{ EmbedLiveSample('cc3', 200, 230) }}

Lưu ý rằng toàn bộ hình ảnh được hiển thị, vừa khít trong hộp mà không cắt xén bất kỳ phần nào.

##### Trường hợp cover

```html hidden live-sample___cc5
<div></div>
```

```css hidden live-sample___cc5
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc5
div {
  background-image: url("100px-height-3x4-ratio.svg");
  background-size: cover;
}
```

{{ EmbedLiveSample('cc5', 200, 230) }}

Ở đây, tỷ lệ 3:4 được giữ nguyên trong khi vẫn kéo giãn hình ảnh để lấp đầy toàn bộ hộp. Điều đó khiến phần dưới của hình ảnh bị cắt đi.

#### Không có kích thước với tỷ lệ cố hữu

Các ví dụ này sử dụng hình ảnh có tỷ lệ cố hữu nhưng không có kích thước được xác định. Khi sử dụng hình ảnh không có kích thước cố hữu nhưng có tỷ lệ cố hữu, mọi thứ hoạt động tương tự.

##### Trường hợp contain

```html hidden live-sample___cc6
<div></div>
```

```css hidden live-sample___cc6
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc6
div {
  background-image: url("no-dimensions-1x1-ratio.svg");
  background-size: contain;
}
```

{{ EmbedLiveSample('cc6', 200, 230) }}

Lưu ý rằng hình ảnh được định kích thước để vừa với chiều nhỏ nhất trong khi vẫn giữ nguyên aspect ratio 1:1.

##### Trường hợp cover

```html hidden live-sample___cc7
<div></div>
```

```css hidden live-sample___cc7
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___cc7
div {
  background-image: url("no-dimensions-1x1-ratio.svg");
  background-size: cover;
}
```

{{ EmbedLiveSample('cc7', 200, 230) }}

Ở đây, hình ảnh được định kích thước để lấp đầy chiều lớn nhất. Aspect ratio 1:1 đã được giữ nguyên, mặc dù với hình ảnh nguồn này, điều đó có thể khó nhìn thấy.

### Tự động định kích thước sử dụng "auto" cho cả hai chiều

Nếu {{ cssxref("background-size") }} được đặt thành `auto` hoặc `auto auto`, quy tắc 2 nói rằng việc hiển thị phải giữ nguyên bất kỳ tỷ lệ cố hữu nào được cung cấp.

#### Không có kích thước hoặc tỷ lệ cố hữu

Khi tự động định kích thước background image không có tỷ lệ cố hữu hoặc kích thước được chỉ định, quy tắc 4 có hiệu lực và hình ảnh được hiển thị để lấp đầy vùng background.

```html hidden live-sample___both-auto1
<div></div>
```

```css hidden live-sample___both-auto1
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___both-auto1
div {
  background-image: url("no-dimensions-or-ratio.svg");
  background-size: auto auto;
}
```

{{ EmbedLiveSample('both-auto1', 200, 230) }}

#### Một kích thước và không có tỷ lệ cố hữu

Nếu không có tỷ lệ cố hữu nào được chỉ định, nhưng ít nhất một kích thước được chỉ định, quy tắc 3 có hiệu lực và chúng ta hiển thị hình ảnh tuân theo các kích thước đó.

```html hidden live-sample___both-auto2
<div></div>
```

```css hidden live-sample___both-auto2
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___both-auto2
div {
  background-image: url("100px-wide-no-height-or-ratio.svg");
  background-size: auto auto;
}
```

{{ EmbedLiveSample('both-auto2', 200, 230) }}

Lưu ý ở đây rằng chiều rộng, được chỉ định trong SVG nguồn là 100 pixel, được tuân theo, trong khi chiều cao lấp đầy vùng background vì nó không được chỉ định (cả rõ ràng lẫn theo tỷ lệ cố hữu).

#### Một kích thước và một tỷ lệ cố hữu

Nếu chúng ta có một tỷ lệ cố hữu với một kích thước cố định, điều đó cố định cả hai chiều. Như đã đề cập trước đó, biết một kích thước và một tỷ lệ giống như chỉ định cả hai kích thước một cách rõ ràng.

```html hidden live-sample___both-auto3
<div></div>
```

```css hidden live-sample___both-auto3
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___both-auto3
div {
  background-image: url("100px-height-3x4-ratio.svg");
  background-size: auto auto;
}
```

{{ EmbedLiveSample('both-auto3', 200, 230) }}

Vì hình ảnh này có chiều cao rõ ràng là `100px`. Với tỷ lệ 3:4 được đặt trong SVG, trong trường hợp `auto`, chiều rộng của hình ảnh là 75 pixel.

#### Không có kích thước cố định với tỷ lệ cố hữu

Khi một tỷ lệ cố hữu được chỉ định, nhưng không có kích thước, quy tắc 4 được áp dụng — ngoại trừ quy tắc 2 cũng áp dụng. Do đó hình ảnh được hiển thị giống như trường hợp `contain`.

```html hidden live-sample___both-auto4
<div></div>
```

```css hidden live-sample___both-auto4
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___both-auto4
div {
  background-image: url("no-dimensions-1x1-ratio.svg");
  background-size: auto auto;
}
```

{{ EmbedLiveSample('both-auto4', 200, 230) }}

### Sử dụng "auto" và một độ dài cụ thể

Với quy tắc 1, các kích thước được chỉ định luôn được sử dụng, vì vậy chúng ta chỉ cần sử dụng các quy tắc để xác định chiều thứ hai.

#### Không có kích thước hoặc tỷ lệ cố hữu

Nếu hình ảnh không có kích thước hoặc tỷ lệ cố hữu, quy tắc 4 áp dụng và chúng ta sử dụng kích thước của vùng background để xác định giá trị cho chiều `auto`.

```html hidden live-sample___auto0
<div></div>
```

```css hidden live-sample___auto0
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___auto0
div {
  background-image: url("no-dimensions-or-ratio.svg");
  background-size: auto 140px;
}
```

{{ EmbedLiveSample('auto0', 200, 230) }}

Ở đây, chiều rộng được xác định bằng chiều rộng của vùng background theo quy tắc 4, trong khi chiều cao là `140px` được chỉ định trong CSS.

#### Một kích thước được chỉ định không có tỷ lệ cố hữu

Nếu hình ảnh có một kích thước được chỉ định nhưng không có tỷ lệ cố hữu, kích thước được chỉ định đó được sử dụng theo quy tắc 3 nếu chiều đó được đặt thành `auto` trong CSS.

```html hidden live-sample___auto1
<div></div>
```

```css hidden live-sample___auto1
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___auto1
div {
  background-image: url("100px-wide-no-height-or-ratio.svg");
  background-size: 200px auto;
}
```

{{ EmbedLiveSample('auto1', 200, 230) }}

Ở đây, `200px` được chỉ định trong CSS ghi đè `100px` chiều rộng được chỉ định trong SVG, theo quy tắc 1. Vì không có tỷ lệ cố hữu hoặc chiều cao được cung cấp, `auto` chọn chiều cao của vùng background làm chiều cao cho hình ảnh được hiển thị.

```html hidden live-sample___auto2
<div></div>
```

```css hidden live-sample___auto2
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___auto2
div {
  background-image: url("100px-wide-no-height-or-ratio.svg");
  background-size: auto 125px;
}
```

{{ EmbedLiveSample('auto2', 200, 230) }}

Trong trường hợp này, chiều rộng được chỉ định là `auto` trong CSS, vì vậy `100px` chiều rộng được chỉ định trong SVG được chọn, theo quy tắc 3. Chiều cao được đặt ở `125px` trong CSS, vì vậy nó được chọn theo quy tắc 1.

#### Một kích thước được chỉ định với tỷ lệ cố hữu

Khi một kích thước được chỉ định, quy tắc 1 áp dụng kích thước đó từ SVG cho background được hiển thị trừ khi được CSS ghi đè cụ thể. Khi cũng có một tỷ lệ cố hữu được chỉ định, điều đó được sử dụng để xác định chiều còn lại.

```html hidden live-sample___auto3
<div></div>
```

```css hidden live-sample___auto3
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___auto3
div {
  background-image: url("100px-height-3x4-ratio.svg");
  background-size: 150px auto;
}
```

{{ EmbedLiveSample('auto3', 200, 230) }}

Trong trường hợp này, chúng ta sử dụng chiều rộng của hình ảnh được chỉ định trong CSS là `150px`, vì vậy quy tắc 1 được áp dụng. Aspect ratio cố hữu 3:4 sau đó xác định chiều cao cho trường hợp `auto`.

#### Không có kích thước được chỉ định với tỷ lệ cố hữu

Nếu không có kích thước nào được chỉ định trong SVG, kích thước được chỉ định trong CSS được áp dụng, sau đó tỷ lệ cố hữu được sử dụng để chọn chiều còn lại, theo quy tắc 2.

```html hidden live-sample___auto4
<div></div>
```

```css hidden live-sample___auto4
div {
  width: 300px;
  height: 200px;
  background-repeat: no-repeat;
  border: 2px solid black;
}
```

```css live-sample___auto4
div {
  background-image: url("no-dimensions-1x1-ratio.svg");
  background-size: 150px auto;
}
```

{{ EmbedLiveSample('auto4', 200, 230) }}

Chiều rộng được CSS đặt là `150px`. Giá trị `auto` cho chiều cao được tính toán bằng chiều rộng đó và aspect ratio 1:1 cũng là `150px`.

## Xem thêm

- {{cssxref("background-size")}}
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
