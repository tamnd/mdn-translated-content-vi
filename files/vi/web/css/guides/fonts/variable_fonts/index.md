---
title: Variable fonts
slug: Web/CSS/Guides/Fonts/Variable_fonts
page-type: guide
sidebar: cssref
---

**Variable fonts** là sự phát triển của đặc tả font OpenType cho phép nhiều biến thể khác nhau của một typeface được kết hợp vào một tệp duy nhất, thay vì có tệp font riêng biệt cho mỗi chiều rộng, trọng lượng hoặc kiểu. Chúng cho phép bạn truy cập tất cả các biến thể có trong một tệp font nhất định thông qua CSS và một tham chiếu {{cssxref("@font-face")}} duy nhất. Bài viết này sẽ cung cấp cho bạn tất cả những gì bạn cần biết để bắt đầu sử dụng variable fonts.

> [!NOTE]
> Để sử dụng variable fonts trên hệ điều hành của bạn, bạn cần đảm bảo rằng nó được cập nhật. Ví dụ, các hệ điều hành Linux cần phiên bản Linux FreeType mới nhất, và macOS trước High Sierra (10.13) không hỗ trợ variable fonts. Nếu hệ điều hành của bạn không được cập nhật, bạn sẽ không thể sử dụng variable fonts trong các trang web hoặc Firefox Developer Tools.

## Variable Fonts: chúng là gì và khác nhau như thế nào

Để hiểu rõ hơn những gì khác biệt về variable fonts, đáng để xem lại các font không phải variable trông như thế nào và cách so sánh.

### Font tiêu chuẩn (hoặc Static)

Trong quá khứ, một typeface sẽ được sản xuất dưới dạng một số font riêng lẻ, và mỗi font sẽ đại diện cho một kết hợp chiều rộng/trọng lượng/kiểu cụ thể. Vì vậy bạn sẽ có các tệp riêng biệt cho 'Roboto Regular', 'Roboto Bold', và 'Roboto Bold Italic' — có nghĩa là bạn có thể kết thúc với 20 hoặc 30 tệp font khác nhau để đại diện cho một typeface hoàn chỉnh (có thể nhiều hơn vài lần đối với typeface lớn cũng có các chiều rộng khác nhau).

Trong tình huống như vậy, để sử dụng typeface cho văn bản body thông thường trên site, bạn sẽ cần ít nhất bốn tệp: regular, italic, bold, và bold italic. Nếu bạn muốn thêm nhiều trọng lượng hơn, như nhẹ hơn cho chú thích hoặc đậm hơn để nhấn mạnh thêm, điều đó có nghĩa là thêm nhiều tệp nữa. Điều này dẫn đến nhiều HTTP request hơn, và nhiều dữ liệu được tải xuống hơn (thường khoảng 20k hoặc hơn mỗi tệp).

### Variable fonts

Với variable font, tất cả các hoán vị đó có thể được chứa trong một tệp duy nhất. Tệp đó sẽ lớn hơn một font đơn, nhưng trong hầu hết các trường hợp nhỏ hơn hoặc khoảng cùng kích thước với 4 tệp bạn có thể tải cho văn bản body. Lợi thế khi chọn variable font là bạn có quyền truy cập vào toàn bộ phạm vi trọng lượng, chiều rộng và kiểu có sẵn, thay vì bị giới hạn ở chỉ một vài tệp bạn đã tải riêng biệt.

Điều này cho phép các kỹ thuật typography phổ biến như đặt các tiêu đề có kích thước khác nhau với các trọng lượng khác nhau để dễ đọc hơn ở mỗi kích thước hoặc sử dụng chiều rộng hẹp hơn một chút cho các màn hình dày đặc dữ liệu. Để so sánh, thông thường trong một hệ thống typography cho tạp chí sử dụng 10–15 hoặc nhiều kết hợp trọng lượng và chiều rộng khác nhau trong suốt ấn phẩm — cho phạm vi kiểu rộng hơn nhiều so với hiện tại thường có trên web (hoặc thực tế vì lý do hiệu suất).

#### Lưu ý về font families, weights và variants

Bạn có thể nhận thấy rằng chúng ta đã nói về việc có tệp font cụ thể cho mỗi trọng lượng và kiểu (tức là bold và italic và bold italic), thay vì dựa vào trình duyệt tổng hợp chúng. Lý do cho điều này là hầu hết các typeface có thiết kế rất cụ thể cho các trọng lượng đậm hơn và italic thường bao gồm các ký tự hoàn toàn khác nhau (chữ thường 'a' và 'g' thường khá khác nhau trong italic, ví dụ). Để phản ánh chính xác nhất thiết kế typeface và tránh sự khác biệt giữa các trình duyệt và cách chúng có thể hoặc không thể tổng hợp các kiểu khác nhau, chính xác hơn là tải các tệp font cụ thể khi cần thiết khi sử dụng font không phải variable.

