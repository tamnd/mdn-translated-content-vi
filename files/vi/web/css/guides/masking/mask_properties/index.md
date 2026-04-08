---
title: CSS mask properties
short-title: Mask properties
slug: Web/CSS/Guides/Masking/Mask_properties
page-type: guide
sidebar: cssref
---

CSS masking là một kỹ thuật cho phép bạn xác định các phần hiển thị của một phần tử bằng cách áp dụng một mask, giúp hiển thị hoặc ẩn có chọn lọc các phần của phần tử dựa trên kênh alpha, và tùy chọn màu sắc, của các mask image được áp dụng.

[Hướng dẫn giới thiệu về masking](/en-US/docs/Web/CSS/Guides/Masking) trình bày các loại mask image khác nhau và các chế độ của chúng. Hướng dẫn về [khai báo nhiều mask](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks) thảo luận về [mask layers](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks#understanding_mask_layers) và thuộc tính viết tắt {{cssxref("mask")}}, cung cấp giới thiệu ngắn gọn về các thuộc tính thành phần của shorthand. Trong hướng dẫn này, chúng ta khám phá các thuộc tính thành phần này chi tiết hơn và xem xét cách chúng tương tác với nhau. Chúng ta cũng giải thích cách, trong các trường hợp có nhiều mask image được khai báo, [các mask layer được kết hợp](#the_mask-composite_property), hay tổng hợp lại.

CSS masks được tạo thành từ một hoặc nhiều mask layer, với một mask layer được tạo cho mỗi giá trị trong danh sách phân cách bằng dấu phẩy của các giá trị `mask` hoặc `mask-image`, dù giá trị là image, mask source, hay từ khóa `none`. Mỗi {{cssxref("mask-image")}} được [định vị](#the_mask-position_property) tương đối với một hộp [origin](#the_mask-origin_property). Các mask image có thể được [điều chỉnh kích thước](#the_mask-size_property), [lặp lại](#the_mask-repeat_property), và [cắt](#the_mask-clip_property), sau đó tổng hợp cùng với các layer trước đó để tạo ra mask trực quan cuối cùng trên phần tử.

## Thuộc tính `mask-image`

Yêu cầu tối thiểu để tạo một mask là thuộc tính {{cssxref("mask-image")}} được đặt thành giá trị khác `none`.
Từ khóa `none` trong một danh sách các mask source tạo ra một mask layer. Tuy nhiên, nếu `none` là giá trị duy nhất của thuộc tính `mask-image`, thì không có masking nào xảy ra.

Mask image có thể là [CSS gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients), một [ảnh được nhập](/en-US/docs/Web/CSS/Guides/Masking/Introduction#with_imported_images) (chẳng hạn như PNG, SVG, v.v.), hoặc một phần tử SVG {{svgelement("mask")}}.

Trong ví dụ này, chúng ta tạo năm mask layer, bao gồm một ảnh được nhập, hai gradient, một layer không có image, và một SVG `<mask>` source làm mask image.

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
}
```

Vì một trong các mask image được chỉ định là `none`, chỉ có bốn mask image được áp dụng cho phần tử `.masked-element`, trong khi tạo ra năm mask layer.

### Tầm quan trọng của `none`

Layer `none` nói chung không có hiệu ứng trực quan (xem [thuộc tính `mask-composite`](#the_mask-composite_property) để biết cách nó ảnh hưởng đến mask được áp dụng), nhưng vì mỗi giá trị trong danh sách phân cách bằng dấu phẩy của các giá trị `mask-*` áp dụng cho một mask layer riêng biệt, giá trị `none` phục vụ mục đích quan trọng ngay cả khi nó không thay đổi mask tổng hợp.

Layer thứ tư trong cấu trúc năm layer của chúng ta sẽ khớp với giá trị thứ tư của bất kỳ giá trị thuộc tính `mask-*` phân cách bằng dấu phẩy nào khác. Như đã đề cập trước đó, số lượng layer được xác định bởi số lượng giá trị phân cách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("mask-image")}}, ngay cả khi một giá trị là `none`. Mỗi giá trị `mask-*` được ghép với các giá trị `mask-image`, theo thứ tự. Nếu số lượng giá trị trong thuộc tính `mask-*` khác với số lượng mask layer, bất kỳ giá trị thừa nào sẽ bị bỏ qua, hoặc, nếu thuộc tính có ít giá trị hơn số lượng mask layer, các giá trị sẽ được lặp lại.

Nếu thuộc tính `mask-*` có một giá trị duy nhất, giá trị này áp dụng cho tất cả các layer. Nếu chúng ta có năm giá trị, giá trị thứ tư áp dụng cho layer `none`, với giá trị cuối cùng được áp dụng cho layer `<mask>` source. Nếu có hai giá trị phân cách bằng dấu phẩy, giá trị đầu tiên sẽ áp dụng cho tất cả các layer lẻ, bao gồm cả layer `<mask>` source đó. Ví dụ, mỗi thuộc tính `mask-*` có thể có số lượng giá trị khác nhau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-repeat: repeat-x, repeat-y;
  mask-position:
    center,
    top left,
    bottom right;
}
```

Trong trường hợp này, mỗi layer lẻ sẽ được lặp lại dọc theo trục x trong khi mỗi layer chẵn được lặp lại dọc theo trục y. Image layer thứ nhất và thứ tư sẽ được căn giữa, trong khi thứ hai và thứ năm sẽ được định vị ở góc trên bên trái. `none` có nghĩa là image `#svg-mask` của layer thứ năm sẽ được lặp lại dọc theo trục x bắt đầu từ góc trên bên trái.

Tìm hiểu thêm về [mask layer và từ khóa `none`](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks#mask_layers_and_the_none_keyword).

## Thuộc tính `mask-mode`

Thuộc tính {{cssxref("mask-mode")}} có thể được sử dụng để đặt chế độ của mỗi mask layer thành `alpha` hoặc `luminance`, hoặc cho phép nó mặc định theo chế độ của source bằng cách đặt giá trị thành `match-source`, đây là giá trị mặc định. Trong khi hầu hết các thuộc tính `mask-*` có thuộc tính `background-*` tương tự (`mask-image` tương tự với thuộc tính {{cssxref("background-image")}}, chẳng hạn), `mask-mode` và [`mask-composite`](#the_mask-composite_property) không có thuộc tính {{cssxref("background")}} tương tự.

### Loại mask: `alpha` và `luminance`

Mỗi mask là mask `alpha` hoặc `luminance`.

Với mask `alpha`, độ trong suốt alpha của mỗi pixel mask là quan trọng. Nơi nào mask không trong suốt, các phần tương ứng của phần tử sẽ hiển thị. Nơi nào mask trong suốt, các phần tương ứng của phần tử sẽ bị ẩn. Nơi nào mask bán trong suốt, phần tử cũng sẽ bán trong suốt tương ứng. Màu sắc của mask không quan trọng, chỉ có độ trong suốt alpha của màu sắc mới quan trọng.

Với mask `luminance`, cả [độ sáng của màu sắc mask](/en-US/docs/Web/CSS/Guides/Masking/Introduction#alpha_transparency_versus_luminance) và kênh alpha đều quyết định độ mờ đục của các vùng bị mask.

> [!NOTE]
> Tất cả các ví dụ tiếp theo sử dụng hình ảnh sau làm `background-image` trên một phần tử mà mask sẽ được áp dụng:
>
> <img src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg" alt="Pride flag" />

Ví dụ này minh họa sự khác biệt giữa mask `alpha` và `luminance`. Các mask là giống nhau, nhưng trong mask `alpha`, chỉ có độ trong suốt alpha của màu sắc gradient mask mới quan trọng. Trong ví dụ `luminance`, R, G, B và A đều quan trọng.

Hai container chứa image, trong khi cái cuối cùng rỗng nhưng được đưa vào để hiển thị gradient mà chúng ta sẽ sử dụng làm `mask-image`.

```html live-sample___mode
<div class="alpha">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="luminance">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="gradient"></div>
```

```css hidden live-sample___mode live-sample___position live-sample___position_no-repeat live-sample___clip live-sample___origin live-sample___size live-sample___composite live-sample___composite2 live-sample___composite3
body {
  display: flex;
  gap: 20px;
  padding: 15px;
  background-image: conic-gradient(
    transparent 90deg,
    rgb(0 0 0 / 0.05) 90deg 180deg,
    transparent 180deg 270deg,
    rgb(0 0 0 / 0.05) 270deg
  );
  background-size: 30px 30px;
}
div,
svg,
img {
  width: 220px;
  aspect-ratio: 1;
}
div {
  border: 1px solid black;
}
```

Chúng ta khai báo một [`repeating-linear-gradient`](/en-US/docs/Web/CSS/Reference/Values/gradient/repeating-linear-gradient) với các sọc chéo màu đỏ, trong suốt và đỏ bán trong suốt. Gradient này được sử dụng làm mask và, cho container cuối cùng, làm background image:

```css live-sample___mode
img {
  mask-image: repeating-linear-gradient(
    to bottom right,
    red 0 20px,
    #ff000055 20px 40px,
    transparent 40px 60px
  );
}
.gradient {
  background: repeating-linear-gradient(
    to bottom right,
    red 0 20px,
    #ff000055 20px 40px,
    transparent 40px 60px
  );
}
```

Chúng ta đặt các giá trị khác nhau cho thuộc tính `mask-mode` cho mỗi image:

```css live-sample___mode
.alpha img {
  mask-mode: alpha;
}

.luminance img {
  mask-mode: luminance;
}
```

{{EmbedLiveSample("mode", "", "270px")}}

Trong trường hợp `alpha`, chỉ có độ trong suốt của màu sắc gradient mới quan trọng. Nơi nào gradient là đỏ không trong suốt, image là không trong suốt. Nơi nào gradient trong suốt, image bị ẩn. Nơi nào gradient 50% trong suốt, image là 50% trong suốt. Trong trường hợp `luminance`, độ sáng của màu sắc quan trọng! Xem [Alpha transparency versus luminance](/en-US/docs/Web/CSS/Guides/Masking/Introduction#alpha_transparency_versus_luminance) để tìm hiểu về phương trình sử dụng các kênh R, G, B và A của màu sắc để xác định độ mờ đục của mask.

### Giá trị mặc định của `mask-mode`: `match-source`

Giá trị mặc định của thuộc tính `mask-mode` là `match-source`. Giá trị này đặt `mask-mode` để khớp với loại chế độ của mask. Giá trị `match-source` phân giải thành `alpha` cho mọi mask ngoại trừ các mask có mask source là một phần tử SVG {{svgelement("mask")}}.

Khi một phần tử `<mask>` SVG được sử dụng làm mask source, giá trị `match-source` phân giải thành giá trị của thuộc tính {{cssxref("mask-type")}} của phần tử `<mask>`. Nếu phần tử `<mask>` (không phải "phần tử bị mask") không có thuộc tính CSS `mask-type` được xác định, thuộc tính này mặc định theo giá trị của thuộc tính SVG {{svgAttr("mask-type")}}, nếu có. Nếu điều đó cũng bị bỏ qua, giá trị `match-source` sẽ phân giải thành `luminance`.

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-mode`, nó sẽ mặc định thành `match-source` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
}
```

hoặc, sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") match-source,
    linear-gradient(to right, black, transparent) match-source,
    radial-gradient(circle, white 50%, transparent 75%) match-source,
    none match-source,
    url("#svg-mask") match-source;
}
```

Mask layer đầu tiên, `url("alphaImage.png")`, tham chiếu đến một image. Vì đây không phải là phần tử `<mask>` trong một `<svg>`, `mask-mode` phân giải thành `alpha`, với các phần không trong suốt của image này làm cho các phần tương ứng của phần tử hiển thị, trong khi các phần trong suốt hoặc bán trong suốt là vô hình hoặc hiển thị một phần.

`linear-gradient(to right, black, transparent)` là mask layer thứ hai và `radial-gradient(circle, white 50%, transparent 75%)` là mask layer thứ ba. Một lần nữa, đây không phải là phần tử `<mask>`, vì vậy giá trị `match-source` phân giải thành `alpha`. Hiệu ứng masking của các layer này được xác định bởi [độ mờ đục của gradient mask](/en-US/docs/Web/CSS/Guides/Masking/Introduction#opaqueness_versus_transparency) theo mặc định.

Mask layer thứ tư có `none` được khai báo, có nghĩa là mask cho layer này là đen trong suốt. Class `.masked-element` đặt `mask-mode: match-source;`. Nếu `mask-mode` thay thế là danh sách phân cách bằng dấu phẩy gồm năm giá trị khác nhau, giá trị thứ tư sẽ áp dụng cho layer `none` này, cho phép giá trị thứ năm áp dụng cho layer thứ năm.

Mask layer thứ năm bao gồm một phần tử SVG {{svgelement("mask")}} có `svg-mask` làm [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id). Trong khi chế độ mask mặc định của các layer khác là `alpha`, [loại mask mặc định của phần tử SVG `<mask>`](/en-US/docs/Web/CSS/Guides/Masking/Introduction#svg_mask_as_mask_source) là giá trị `mask-type`, hoặc, nếu không được đặt, thuộc tính `mask-type`. Nếu điều đó cũng không được xác định, giá trị mặc định là `luminance`. Nói cách khác, hiệu ứng masking của `<mask>` được xác định bởi cả độ sáng và độ trong suốt của màu sắc phần tử `<mask>`.

Nếu chúng ta không khai báo thuộc tính `mask-mode` chút nào, và cho phép nó mặc định thành `match-source` cho mỗi mask layer, kết quả trong trường hợp `.masked-element` này sẽ phân giải thành:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: alpha, alpha, alpha, match-source, luminance;
}
```

hoặc, sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") alpha,
    linear-gradient(to right, black, transparent) alpha,
    radial-gradient(circle, white 50%, transparent 75%) alpha,
    none match-source,
    url("#svg-mask") luminance;
}
```

## Thuộc tính `mask-position`

Tương tự như thuộc tính {{cssxref("background-position")}}, thuộc tính {{cssxref("mask-position")}} đặt vị trí ban đầu của mask image tương đối với hộp origin của mask layer, được xác định bởi [thuộc tính `mask-origin`](#the_mask-origin_property). Cú pháp tuân theo [cú pháp `<position>` của `background-position`](/en-US/docs/Web/CSS/Reference/Properties/background-position#position), với giá trị là một, hai hoặc bốn giá trị {{cssxref("&lt;position&gt;")}}, xác định một đến hai offset vị trí tương đối hoặc tuyệt đối.

### Cú pháp một giá trị

Nếu chỉ có một giá trị từ khóa được chỉ định, giá trị đó chỉ định cạnh origin mask mà mask sẽ được đặt với chiều còn lại là `center`.

Nếu chỉ có một giá trị {{cssxref("&lt;length-percentage&gt;")}} được chỉ định, điều này chỉ định tọa độ X tương đối với cạnh trái của mask origin, với tọa độ Y được đặt thành `50%`.

Nếu có hai giá trị từ khóa được chỉ định, thứ tự của giá trị không quan trọng, nhưng giá trị không thể bao gồm hai giá trị trục dọc hoặc hai giá trị trục ngang; `left right` và `top bottom` đều không hợp lệ.

### Cú pháp hai giá trị

Nếu có hai giá trị, bao gồm một từ khóa và một giá trị `<length-percentage>`, thứ tự chỉ quan trọng nếu từ khóa là `center`:

- Nếu từ khóa là `left` hoặc `right`, nó xác định tọa độ X tương đối với cạnh trái, và giá trị xác định tọa độ Y tương đối với cạnh trên.
- Tương tự, từ khóa `top` hoặc `bottom` xác định vị trí tọa độ Y của phần tử đối với cạnh trên hoặc cạnh dưới, tương ứng, với giá trị kia xác định giá trị X tương đối với cạnh trái của hộp mask origin.
- Khi một giá trị là từ khóa `center` và giá trị kia là `<length-percentage>`, giá trị đầu tiên xác định vị trí ngang và giá trị thứ hai xác định vị trí dọc.

Nếu có hai giá trị và cả hai đều là giá trị `<length-percentage>`, thứ tự lại quan trọng; giá trị đầu tiên xác định vị trí ngang như một offset từ cạnh trái của vùng định vị mask trong khi giá trị thứ hai xác định vị trí dọc như một offset từ cạnh trên của vùng định vị mask.

### Cú pháp bốn giá trị

Vị trí mask cũng có thể tương đối với các góc khác ngoài góc trên bên trái. Cú pháp bốn giá trị cho phép offset mask từ bất kỳ góc nào. Giá trị bao gồm hai offset {{cssxref("length-percentage")}}, mỗi cái được đặt trước bởi cạnh origin cho offset đó. Việc bạn khai báo cặp ngang hay dọc trước không quan trọng, nhưng bạn phải khai báo từ khóa cạnh origin (`left`, `right`, `top`, `bottom`, `x-start`, `x-end`, `y-start`, `y-end`, `block-start`, `block-end`, `inline-start`, hoặc `inline-end`) trước offset `<length-percentage>` trong mỗi cặp, và hai cạnh origin không thể từ cùng một trục.

Trong cú pháp hai `<length-percentage>`, các cạnh origin là `top` và `left`, theo thứ tự đó. Ví dụ, `mask-position: 10px 20px` tương đương với `mask-position: left 10px top 20px`. Khi offset từ trên và trái, các cạnh offset không bắt buộc, nhưng thứ tự quan trọng. Với cú pháp bốn giá trị, bạn có thể sử dụng `mask-position` để offset mask image từ bất kỳ tổ hợp cạnh nào, chẳng hạn `left 10px bottom 20px`, và thứ tự của các cạnh không quan trọng, vì cạnh offset được xác định bởi từ khóa đứng trước nó thay vì thứ tự khai báo.

### Giá trị phần trăm

Khi offset sử dụng giá trị phần trăm, kích thước của mask được trừ khỏi kích thước của phần tử, giống như được thực hiện với [offset phần trăm với `background-position`](/en-US/docs/Web/CSS/Reference/Properties/background-position#regarding_percentages).

### Định vị mask image lặp lại

Thuộc tính `mask-position` xác định vị trí ban đầu của mask image. Với "vị trí ban đầu", nếu [mask lặp lại](#the_mask-repeat_property), trình duyệt đặt mask image đầu tiên tại vị trí được xác định bởi thuộc tính `mask-position`, do đó xác định vị trí của các lần lặp lại mask.

Trong ví dụ này, chúng ta đặt vị trí của image đầu tiên thành `bottom right`, có nghĩa là mask đầu tiên sẽ được đặt tại cạnh dưới bên phải của hộp mask origin. Vì các mask image lặp lại theo mặc định, các mask lặp lại sẽ được định vị đối với các cạnh trên và trái của mask được đặt đầu tiên.

```html hidden live-sample___position live-sample___position_no-repeat
<div class="keywords">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="twoValue">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="fourValue">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
```

```css hidden live-sample___position live-sample___position_no-repeat
div,
img {
  width: calc(30vw - 20px);
}
```

```css live-sample___position live-sample___position_no-repeat
img {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
}
.keywords img {
  mask-position: bottom right;
}
.twoValue img {
  mask-position: -20px -10px;
}
.fourValue img {
  mask-position: right -20px bottom -10px;
}
```

```css hidden live-sample___position live-sample___position_no-repeat
div::before {
  content: 'class="' attr(class) '"';
  display: block;
  text-align: center;
  font-family: monospace;
}
body {
  flex-flow: row wrap;
}
```

`mask-position` xác định vị trí của lần đặt mask image đầu tiên. Demo này cho thấy vị trí đặt image đầu tiên:

```css hidden live-sample___position_no-repeat
img {
  mask-repeat: no-repeat;
}
```

{{EmbedLiveSample("position_no-repeat", "", "260px")}}

Vì giá trị mặc định cho [thuộc tính `mask-repeat`](#the_mask-repeat_property) là `repeat`, các image được lặp lại dọc theo trục X và Y, dựa trên vị trí của mask đầu tiên đó:

{{EmbedLiveSample("position", "", "260px")}}

Ví dụ hai giá trị xác định các offset trên và trái của mask gốc. Ví dụ bốn giá trị kết hợp hai ví dụ trước đó, định vị mask đầu tiên sử dụng các offset giống như image thứ hai, nhưng từ các cạnh giống như được minh họa trong image đầu tiên.

Trong image đầu tiên, ngôi sao đầu tiên được đặt là ở phía dưới bên phải, với các ngôi sao lặp lại ở trên và bên trái. Do việc định vị này, ngôi sao ban đầu không bị cắt, nhưng các ngôi sao trên cùng và bên trái nhất thì bị cắt.

Nếu chúng ta không đặt rõ ràng thuộc tính `mask-position`, nó sẽ mặc định thành `0% 0%` cho mỗi layer, với góc trên bên trái của mask tiếp giáp với góc trên bên trái của hộp mask origin. Tiếp tục với ví dụ `masked-element`, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
}
```

hoặc, mở rộng ví dụ sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% match-source,
    linear-gradient(to right, black, transparent) 0% 0% match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% match-source,
    none 0% 0% match-source,
    url("#svg-mask") 0% 0% match-source;
}
```

## Thuộc tính `mask-origin`

Khi một phần tử có padding, border, hoặc cả hai, thuộc tính {{cssxref("mask-origin")}} xác định cạnh hộp nào trong số này đóng vai trò là hộp mask origin, hay _vùng định vị mask_, trong đó một mask image được định vị, cho layer đó. Thuộc tính `mask-origin` tương tự với thuộc tính {{cssxref("background-origin")}}, nhưng với giá trị ban đầu khác nhau và các giá trị chỉ dành cho SVG.

Các phần tử HTML có thể có mask nằm trong hộp border, hộp padding, hoặc hộp nội dung của chúng. Ví dụ, nếu `mask-position` là `top left`, điều đó có tương đối với cạnh ngoài của border, cạnh ngoài của padding, hay cạnh ngoài của nội dung không?

Trong ví dụ masking [`mask-position`](#the_mask-position_property), vị trí được xác định là tương đối với border-box (hành vi mặc định), mặc dù đáng chú ý là `<img>` không có border hay padding được đặt, do đó content-box, padding-box và border-box origin sẽ giống nhau trong trường hợp này.

```html hidden live-sample___origin
<div class="border-box">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<fieldset>
  <legend>Set the <code>mask-origin</code> value</legend>
  <label
    ><input type="radio" name="origin" id="origin_border-box" checked />
    border-box</label
  >
  <label
    ><input type="radio" name="origin" id="origin_padding-box" />
    padding-box</label
  >
  <label
    ><input type="radio" name="origin" id="origin_content-box" />
    content-box</label
  >
</fieldset>
```

```css hidden live-sample___origin live-sample___clip live-sample___size
div {
  all: unset;
}
legend {
  align-self: baseline;
}
label {
  display: block;
}
```

Trong ví dụ này, `mask-position` đặt mask ban đầu ở góc trên bên trái của phần tử `<img>` có border và padding lớn, với màu nền xanh lá để có thể thấy star masking trên vùng padding.

```css live-sample___origin live-sample___clip
img {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
  mask-position: top left;
  padding: 15px;
  border: 15px solid;
  background-color: green;
}
:has(#origin_border-box:checked) img {
  mask-origin: border-box;
}
:has(#origin_padding-box:checked) img {
  mask-origin: padding-box;
}
:has(#origin_content-box:checked) img {
  mask-origin: content-box;
}
```

Thay đổi giá trị của thuộc tính `mask-origin` bằng cách thay đổi radio button được chọn, chú ý vị trí của star mask góc trên bên trái khi bạn làm như vậy.

{{EmbedLiveSample("origin", "", "350px")}}

Giá trị mặc định là `border-box`. Với giá trị này, mask ban đầu được đặt tại cạnh trên bên trái của border và không bị cắt. Khi mask ban đầu được đặt tại cạnh ngoài hoặc trong của padding, có khoảng trống phía trên và bên trái của nó; các mask lặp lại này bị cắt.

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-origin`, nó sẽ mặc định thành `border-box` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
  mask-origin: border-box;
}
```

hoặc, mở rộng ví dụ sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% border-box match-source,
    linear-gradient(to right, black, transparent) 0% 0% border-box match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% border-box
      match-source,
    none 0% 0% border-box match-source,
    url("#svg-mask") 0% 0% border-box match-source;
}
```

Đối với các phần tử SVG, không có các hộp layout CSS liên quan, một mask có thể được chứa bên trong fill, stroke, hoặc view box của phần tử SVG.

## Thuộc tính `mask-clip`

Thuộc tính {{cssxref("mask-clip")}} xác định vùng của phần tử sẽ bị ảnh hưởng bởi một mask, cắt phần tử hiệu quả tại cạnh hộp được xác định. Nó tương tự với thuộc tính {{cssxref("background-clip")}}, nhưng với một số giá trị khác.

Vì thuộc tính `mask-clip` chấp nhận tất cả các giá trị `mask-origin` và cả hai đều có cùng giá trị mặc định `border-box`, hai thuộc tính có vẻ tương tự, nhưng chúng phục vụ các mục đích rất khác nhau. Trong khi `mask-origin` xác định nơi một mask image sẽ được định vị, thuộc tính `mask-clip` khiến phần tử gốc có nội dung bị cắt theo hộp được chỉ định. Điều quan trọng là phải hiểu cả hai: nếu `mask-origin` khiến `mask-position` đặt mask image bên ngoài vùng clipping, mask sẽ bị cắt.

Thuộc tính `mask-clip` chấp nhận tất cả các giá trị `mask-origin`, cũng như giá trị `no-clip` của riêng nó. Giá trị `no-clip` đặt nội dung được vẽ không bị cắt. Bạn vẫn có thể khiến mask image bị cắt bằng cách định vị nó bên ngoài vùng nội dung border sử dụng các giá trị `mask-position` nhỏ hơn không hoặc giải quyết thành lớn hơn 100%.

Đặt `mask-clip` và `mask-origin` thành các giá trị khác nhau có thể khiến mask layer image bị cắt. Ví dụ, nếu một phần tử có border và padding có `mask-clip` đặt thành `content-box` và `mask-origin` đặt thành `border-box`, và `mask-position` được đặt thành cạnh `top left`, mask layer image sẽ bị cắt tại cạnh trên bên trái.

Ví dụ tiếp theo thêm các tùy chọn clipping vào ví dụ trước để minh họa các giá trị `mask-clip` không phải SVG khác nhau và để cho thấy cách chúng ảnh hưởng đến các giá trị `mask-origin` khác nhau.

```html hidden live-sample___clip
<div class="border-box">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<fieldset>
  <legend>Set the <code>mask-clip</code> value</legend>
  <label
    ><input type="radio" name="clip" id="clip_border-box" checked />
    border-box</label
  >
  <label
    ><input type="radio" name="clip" id="clip_padding-box" /> padding-box</label
  >
  <label
    ><input type="radio" name="clip" id="clip_content-box" /> content-box</label
  >

  <label><input type="radio" name="clip" id="clip_no-clip" /> no-clip</label>
</fieldset>
<fieldset>
  <legend>Set the <code>mask-origin</code> value</legend>
  <label
    ><input type="radio" name="origin" id="origin_border-box" checked />
    border-box</label
  >
  <label
    ><input type="radio" name="origin" id="origin_padding-box" />
    padding-box</label
  >
  <label
    ><input type="radio" name="origin" id="origin_content-box" />
    content-box</label
  >
</fieldset>
```

```css live-sample___clip
:has(#clip_border-box:checked) img {
  mask-clip: border-box;
}
:has(#clip_padding-box:checked) img {
  mask-clip: padding-box;
}
:has(#clip_content-box:checked) img {
  mask-clip: content-box;
}
```

{{EmbedLiveSample("clip", "", "350px")}}

Mask đầu tiên được đặt tại cạnh trên bên trái của container mask origin, sau đó lặp lại. Nếu hộp origin là `border-box` và vùng clipping là `content-box`, các vùng trên và trái của container mask origin sẽ bị cắt. Thông thường, bạn sẽ muốn `mask-clip` giống với `mask-origin`.

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-clip`, nó sẽ mặc định thành `border-box` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
  mask-origin: border-box;
  mask-clip: border-box;
}
```

hoặc, mở rộng ví dụ sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% border-box border-box match-source,
    linear-gradient(to right, black, transparent) 0% 0% border-box border-box
      match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% border-box
      border-box match-source,
    none 0% 0% border-box border-box match-source,
    url("#svg-mask") 0% 0% border-box border-box match-source;
}
```

Trong shorthand `mask`, nếu chỉ có một giá trị [`<geometry-box>`](/en-US/docs/Web/CSS/Reference/Properties/clip-path#geometry-box) được đưa ra, nó đặt cả giá trị thuộc tính `mask-origin` và `mask-clip`. Nếu có hai giá trị `<geometry-box>`, giá trị đầu tiên xác định `mask-origin` và giá trị thứ hai xác định `mask-clip`.

Đối với các mask layer image không tham chiếu đến phần tử SVG {{svgelement("mask")}}, thuộc tính `mask-clip` xác định liệu vùng vẽ mask, hay vùng bị ảnh hưởng bởi mask, là hộp border, padding hay nội dung. Nội dung được vẽ của phần tử sẽ bị hạn chế trong vùng này.

Khi {{cssxref("mask-image")}} source của mask layer là `<mask>`, thuộc tính `mask-clip` không có hiệu lực. Thay vào đó, các thuộc tính {{svgAttr("x")}}, {{svgAttr("y")}}, {{svgAttr("width")}}, {{svgAttr("height")}}, và {{svgAttr("maskUnits")}} của phần tử `<mask>` xác định vùng vẽ mask.

## Thuộc tính `mask-size`

Thuộc tính {{cssxref("mask-size")}} được sử dụng để điều chỉnh kích thước mask layer. Thuộc tính này tương tự với thuộc tính {{cssxref("background-size")}}, nhận các giá trị giống nhau. Khi điều chỉnh kích thước mask, hãy nhớ rằng các vùng của phần tử không được bao phủ bởi mask image sẽ bị ẩn.

Có ba cách để khai báo `mask-size`:

- từ khóa `cover` hoặc `contain`,
- một length, percentage, hoặc từ khóa `auto`, hoặc
- hai giá trị là sự kết hợp của length, percentage và từ khóa `auto`.

Mask image có thể được để ở kích thước tự nhiên, kéo dài, hoặc bị hạn chế để vừa với không gian có sẵn. {{glossary("aspect ratio")}} của mask image được duy trì theo mặc định, nhưng khai báo hai giá trị `<length-percentage>` có thể làm biến dạng mask image nếu tỷ lệ của hai giá trị không giống với ảnh gốc (`mask-repeat: round` là cặp thuộc tính/giá trị khác có thể làm biến dạng mask image).

Nếu `mask-size` được đặt thành `contain`, mask image sẽ là kích thước lớn nhất có thể trong khi hoàn toàn nằm trong vùng định vị mask. Trong trường hợp này, mask image không bị cắt mà thay vào đó hoàn toàn được chứa.

Khi đặt thành `cover`, mask image sẽ là kích thước nhỏ nhất có thể để bao phủ hoàn toàn toàn bộ vùng định vị mask, với mask bị cắt nếu tỷ lệ khung hình của mask khác với tỷ lệ khung hình của vùng định vị mask.

Nói cách khác, với `cover` và `contain`, ít nhất một chiều của mask sẽ có cùng kích thước với chiều tương ứng của vùng định vị mask; mask image hoặc lớn lên hoặc thu nhỏ lại để chiều rộng bằng chiều rộng vùng định vị mask hoặc chiều cao mask image bằng chiều cao vùng định vị mask.

Với `cover`, `contain`, và các giá trị `<percentage>`, kích thước tương đối với hộp origin. Trong ví dụ star-mask và flag image, tỷ lệ khung hình của cả mask image và `<img>` là `1:1`, có nghĩa là trong trường hợp này `cover`, `contain` và `100%` đều tạo ra mask có cùng kích thước. Ví dụ này minh họa cách, khi `mask-size` được đặt thành `cover`, `contain` hoặc giá trị `<percentage>`, kích thước thực tế của mask có thể khác nhau tùy thuộc vào giá trị của [thuộc tính `mask-origin`](#the_mask-origin_property):

```html hidden live-sample___size
<div class="border-box">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<fieldset>
  <legend>Set the <code>mask-origin</code> value</legend>
  <label
    ><input type="radio" name="origin" id="border-box" checked />
    border-box</label
  >
  <label
    ><input type="radio" name="origin" id="padding-box" /> padding-box</label
  >
  <label
    ><input type="radio" name="origin" id="content-box" /> content-box</label
  >
</fieldset>
```

```css hidden live-sample___size
img {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
  mask-position: top left;
  padding: 15px;
  border: 15px solid;
  background-color: green;
}
```

```css live-sample___size
img {
  mask-size: 100%;
}
:has(#border-box:checked) img {
  mask-origin: border-box;
}
:has(#padding-box:checked) img {
  mask-origin: padding-box;
}
:has(#content-box:checked) img {
  mask-origin: content-box;
}
```

Thay đổi giá trị của thuộc tính `mask-origin` để xem các giá trị khác nhau ảnh hưởng đến kích thước mask như thế nào:

{{EmbedLiveSample("size", "", "350px")}}

Ví dụ này bao gồm một giá trị `<percentage>`. Khi một giá trị `<length-percentage>` được chỉ định, nó chỉ xác định chiều rộng mask, với chiều cao mặc định là `auto`, duy trì tỷ lệ khung hình. Khi hai giá trị được chỉ định, giá trị đầu tiên xác định chiều rộng mask và giá trị thứ hai xác định chiều cao của nó.

Giá trị mặc định của `mask-size` là `auto`, hiển thị mask ở {{glossary("intrinsic size")}}, kích thước mà mask sẽ được hiển thị nếu không áp dụng CSS. {{glossary("aspect ratio")}} cơ bản của mask image được duy trì nếu bạn đặt một giá trị `<length-percentage>` duy nhất, hoặc hai giá trị theo cùng tỷ lệ với tỷ lệ khung hình. Nếu bạn khai báo hai giá trị không theo cùng tỷ lệ với tỷ lệ khung hình, mask image bị biến dạng.

Giống như với tất cả các thành phần longhand của thuộc tính shorthand, nếu thuộc tính shorthand {{cssxref("mask")}} được đặt và giá trị của thuộc tính `mask-size` không được xác định trong bất kỳ mask layer nào, giá trị `mask-size` được đặt lại về giá trị ban đầu là `auto` cho những mask layer đó.

Nếu image không có tỷ lệ nội tại, ví dụ trong trường hợp [CSS gradient](/en-US/docs/Web/CSS/Reference/Values/gradient), `auto` mặc định là toàn bộ vùng định vị mask như được đặt bởi [thuộc tính `mask-origin`](#the_mask-origin_property).

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-size`, nó sẽ mặc định thành `auto` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
  mask-origin: border-box;
  mask-clip: border-box;
  mask-size: auto;
}
```

hoặc, mở rộng ví dụ sử dụng shorthand `mask`, với thành phần `mask-size` đặt sau giá trị `mask-position`, cách nhau bởi dấu gạch chéo (/):

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% / auto border-box border-box match-source,
    linear-gradient(to right, black, transparent) 0% 0% / auto border-box
      border-box match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% / auto border-box
      border-box match-source,
    none 0% 0% / auto border-box border-box match-source,
    url("#svg-mask") 0% 0% / auto border-box border-box match-source;
}
```

