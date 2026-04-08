---
title: font-variation-settings
slug: Web/CSS/Reference/Properties/font-variation-settings
page-type: css-property
browser-compat: css.properties.font-variation-settings
sidebar: cssref
---

Thuộc tính **`font-variation-settings`** [CSS](/en-US/docs/Web/CSS) cung cấp khả năng kiểm soát cấp thấp các đặc điểm của [phông chữ biến thể](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts) bằng cách cho phép bạn chỉ định tên trục bốn chữ cái của các đặc điểm muốn thay đổi cùng với các giá trị tương ứng.

{{InteractiveExample("CSS Demo: font-variation-settings")}}

```css interactive-example-choice
font-variation-settings: "wght" 50;
```

```css interactive-example-choice
font-variation-settings: "wght" 850;
```

```css interactive-example-choice
font-variation-settings: "wdth" 25;
```

```css interactive-example-choice
font-variation-settings: "wdth" 75;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    ...it would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
@font-face {
  src: url("/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.ttf");
  font-family: "Amstelvar";
  font-style: normal;
}

p {
  font-size: 1.5rem;
  font-family: "Amstelvar", serif;
}
```

## Cú pháp

```css
/* Sử dụng cài đặt mặc định */
font-variation-settings: normal;

/* Đặt giá trị cho tên trục phông chữ biến thể */
font-variation-settings: "xhgt" 0.7;

/* Giá trị toàn cục */
font-variation-settings: inherit;
font-variation-settings: initial;
font-variation-settings: revert;
font-variation-settings: revert-layer;
font-variation-settings: unset;
```

### Giá trị

Giá trị của thuộc tính này có thể ở một trong hai dạng:

- `normal`
  - : Văn bản được trình bày với các cài đặt mặc định.
- `<string> <number>`
  - : Khi hiển thị văn bản, danh sách tên trục phông chữ biến thể được truyền đến công cụ trình bày văn bản để bật hoặc tắt các tính năng phông chữ. Mỗi cài đặt luôn là một hoặc nhiều cặp gồm {{cssxref("&lt;string&gt;")}} có 4 ký tự ASCII theo sau là {{cssxref("number")}} cho biết giá trị trục cần đặt. Nếu `<string>` có số ký tự nhiều hơn hoặc ít hơn, hoặc chứa ký tự ngoài phạm vi điểm mã U+20 - U+7E, toàn bộ thuộc tính là không hợp lệ. `<number>` có thể là phân số hoặc âm, tùy thuộc vào phạm vi giá trị có trong phông chữ của bạn, do nhà thiết kế phông chữ xác định.

## Mô tả

Thuộc tính này là cơ chế cấp thấp được thiết kế để đặt các tính năng phông chữ biến thể khi không có cách nào khác để bật hoặc truy cập các tính năng đó. Bạn chỉ nên sử dụng nó khi không có thuộc tính cơ bản nào để đặt các tính năng đó (ví dụ: {{cssxref("font-weight")}}, {{cssxref("font-style")}}).

Các đặc điểm phông chữ được đặt bằng `font-variation-settings` sẽ luôn ghi đè các đặc điểm được đặt bằng các thuộc tính phông chữ cơ bản tương ứng, ví dụ `font-weight`, bất kể chúng xuất hiện ở đâu trong tầng. Trong một số trình duyệt, điều này hiện chỉ đúng khi khai báo {{cssxref("@font-face")}} bao gồm phạm vi {{cssxref("@font-face/font-weight", "font-weight")}}.

### Trục đã đăng ký và trục tùy chỉnh

Các trục phông chữ biến thể có hai loại: **đã đăng ký** và **tùy chỉnh**.

Các trục đã đăng ký là những trục phổ biến nhất — đủ phổ biến để các tác giả đặc tả cho rằng chúng đáng được chuẩn hóa. Lưu ý rằng điều này không có nghĩa là tác giả phông chữ phải bao gồm tất cả các trục này trong phông chữ của họ.

Dưới đây là các trục đã đăng ký cùng với các thuộc tính CSS tương ứng:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Thẻ trục</th>
      <th scope="col">Thuộc tính CSS</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>"wght"</td>
      <td>{{cssxref("font-weight")}}</td>
    </tr>
    <tr>
      <td>"wdth"</td>
      <td>{{cssxref("font-stretch")}}</td>
    </tr>
    <tr>
      <td>"slnt" (slant)</td>
      <td>{{cssxref("font-style")}}: <code>oblique + angle</code></td>
    </tr>
    <tr>
      <td>"ital"</td>
      <td>{{cssxref("font-style")}}: <code>italic</code></td>
    </tr>
    <tr>
      <td>"opsz"</td>
      <td><p>{{cssxref("font-optical-sizing")}}</p></td>
    </tr>
  </tbody>