Bạn cũng có thể thấy rằng một số variable fonts được tách thành hai tệp: một cho các kiểu upright và tất cả biến thể của chúng, và một chứa các biến thể italic. Đôi khi điều này được thực hiện để giảm kích thước tệp tổng thể trong trường hợp italics không cần thiết hoặc không được sử dụng. Trong mọi trường hợp, vẫn có thể liên kết chúng với một tên {{cssxref("font-family")}} chung để bạn có thể gọi chúng bằng cùng `font-family` và {{cssxref("font-style")}} phù hợp.

## Giới thiệu về 'variation axis'

Trung tâm của định dạng variable fonts mới là khái niệm về **axis of variation** mô tả phạm vi cho phép của khía cạnh cụ thể đó của thiết kế typeface. Vì vậy 'weight axis' mô tả các letterform có thể nhẹ hoặc đậm đến mức nào; 'width axis' mô tả chúng có thể hẹp hoặc rộng đến mức nào; 'italic axis' mô tả xem các letterform italic có mặt và có thể bật hoặc tắt tương ứng hay không, v.v. Lưu ý rằng một axis có thể là một phạm vi hoặc lựa chọn nhị phân. Weight có thể nằm trong khoảng từ 1–999, trong khi italic có thể là 0 hoặc 1 (tắt hoặc bật).

Theo định nghĩa trong đặc tả, có hai loại axis: **registered** và **custom**:

- Các registered axis là những axis thường gặp nhất, và đủ phổ biến để các tác giả của đặc tả cảm thấy đáng để tiêu chuẩn hóa. Năm registered axis hiện tại là weight, width, slant, italic, và optical size. W3C đã thực hiện để ánh xạ chúng sang các thuộc tính CSS hiện có, và trong một trường hợp đã giới thiệu thuộc tính mới, mà bạn sẽ thấy bên dưới.
- Custom axes không giới hạn: nhà thiết kế typeface có thể định nghĩa và phạm vi bất kỳ axis nào họ thích và chỉ cần cho nó một **tag** bốn chữ cái để xác định nó trong định dạng tệp font. Bạn có thể sử dụng các tag bốn chữ cái này trong CSS để chỉ định một điểm dọc theo axis biến thể đó, như sẽ được hiển thị trong các ví dụ mã bên dưới.

### Registered axes và các thuộc tính CSS hiện có

Trong phần này chúng ta sẽ minh họa năm registered axis được định nghĩa với các ví dụ và thuộc tính CSS tương ứng. Khi có thể, cả cú pháp tiêu chuẩn và cấp thấp hơn đều được bao gồm. Cú pháp cấp thấp hơn ({{cssxref("font-variation-settings")}}) là cơ chế đầu tiên được triển khai để kiểm tra các triển khai ban đầu của hỗ trợ variable font và cần thiết để sử dụng các axis mới hoặc tùy chỉnh ngoài năm registered axis. Tuy nhiên, mục đích của W3C là cú pháp này không được sử dụng khi có các thuộc tính khác. Do đó bất cứ khi nào có thể, thuộc tính phù hợp nên được sử dụng, với cú pháp cấp thấp của `font-variation-settings` chỉ được sử dụng để đặt các giá trị hoặc axis không có sẵn theo cách khác.

#### Lưu ý

1. Khi sử dụng `font-variation-settings`, điều quan trọng cần lưu ý là tên axis phân biệt chữ hoa chữ thường. Tên registered axis phải là chữ thường, và các custom axis phải là chữ hoa. Ví dụ:

   ```css
   font-variation-settings:
     "wght" 375,
     "GRAD" 88;
   ```

   `wght` (weight) là registered axis, và `GRAD` (grade) là custom axis.

2. Nếu bạn đã đặt giá trị bằng `font-variation-settings` và muốn thay đổi một trong các giá trị đó, bạn phải khai báo lại tất cả chúng (giống như khi bạn đặt các tính năng font OpenType bằng {{cssxref("font-feature-settings")}}). Bạn có thể khắc phục giới hạn này bằng cách sử dụng [CSS Custom Properties](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) (CSS variables) cho các giá trị riêng lẻ, và sửa đổi giá trị của một custom property riêng lẻ. Mã ví dụ sẽ được đề cập ở cuối hướng dẫn.