## Thuộc tính `mask-repeat`

Thuộc tính {{cssxref("mask-repeat")}} xác định cách các mask image được lặp lại, hay xếp ngói, sau khi mask image ban đầu đã được điều chỉnh kích thước và định vị. Thuộc tính `mask-repeat` xác định xem và cách mask image đó được lặp lại dọc theo các trục ngang và dọc. Trong hầu hết các ví dụ trước, bạn có thể đã nhận thấy star mask lặp lại dọc theo các trục X và Y. Điều này là vì `repeat` là giá trị mặc định.

Thuộc tính `mask-repeat` tương tự với thuộc tính {{cssxref("background-repeat")}}, chấp nhận các giá trị [`<repeat-style>`](/en-US/docs/Web/CSS/Reference/Properties/mask-repeat#values) giống nhau. Giống như trường hợp với `background-repeat`, lần lặp lại `mask-image` đầu tiên (và có thể là duy nhất) được định vị bởi [thuộc tính `*-position`](#the_mask-position_property) và được điều chỉnh kích thước bởi [thuộc tính `*-size`](#the_mask-size_property). Các vị trí của các background hay mask image lặp lại dựa trên phiên bản image ban đầu này.

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-repeat`, nó sẽ mặc định thành `repeat` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
  mask-origin: border-box;
  mask-clip: border-box;
  mask-size: auto;
  mask-repeat: repeat;
}
```

hoặc, mở rộng ví dụ sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% / auto repeat border-box border-box match-source,
    linear-gradient(to right, black, transparent) 0% 0% / auto repeat border-box
      border-box match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% / auto repeat
      border-box border-box match-source,
    none 0% 0% / auto repeat border-box border-box match-source,
    url("#svg-mask") 0% 0% / auto repeat border-box border-box match-source;
}
```

## Thuộc tính `mask-composite`

Shorthand {{cssxref("mask")}} bao gồm thuộc tính {{cssxref("mask-composite")}}, xác định cách nhiều mask được kết hợp để tạo ra hiệu ứng mask cuối cùng. Mỗi giá trị trong danh sách phân cách bằng dấu phẩy xác định xem trình duyệt có nên `add`, `subtract`, `intersect`, hay `exclude` mask layer liên quan từ hoặc vào các mask layer bên dưới nó. Tương tự như `mask-mode`, và các thuộc tính `mask-*` khác, không có thuộc tính nào trong shorthand {{cssxref("background")}} tương tự.

```html hidden live-sample___composite live-sample___composite3
<div class="add">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="subtract">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="intersect">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="exclude">
  <img
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
```

Trong ví dụ này, chúng ta bao gồm hai giá trị `mask-image`, bao gồm ngôi sao và gradient từ các ví dụ trước làm mask image:

```css live-sample___composite
img {
  mask-image:
    repeating-linear-gradient(
      to bottom right,
      red 0 20px,
      #ff000055 20px 40px,
      transparent 40px 60px
    ),
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
}
```

Chúng ta đặt giá trị `mask-composite` khác nhau cho mỗi image:

```css live-sample___composite live-sample___composite2 live-sample___composite3
.add img {
  mask-composite: add;
}
.subtract img {
  mask-composite: subtract;
}
.intersect img {
  mask-composite: intersect;
}
.exclude img {
  mask-composite: exclude;
}
```

```css hidden live-sample___composite live-sample___composite2 live-sample___composite3
div::before {
  content: "mask-composite: " attr(class);
  display: block;
  text-align: center;
  font-family: monospace;
}
body {
  flex-flow: row wrap;
}
```

{{EmbedLiveSample("composite", "", "600px")}}

Star mask bán trong suốt được thêm vào, trừ đi, giao với, hoặc loại trừ khỏi mask sọc, tùy thuộc vào giá trị `mask-composite`.

Thuộc tính `mask-composite` chỉ liên quan trong các trường hợp có hai mask layer trở lên. Điều này đọc là "mask layer", không phải "mask image" vì, nếu `none` được bao gồm, mask đen trong suốt được tổng hợp. Giá trị `none` có thể có tác động sâu sắc đến masking trong trường hợp `subtract` và `intersect`. Ví dụ, nếu `mask-mode` phân giải thành `luminance`, trừ đi một mask đen sẽ loại bỏ toàn bộ mask (phần tử sẽ bị ẩn). Tương tự, nếu `none` là layer cuối cùng với `mask-composite: intersect` được đặt cho layer đó, toàn bộ phần tử sẽ bị ẩn. Ở đây, chúng ta thêm layer thứ ba, với `none`, vào ví dụ trước:

```css live-sample___composite3
img {
  mask-image:
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg"),
    repeating-linear-gradient(
      to bottom right,
      red 0 20px,
      #ff000055 20px 40px,
      transparent 40px 60px
    ),
    none;
}
```

{{EmbedLiveSample("composite3", "", "600px")}}

Lưu ý cách ví dụ `intersect` loại trừ mọi thứ vì mask đen trong suốt không giao với bất cứ thứ gì.

Nếu chúng ta đảo ngược thứ tự của các mask layer, chúng ta cũng có thể nhận được các kết quả rất khác nhau:

```html hidden live-sample___composite2
<div class="subtract">
  <img
    class="gradientFirst"
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
<div class="subtract">
  <img
    class="starFirst"
    src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    alt="Pride flag" />