</table>

Các trục tùy chỉnh có thể là bất kỳ thứ gì nhà thiết kế phông chữ muốn thay đổi trong phông chữ của họ, ví dụ như chiều cao ascender hoặc descender, kích thước của chân chữ, hoặc bất cứ điều gì họ có thể nghĩ ra. Bất kỳ trục nào cũng có thể được sử dụng miễn là nó được gán một thẻ trục 4 ký tự duy nhất. Một số trục sẽ trở nên phổ biến hơn và thậm chí có thể được đăng ký theo thời gian.

> [!NOTE]
> Thẻ trục đã đăng ký được nhận dạng bằng thẻ chữ thường, trong khi các trục tùy chỉnh nên được gán thẻ chữ hoa. Lưu ý rằng nhà thiết kế phông chữ không bắt buộc phải tuân theo quy ước này, và một số sẽ không tuân theo. Điều quan trọng cần nhớ là thẻ trục phân biệt chữ hoa chữ thường.

Để sử dụng phông chữ biến thể trên hệ điều hành của bạn, bạn cần đảm bảo rằng nó đã được cập nhật. Ví dụ: các hệ điều hành Linux cần phiên bản Linux FreeType mới nhất, và macOS trước 10.13 không hỗ trợ phông chữ biến thể. Nếu hệ điều hành của bạn không được cập nhật, bạn sẽ không thể sử dụng phông chữ biến thể trong các trang web hoặc Firefox Developer Tools.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm thêm các ví dụ về phông chữ biến thể trong hướng dẫn [Phông chữ biến thể](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts) của chúng tôi.

### Kiểm soát trọng lượng phông chữ biến thể (wght)

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa CSS để thử nghiệm các giá trị trọng lượng phông chữ khác nhau. Xem điều gì xảy ra khi bạn chỉ định giá trị nằm ngoài phạm vi trọng lượng.

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

### Kiểm soát độ nghiêng phông chữ biến thể (slnt)

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground. Chỉnh sửa CSS để thử nghiệm các giá trị nghiêng/oblique khác nhau.

```html hidden live-sample___variable-fonts-slant-example
<div>
  <p class="p1">Slant</p>
  <span>(font-style: oblique 14deg)</span>
</div>
<div>
  <p class="p2">Slant</p>
  <span>(font-variation-settings: 'slnt' 12)</span>
</div>
<div class="adjustable">
  <p class="p3">Slant</p>
  (font-variation-settings: 'slnt' <span id="angle-text">5</span>)<br />
  <label for="text-axis">Adjust Weight: </label>
  <input
    type="range"
    id="text-axis"
    name="text-axis"
    min="0"
    max="12"
    value="5" />
</div>
```

```css hidden live-sample___variable-fonts-slant-example
@font-face {
  font-family: "Roboto VF";
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/Roboto-VF.woff2")
    format("woff2-variations");
  font-weight: 100 900;
  font-stretch: 75% 100%;
  font-style: oblique 0deg 12deg;
  font-display: swap;
}

p {
  font:
    1.2em "Roboto VF",
    "Helvetica",
    sans-serif;
  font-size: 4rem;
  margin: 1rem;
  display: inline-block;
}

.adjustable {
  border: 1px dashed;
  --text-axis: 5;
}
```

```css live-sample___variable-fonts-slant-example
/* slant range is from 0deg to 12deg */
.p1 {
  font-style: oblique 14deg;
}

/* slant range is from 0 to 12 */
.p2 {
  font-variation-settings: "slnt" 12;
}

/* Adjust with slider & custom property */
.p3 {
  font-variation-settings: "slnt" var(--text-axis);
}
```

```js hidden live-sample___variable-fonts-slant-example
const angle = document.querySelector("#text-axis");
const text = document.querySelector("#angle-text");
const adjustable = document.querySelector(".adjustable");

angle.addEventListener("input", (e) => {
  const angle = e.target.value;
  text.innerText = angle;
  adjustable.style.setProperty("--text-axis", angle);
});
```

{{EmbedLiveSample("variable-fonts-slant-example", "", "450px")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn phông chữ biến thể](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts)
- [OpenType font variations overview](https://learn.microsoft.com/en-us/typography/opentype/spec/otvaroverview) on microsoft.com
- [OpenType design-variation axis tag registry](https://learn.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg) on microsoft.com
- [OpenType variable fonts](https://www.axis-praxis.org/) on axis-praxis.org
- [Variable fonts](https://v-fonts.com/) on v-fonts.com