### Weight

Weight (được đại diện bởi tag `wght`) định nghĩa design axis về mức độ mảnh hoặc dày (nhẹ hoặc nặng, theo thuật ngữ typography thông thường) của các nét trong letterform. Trong một thời gian dài trong CSS đã có khả năng chỉ định điều này thông qua thuộc tính {{cssxref("font-weight")}}, lấy các giá trị số từ 100 đến 900 theo bội số 100, và các từ khóa như `normal` hoặc `bold`, là các alias cho các giá trị số tương ứng của chúng (400 và 700 trong trường hợp này). Những điều này vẫn được áp dụng khi làm việc với các font không phải variable hoặc variable, nhưng với các font variable, bất kỳ số nào từ 1 đến 1000 đều hợp lệ.

Cần lưu ý rằng tại thời điểm này không có cách nào trong khai báo `@font-face` để 'ánh xạ' một điểm cụ thể trên variation axis của variable font tới từ khóa `bold` (hoặc bất kỳ từ khóa nào khác). Điều này thường có thể được giải quyết khá dễ dàng, nhưng đòi hỏi một bước thêm trong việc viết CSS:

```css
font-weight: 375;

font-variation-settings: "wght" 375;
```

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa mã CSS để thử các giá trị font-weight.

```html hidden live-sample___variable-fonts-weight-example
<div>
  <p class="p1">Weight</p>
  <span>(font-weight: 625)</span>
</div>
<div>
  <p class="p2">Weight</p>
  <span>(font-variation-settings: "wght" 625)</span>
</div>
<div class="adjustable">
  <p class="p3">Weight</p>
  (font-variation-settings: "wght" <span id="angle-text">625</span>)<br />
  <label for="text-axis">Adjust Weight: </label>
  <input
    type="range"
    id="text-axis"
    name="text-axis"
    min="300"
    max="900"
    value="625" />
</div>
```

```css hidden live-sample___variable-fonts-weight-example
@font-face {
  font-family: "Amstelvar VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 35% 100%;
  font-style: normal;
  font-display: swap;
}

p {
  font:
    1.2em "Amstelvar VF",
    "Georgia",
    serif;
  font-size: 4rem;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 625;
}
```

```css live-sample___variable-fonts-weight-example
/* weight range is 300 to 900 */
.p1 {
  font-weight: 625;
}

/* weight range is 300 to 900 */
.p2 {
  font-variation-settings: "wght" 625;
}

/* Adjust with slider & custom property */
.p3 {
  font-variation-settings: "wght" var(--text-axis);
}
```

```js hidden live-sample___variable-fonts-weight-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("variable-fonts-weight-example", "", "450px")}}

### Width

Width (được đại diện bởi tag `wdth`) định nghĩa design axis về mức độ hẹp hoặc rộng (condensed hoặc extended, theo thuật ngữ typography) của các letterform có thể. Điều này thường được đặt trong CSS bằng thuộc tính {{cssxref("font-stretch")}}, với các giá trị được biểu thị dưới dạng phần trăm trên hoặc dưới 'normal' (100%), bất kỳ số nào lớn hơn 0 đều hợp lệ về mặt kỹ thuật — mặc dù có nhiều khả năng phạm vi sẽ gần với mốc 100% hơn, chẳng hạn như 75%-125%. Nếu giá trị số được cung cấp nằm ngoài phạm vi được mã hóa trong font, trình duyệt sẽ render font ở giá trị gần nhất cho phép.

> [!NOTE]
> Ký hiệu % không được sử dụng khi sử dụng `font-variation-settings`.

```css
font-stretch: 115%;

font-variation-settings: "wdth" 115;
```

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa mã CSS để thử các giá trị font width.

```html hidden live-sample___variable-fonts-width-example
<div>
  <p class="p1">Width</p>
  <span>(font-stretch: 60%)</span>
</div>
<div>
  <p class="p2">Width</p>
  <span>(font-variation-settings: "wdth" 60)</span>
</div>
<div class="adjustable">
  <p class="p3">Width</p>
  (font-variation-settings: "wdth" <span id="angle-text">60</span>)<br />

  <label for="text-axis">Adjust Width: </label>
  <input
    type="range"
    id="text-axis"
    name="text-axis"
    min="55"
    max="100"
    value="60" />