</div>
```

```css live-sample___composite2
.gradientFirst {
  mask-image:
    repeating-linear-gradient(
      to bottom right,
      red 0 20px,
      #ff000055 20px 40px,
      transparent 40px 60px
    ),
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
}
.starFirst {
  mask-image:
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg"),
    repeating-linear-gradient(
      to bottom right,
      red 0 20px,
      #ff000055 20px 40px,
      transparent 40px 60px
    );
}
```

{{EmbedLiveSample("composite2", "", "350px")}}

Trong ví dụ đầu tiên, các ngôi sao bị trừ khỏi các sọc. Trong ví dụ thứ hai, các sọc bị trừ khỏi các ngôi sao.

Giống như tất cả các thuộc tính thành phần `mask` khác, `mask-composite` nhận danh sách phân cách bằng dấu phẩy. Vì thuộc tính ảnh hưởng đến cách các mask được kết hợp, thuộc tính này chỉ liên quan cho nhiều mask layer và số lượng giá trị được sử dụng ít hơn một so với số lượng mask layer.

Cặp mask cuối cùng được tổng hợp trước. Mask image trước đó sau đó được tổng hợp với composition trước đó.

Tiếp tục với ví dụ `masked-element`, nếu chúng ta không đặt rõ ràng thuộc tính `mask-composite`, nó sẽ mặc định thành `add` cho mỗi layer, như thể chúng ta đã đặt như sau:

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
  mask-mode: match-source;
  mask-position: 0% 0%;
  mask-origin: border-box;
  mask-clip: border-box;
  mask-size: auto;
  mask-repeat: repeat;
  mask-composite: add;
}
```

Trong trường hợp này, phần tử `<mask>` sẽ được tổng hợp với layer `none`. Sau đó radial gradient sẽ được tổng hợp với kết quả của composition trước đó, và cứ thế tiếp tục.

Giống như chúng ta đã thấy với tất cả các thuộc tính thành phần khác, chúng ta có thể đã sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png") 0% 0% / auto repeat border-box border-box add
      match-source,
    linear-gradient(to right, black, transparent) 0% 0% / auto repeat border-box
      border-box add match-source,
    radial-gradient(circle, white 50%, transparent 75%) 0% 0% / auto repeat
      border-box border-box add match-source,
    none 0% 0% / auto repeat border-box border-box add match-source,
    url("#svg-mask") 0% 0% / auto repeat border-box border-box add match-source;
}
```

## Xem thêm

- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