</div>
```

```css hidden live-sample___variable-fonts-width-example
@font-face {
  font-family: "Amstelvar VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 35% 100%;
  font-style: normal;
  font-display: swap;
}

p {
  font:
    1.2em "Amstelvar VF",
    "Georgia",
    serif;
  font-size: 4rem;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 60;
}
```

```css live-sample___variable-fonts-width-example
/* width range is 55% to 100% */
.p1 {
  font-stretch: 60%;
}

/* width range is an integer from 55 to 100 */
.p2 {
  font-variation-settings: "wdth" 60;
}

/* Adjust with slider & custom property */
.p3 {
  font-variation-settings: "wdth" var(--text-axis);
}
```

```js hidden live-sample___variable-fonts-width-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("variable-fonts-width-example", "", "450px")}}

### Italic

Axis Italic (`ital`) có thể được đặt trong phạm vi `[0-1]`, trong đó `0` chỉ định "không italic," `0.5` chỉ định "italic nửa chừng," và `1` chỉ định "fully italic." Các thiết kế italic thường bao gồm các letterform hoàn toàn khác nhau so với các đối tác thẳng đứng của chúng, vì vậy trong quá trình chuyển đổi từ thẳng đứng sang italic, một số thay thế glyph (hoặc ký tự) thường xảy ra. Italic và oblique thường được sử dụng thay thế cho nhau ở một mức độ nào đó, nhưng thực ra khá khác nhau. Oblique được định nghĩa trong ngữ cảnh này với thuật ngữ `slant` (xem phần bên dưới), và typeface thường có một trong hai cái đó, nhưng không phải cả hai.

Trong CSS, cả italic và oblique đều được áp dụng cho văn bản bằng thuộc tính {{cssxref("font-style")}}. Cũng lưu ý việc giới thiệu `font-synthesis: none;` — điều này sẽ ngăn trình duyệt vô tình áp dụng variation axis và italic tổng hợp. Điều này cũng có thể được sử dụng để ngăn faux-bolding.

```css
font-style: italic;

font-variation-settings: "ital" 1;

font-synthesis: none;
```

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa mã CSS để thử các kiểu font italic.

```html hidden live-sample___variable-fonts-italic-example
<div>
  <p class="p1">Italic</p>
  <span>(font-style: italic)</span>
  <p class=".p1-no-synthesis">Italic</p>
  <span>(font-style: italic; font-synthesis: none)</span>
</div>
<div>
  <p class="p2">Italic</p>
  <span>(font-variation-settings: "ital" 1)</span>
</div>
<div class="adjustable">
  <p class="p3">Italic</p>
  (font-variation-settings: "ital" <span id="angle-text">1</span>)<br />

  <label for="slant-angle">Adjust Italic: </label>
  <input
    type="range"
    id="text-axis"
    name="text-axis"
    min="0"
    max="1"
    value="1" />
</div>
```

```css hidden live-sample___variable-fonts-italic-example
@font-face {
  font-family: "Jost VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/jost-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 75% 150%;
  font-display: swap;
}

p {
  font:
    1.2em "Jost VF",
    "Helvetica",
    "Arial",
    sans-serif;
  font-size: 4rem;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 1;
}
```

```css live-sample___variable-fonts-italic-example
/* font-style: italic, with and without font-synthesis */
.p1 {
  font-style: italic;
}

.p1-no-synthesis {
  font-style: italic;
  font-synthesis: none;
}

/* italic range is 0 or 1 */
.p2 {
  font-variation-settings: "ital" 1;
  font-synthesis: none;
}

/* Adjust with slider & custom property */
.p3 {
  font-synthesis: none;
  font-variation-settings: "ital" var(--text-axis);
}
```

```js hidden live-sample___variable-fonts-italic-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("variable-fonts-italic-example", "", "450px")}}

### Slant

Slant (được đại diện bởi tag `slnt`), hay thường được gọi là 'oblique' — khác với italic thực sự ở chỗ nó thay đổi góc của letterform nhưng không thực hiện bất kỳ loại thay thế ký tự nào. Nó cũng là variable, ở chỗ nó được biểu thị dưới dạng phạm vi số. Điều này cho phép font được biến đổi ở bất kỳ đâu dọc theo slant axis. Phạm vi cho phép là từ -90 đến 90 độ.

Hai thuộc tính có thể kiểm soát slant là {{cssxref("font-style")}} và {{cssxref("font-variation-settings")}}. Hai khai báo thuộc tính sau đây là như nhau:

```plain
font-style: oblique 14deg;

font-variation-settings: "slnt" -14;
```

Ưu tiên thuộc tính `font-style` hơn thuộc tính `font-variation-settings`. Từ khóa `deg` không được sử dụng khi dùng thuộc tính `font-variation-settings`. Ngoài ra, trong trường hợp thuộc tính `font-variation-settings`, góc dương có nghĩa là slant ngược chiều kim đồng hồ.

Trong ví dụ trực tiếp sau đây, bạn có thể điều chỉnh slant.

```html hidden live-sample___slant-example
<div>
  <p class="font-style">Slant</p>
  <span>(font-style: oblique 5deg)</span>
</div>
<div>
  <p class="font-variation">Slant</p>
  <span>(font-variation-settings: 'slnt' -5)</span>
</div>
<div class="adjustable-box">
  <p class="adjustable">Slant</p>
  (font-variation-settings: 'slnt' <span id="angle-text">-5</span>)<br />

  <label for="slant-angle">Adjust Slant: </label>
  <input
    type="range"
    name="range-slider"
    value="5"
    id="slant-angle"
    min="-15"
    max="15" />
</div>
```

```css hidden live-sample___slant-example
@font-face {
  font-family: "SlantFont";
  font-style: oblique -15deg 15deg;
  src: url("https://mdn.github.io/shared-assets/fonts/font_with_slant_axis.woff2")
    format("woff2");
}

p {
  font-family: "SlantFont", sans-serif;
  display: inline-block;
  margin: 1rem;
  font-size: 4rem;
}

.adjustable-box {
  border: 1px dashed;
  --text-axis: -5;
}
```

```css live-sample___slant-example
.font-style {
  font-style: oblique 5deg;
}

.font-variation {
  font-variation-settings: "slnt" -5;
}

.adjustable {
  font-variation-settings: "slnt" var(--slant-angle);
}
```

```js hidden live-sample___slant-example
const angle = document.querySelector("#slant-angle");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = -1 * e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--slant-angle", angle);
});
```

{{EmbedLiveSample("slant-example", "", "400")}}

### Optical size

Đây là điều mới đối với các font kỹ thuật số và CSS, nhưng là kỹ thuật hàng thế kỷ trong việc thiết kế và tạo loại kim loại. Optical sizing đề cập đến thực tiễn thay đổi độ dày tổng thể của nét trong letterform dựa trên kích thước vật lý. Nếu kích thước rất nhỏ (chẳng hạn như tương đương 10 hoặc 12px), các ký tự sẽ có nét tổng thể dày hơn, và có thể một số sửa đổi nhỏ khác để đảm bảo nó sẽ tái tạo và dễ đọc ở kích thước vật lý nhỏ hơn. Ngược lại, khi kích thước lớn hơn nhiều được sử dụng (như 48 hoặc 60px), có thể có sự biến đổi lớn hơn nhiều trong các trọng lượng nét dày và mỏng, thể hiện thiết kế typeface phù hợp hơn với ý định ban đầu.

Mặc dù điều này ban đầu được thực hiện để bù đắp cho quá trình in mực và giấy (các đường rất mỏng ở kích thước nhỏ thường không in được, tạo cho letterform vẻ ngoài bị gãy), nó chuyển tốt sang các màn hình kỹ thuật số khi bù đắp cho chất lượng màn hình và rendering kích thước vật lý.

Các giá trị optical size thường được tự động áp dụng tương ứng với `font-size`, nhưng cũng có thể được thao tác bằng cú pháp `font-variation-settings` cấp thấp hơn.

Có một thuộc tính mới, {{cssxref("font-optical-sizing")}}, được tạo ra để hỗ trợ variable fonts trong CSS. Khi sử dụng `font-optical-sizing`, các giá trị cho phép duy nhất là `auto` hoặc `none` — vì vậy thuộc tính này chỉ cho phép bật hoặc tắt optical sizing. Tuy nhiên khi sử dụng `font-variation-settings: 'opsz' <num>`, bạn có thể cung cấp giá trị số. Trong hầu hết các trường hợp, bạn sẽ muốn khớp `font-size` (kích thước vật lý mà type đang được render) với giá trị `opsz` (đó là cách optical sizing được áp dụng khi sử dụng `auto`). Tùy chọn cung cấp giá trị cụ thể được cung cấp để nếu cần ghi đè mặc định — vì lý do dễ đọc, thẩm mỹ, hoặc lý do nào khác — một giá trị cụ thể có thể được áp dụng.

```css
font-optical-sizing: auto;

font-variation-settings: "opsz" 36;
```

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa mã CSS để thử các giá trị optical size.

```html hidden live-sample___optical-sizing-example
<div>
  <p class="p1">Optical Size</p>
  <span>(font-optical-sizing: none)</span>
</div>
<div>
  <p class="p2">Optical Size</p>
  <span>(font-optical-sizing: auto)</span>
</div>
<div>
  <p class="p3">Optical Size</p>
  <span>(font-variation-settings: "opsz" 64)</span>
</div>

<div class="adjustable">
  <p class="p4">Optical Size</p>
  (font-variation-settings: "opsz" <span id="angle-text">-64</span>)<br />

  <label for="slant-angle">Adjust Optical Sizing: </label>
  <input
    type="range"
    name="text-axis"
    value="64"
    id="text-axis"
    min="8"
    max="144" />
</div>
```

```css hidden live-sample___optical-sizing-example
@font-face {
  font-family: "Amstelvar VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 75% 150%;
  font-style: normal;
  font-display: swap;
}

p {
  font:
    1.2em "Amstelvar VF",
    "Georgia",
    serif;
  font-size: 4rem;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 64;
}
```

```css live-sample___optical-sizing-example
.p1 {
  font-optical-sizing: none;
}
/* font-optical-sizing can be auto or none */
.p2 {
  font-optical-sizing: auto;
}

/* optical range is from 8 to 144 */
.p3 {
  font-variation-settings: "opsz" 64;
}

/* Adjust with slider & custom property */
.p4 {
  font-variation-settings: "opsz" var(--text-axis);
}
```

```js hidden live-sample___optical-sizing-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("optical-sizing-example", "", "550px")}}

### Custom axes

Custom axes chính xác là: chúng có thể là bất kỳ axis biến thể thiết kế nào mà nhà thiết kế typeface tưởng tượng. Có thể có một số trở nên khá phổ biến — hoặc thậm chí được đăng ký — nhưng chỉ có thời gian mới biết.

### Grade

Grade có thể trở thành một trong các custom axis phổ biến hơn vì nó có lịch sử đã biết trong thiết kế typeface. Thực tiễn thiết kế các grade khác nhau của typeface thường được thực hiện để phản ứng với mục đích sử dụng và kỹ thuật in ấn. Thuật ngữ 'grade' đề cập đến trọng lượng hoặc mật độ tương đối của thiết kế typeface, nhưng khác với 'weight' truyền thống ở chỗ không gian vật lý mà văn bản chiếm không thay đổi, vì vậy thay đổi grade văn bản không thay đổi layout tổng thể của văn bản hoặc các phần tử xung quanh nó. Điều này làm cho grade trở thành axis biến thể hữu ích vì nó có thể được biến đổi hoặc animate mà không gây ra reflow của chính văn bản.

```css
font-variation-settings: "GRAD" 88;
```

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa mã CSS để thử các giá trị font grade.

```html hidden live-sample___grade-example
<div>
  <p class="p1">Grade</p>
  <span>(font-variation-settings: 'GRAD' 88)</span>
</div>

<div class="adjustable">
  <p class="p2">Grade</p>
  (font-variation-settings: 'GRAD' <span id="angle-text">88</span>)<br />

  <label for="slant-angle">Adjust Grade: </label>
  <input
    type="range"
    name="text-axis"
    value="88"
    id="text-axis"
    min="88"
    max="150" />
</div>
```

```css hidden live-sample___grade-example
@font-face {
  font-family: "Amstelvar VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 75% 150%;
  font-style: normal;
  font-display: swap;
}

p {
  font:
    1.2em "Amstelvar VF",
    "Georgia",
    serif;
  font-size: 64px;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 88;
}
```

```css live-sample___grade-example
/* grade range is 88 to 150 */
.p1 {
  font-size: 64px;
  font-variation-settings: "GRAD" 88;
}

/* Adjust with slider & custom property */
.p2 {
  font-size: 64px;
  font-variation-settings: "GRAD" var(--text-axis);
}
```

```js hidden live-sample___grade-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("grade-example", "", "300px")}}

### Sử dụng variable font: các thay đổi @font-face

Cú pháp tải variable fonts rất giống với bất kỳ web font nào khác, với một vài điểm khác biệt đáng chú ý, được cung cấp thông qua các nâng cấp cho cú pháp {{cssxref("@font-face")}} truyền thống hiện có trong các trình duyệt hiện đại.

Cú pháp cơ bản là như nhau, nhưng font technology có thể được chỉ định, và các phạm vi cho phép cho các descriptor như `font-weight` và `font-stretch` có thể được cung cấp, thay vì đặt tên theo tệp font đang được tải.

#### Ví dụ cho font upright (Roman) tiêu chuẩn

```css
@font-face {
  font-family: "MyVariableFontName";
  src: url("path/to/font/file/my-variable-font.woff2")
    format("woff2-variations");
  font-weight: 125 950;
  font-stretch: 75% 125%;

  font-style: normal;
}
```

Trong trường hợp này, khai báo `font-style: normal` chỉ ra rằng tệp font này nên được sử dụng khi `font-family` được đặt thành `MyVariableFontName` và {{cssxref("font-style")}} được đặt thành `normal`. Như một thay thế, bạn có thể sử dụng `font-style: oblique 0deg` hoặc `font-style: oblique 0deg 20deg` để chỉ ra rằng font có các glyph upright thông thường (được chỉ ra bởi `0deg`).

#### Ví dụ cho font chỉ chứa italic và không có ký tự upright

```css
@font-face {
  font-family: "MyVariableFontName";
  src: url("path/to/font/file/my-variable-font.woff2")
    format("woff2-variations");
  font-weight: 125 950;
  font-stretch: 75% 125%;

  font-style: italic;
}
```

Trong trường hợp này, khai báo `font-style: italic` chỉ ra rằng tệp font này nên được sử dụng khi `font-family` được đặt thành `MyVariableFontName` và {{cssxref("font-style")}} được đặt thành `italic`. Như một thay thế, bạn có thể sử dụng `font-style: oblique 14deg` để chỉ ra rằng font có các glyph italic.

#### Ví dụ cho font chứa oblique (slant) axis

```css
@font-face {
  font-family: "MyVariableFontName";
  src: url("path/to/font/file/my-variable-font.woff2")
    format("woff2-variations");
  font-weight: 125 950;
  font-stretch: 75% 125%;

  font-style: oblique 0deg 12deg;
}
```

Trong trường hợp này, giá trị `oblique 0deg 12deg` chỉ ra rằng tệp font này nên được sử dụng khi trong quy tắc kiểu, thuộc tính `font-family` là `MyVariableFontName` và thuộc tính [font-style](/en-US/docs/Web/CSS/Reference/Properties/font-style) là oblique với góc từ không đến 12 độ bao gồm.

> [!NOTE]
> Không phải tất cả các trình duyệt đều triển khai cú pháp đầy đủ cho định dạng font, vì vậy hãy kiểm tra cẩn thận. Tất cả các trình duyệt hỗ trợ variable fonts sẽ vẫn render chúng nếu bạn đặt định dạng chỉ là định dạng tệp, thay vì format-variations (tức là `woff2` thay vì `woff2-variations`), nhưng tốt nhất là sử dụng cú pháp đúng nếu có thể.

> [!NOTE]
> Cung cấp các phạm vi giá trị cho `font-weight`, `font-stretch`, và `font-style` sẽ ngăn trình duyệt cố gắng render axis nằm ngoài phạm vi đó nếu bạn đang sử dụng thuộc tính phù hợp (tức là `font-weight` hoặc `font-stretch`), nhưng sẽ không ngăn bạn cung cấp giá trị không hợp lệ thông qua `font-variation-settings`, vì vậy hãy sử dụng cẩn thận.

## Làm việc với các trình duyệt cũ hơn

Hỗ trợ variable font có thể được kiểm tra với CSS Feature Queries (xem {{cssxref("@supports")}}), vì vậy có thể sử dụng variable fonts trong môi trường sản xuất và phạm vi CSS gọi variable fonts bên trong khối feature query.

```css
h1 {
  font-family: some-non-variable-font-family;
}

@supports (font-variation-settings: "wdth" 115) {
  h1 {
    font-family: some-variable-font-family;
  }
}
```

## Trang mẫu

Các trang ví dụ sau đây cho thấy hai cách khác nhau để cấu trúc CSS của bạn. Cách đầu tiên sử dụng các thuộc tính tiêu chuẩn bất cứ khi nào có thể. Ví dụ thứ hai sử dụng CSS Custom Properties để đặt giá trị cho chuỗi `font-variation-settings` và cho thấy cách bạn có thể dễ dàng cập nhật các giá trị biến đổi đơn lẻ bằng cách ghi đè một biến duy nhất thay vì viết lại toàn bộ chuỗi. Lưu ý hiệu ứng hover trên `h2`, chỉ thay đổi giá trị grade axis custom property. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___sample-page-example
<div class="container container1">
  <h1>Moby-Dick</h1>
  <h2>CHAPTER 1. Loomings.</h2>
  <p>
    Call me Ishmael. Some years ago—never mind how long precisely–having little
    or no money in my purse, and nothing particular to interest me on shore, I
    thought I would sail about a little and see the watery part of the world. It
    is a way I have of driving off the spleen and regulating the circulation.
    Whenever I find myself growing grim about the mouth; whenever it is a damp,
    drizzly November in my soul; whenever I find myself involuntarily pausing
    before coffin warehouses, and bringing up the rear of every funeral I meet;
    and especially whenever my hypos get such an upper hand of me, that it
    requires a strong moral principle to prevent me from deliberately stepping
    into the street, and methodically knocking people's hats off then, I account
    it high time to get to sea as soon as I can.
  </p>
</div>
<hr />
<div class="container container2 demo2">
  <h1>Moby-Dick</h1>
  <h2>CHAPTER 1. (hover here)</h2>
  <p>
    Call me Ishmael. Some years ago—never mind how long precisely–having little
    or no money in my purse, and nothing particular to interest me on shore, I
    thought I would sail about a little and see the watery part of the world. It
    is a way I have of driving off the spleen and regulating the circulation.
    Whenever I find myself growing grim about the mouth; whenever it is a damp,
    drizzly November in my soul; whenever I find myself involuntarily pausing
    before coffin warehouses, and bringing up the rear of every funeral I meet;
    and especially whenever my hypos get such an upper hand of me, that it
    requires a strong moral principle to prevent me from deliberately stepping
    into the street, and methodically knocking people's hats off then, I account
    it high time to get to sea as soon as I can.
  </p>
</div>
```

```css hidden live-sample___sample-page-example
@font-face {
  font-family: "Amstelvar VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.woff2")
    format("woff2-variations");
  font-weight: 300 900;
  font-stretch: 75% 150%;
  font-style: normal;
  font-display: swap;
}

body {
  font:
    1.2em "Amstelvar VF",
    "Georgia",
    serif;
  margin: 20px;
  padding: 0;
}

.container * {
  margin: 0.5rem auto 1rem;
  max-width: 42rem;
}
```

```css live-sample___sample-page-example
.container1 h1 {
  font-optical-sizing: auto;
  font-size: 5rem;
  font-stretch: 85%;
  font-weight: 450;
}
.container1 h2 {
  font-optical-sizing: auto;
  font-size: 2.25rem;
  font-stretch: 90%;
  font-weight: 575;
}
.container1 p {
  font-optical-sizing: auto;
  font-size: 1rem;
  font-stretch: 100%;
  font-weight: 375;
}
.demo2 {
  --text-wght: 375;
  --text-wdth: 100;
  --text-opsz: 16;
  --text-GRAD: 88;
}
.container2 > * {
  font-size: 5rem;
  font-variation-settings:
    "wght" var(--text-wght),
    "wdth" var(--text-wdth),
    "opsz" var(--text-opsz),
    "GRAD" var(--text-GRAD);
}
.container2 h1 {
  --text-wght: 450;
  --text-wdth: 85;
  --text-opsz: 80;
  font-size: 5rem;
}
.container2 h2 {
  --text-wght: 575;
  --text-wdth: 95;
  --text-opsz: 36;
  font-size: 2.25rem;
}
.container2 h2:hover {
  --text-GRAD: 130;
}
.container2 p {
  font-size: 1rem;
}
```

{{EmbedLiveSample("sample-page-example", "", "850px")}}

## Tài nguyên

- [W3C CSS Fonts Module 4 Specification](https://drafts.csswg.org/css-fonts-4/) (editor's draft)
- [W3C GitHub issue queue](https://github.com/w3c/csswg-drafts/issues)
- [Microsoft Open Type Variations introduction](https://learn.microsoft.com/en-us/typography/opentype/spec/otvaroverview)
- [Microsoft OpenType Design-Variation Axis Tag Registry](https://learn.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg)
- [Wakamai Fondue](https://wakamaifondue.com/) (trang web cho bạn biết font của bạn có thể làm gì thông qua giao diện kéo và thả)
- [Axis Praxis](https://www.axis-praxis.org/) (trang playground variable fonts gốc)
- [V-Fonts.com](https://v-fonts.com/) (danh mục variable fonts và nơi có thể tải chúng)
- [Font Playground](https://play.typedetail.com/) (playground khác cho variable fonts với các cách tiếp cận giao diện người dùng độc đáo)
