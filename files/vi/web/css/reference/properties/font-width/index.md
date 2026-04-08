---
title: font-width
slug: Web/CSS/Reference/Properties/font-width
page-type: css-property
status:
  - experimental
browser-compat: css.properties.font-width
sidebar: cssref
---

{{SeeCompatTable}}

> [!NOTE]
> Thuộc tính `font-width` là sự thay thế hiện đại cho {{cssxref("font-stretch")}}, vốn là một bí danh kế thừa. Mặc dù `font-width` là tên được ưu tiên trong đặc tả, `font-stretch` hiện có hỗ trợ trình duyệt rộng hơn. Kiểm tra [ví dụ dự phòng](#cung_cấp_dự_phòng_font-stretch) và [bảng tương thích trình duyệt](#khả_năng_tương_thích_trình_duyệt) để biết chi tiết.

Thuộc tính **`font-width`** [CSS](/en-US/docs/Web/CSS) chọn kiểu mặt phông chữ bình thường, thu hẹp hoặc mở rộng từ một phông chữ.

{{InteractiveExample("CSS Demo: font-width")}}

```css interactive-example-choice
font-width: condensed;
```

```css interactive-example-choice
font-width: expanded;
```

```css interactive-example-choice
font-width: ultra-expanded;
```

```css interactive-example-choice
font-width: 50%;
```

```css interactive-example-choice
font-width: 100%;
```

```css interactive-example-choice
font-width: 150%;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p class="transition-all" id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
@font-face {
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-family: "League";
  font-style: normal;
  font-weight: normal;
}

section {
  font-size: 1.2em;
  font-family: "League", sans-serif;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
font-width: normal;
font-width: ultra-condensed;
font-width: extra-condensed;
font-width: condensed;
font-width: semi-condensed;
font-width: semi-expanded;
font-width: expanded;
font-width: extra-expanded;
font-width: ultra-expanded;

/* Giá trị phần trăm */
font-width: 50%;
font-width: 100%;
font-width: 200%;

/* Giá trị toàn cục */
font-width: inherit;
font-width: initial;
font-width: revert;
font-width: revert-layer;
font-width: unset;
```

Thuộc tính này có thể được chỉ định bằng một từ khóa đơn hoặc giá trị {{cssxref("&lt;percentage&gt;")}}.

### Giá trị

- `normal`
  - : Chỉ định kiểu mặt phông chữ bình thường.
- `semi-condensed`, `condensed`, `extra-condensed`, `ultra-condensed`
  - : Chỉ định kiểu mặt phông chữ thu hẹp hơn bình thường, trong đó `ultra-condensed` là thu hẹp nhất.
- `semi-expanded`, `expanded`, `extra-expanded`, `ultra-expanded`
  - : Chỉ định kiểu mặt phông chữ mở rộng hơn bình thường, trong đó `ultra-expanded` là mở rộng nhất.
- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} trong khoảng từ 50% đến 200% (bao gồm). Giá trị âm không được phép cho thuộc tính này.

### Bảng ánh xạ từ khóa sang số

Bảng bên dưới cho thấy ánh xạ giữa các giá trị từ khóa và phần trăm số:

| Từ khóa           | Phần trăm |
| ----------------- | --------- |
| `ultra-condensed` | 50%       |
| `extra-condensed` | 62.5%     |
| `condensed`       | 75%       |
| `semi-condensed`  | 87.5%     |
| `normal`          | 100%      |
| `semi-expanded`   | 112.5%    |
| `expanded`        | 125%      |
| `extra-expanded`  | 150%      |
| `ultra-expanded`  | 200%      |

## Mô tả

Một số họ phông chữ cung cấp các kiểu mặt bổ sung trong đó các ký tự hẹp hơn kiểu mặt bình thường (kiểu mặt _thu hẹp_) hoặc rộng hơn kiểu mặt bình thường (kiểu mặt _mở rộng_).

Bạn có thể sử dụng `font-width` để chọn kiểu mặt thu hẹp hoặc mở rộng từ các phông chữ đó. Nếu phông chữ bạn đang sử dụng không cung cấp kiểu mặt thu hẹp hoặc mở rộng, thuộc tính này không có hiệu lực.

### Lựa chọn kiểu mặt phông chữ

Kiểu mặt được chọn cho một giá trị `font-width` nhất định phụ thuộc vào các kiểu mặt được phông chữ hỗ trợ. Nếu phông chữ không cung cấp kiểu mặt khớp chính xác với giá trị đã cho, thì các giá trị nhỏ hơn 100% sẽ ánh xạ đến kiểu mặt thu hẹp, và các giá trị lớn hơn hoặc bằng 100% sẽ ánh xạ đến kiểu mặt mở rộng.

Bảng bên dưới minh họa hiệu ứng của việc đặt các giá trị phần trăm khác nhau cho `font-width` trên hai phông chữ khác nhau:

```css hidden
@font-face {
  font-family: "Inconsolata";
  src: url("https://fonts.gstatic.com/s/inconsolata/v31/QlddNThLqRwH-OJ1UHjlKENVzlm-WkL3GZQmAwPyya15.woff2")
    format("woff2");
}

@font-face {
  font-family: "Anek Malayalam";
  src: url("https://fonts.gstatic.com/s/anekmalayalam/v4/6qLUKZActRTs_mZAJUZWWkhke0nYa-f6__Azq3-gP1W7db9_.woff2")
    format("woff2");
}

body {
  font-family: system-ui;
}

table {
  border-collapse: collapse;
  width: 100%;
}

tbody th {
  text-align: right;
}

th,
td {
  padding: 0.25rem;
  font-weight: normal;
  text-align: center;
}

td {
  border: solid;
  border-width: 1px;
  font-size: 5rem;
}

.inconsolata {
  font-family: "Inconsolata", sans-serif;
}

.anek-malayalam {
  font-family: "Anek Malayalam", sans-serif;
}

td:nth-child(2) {
  font-width: 50%;
}
td:nth-child(3) {
  font-width: 62.5%;
}
td:nth-child(4) {
  font-width: 75%;
}
td:nth-child(5) {
  font-width: 87.5%;
}
td:nth-child(6) {
  font-width: 100%;
}
td:nth-child(7) {
  font-width: 112.5%;
}
td:nth-child(8) {
  font-width: 125%;
}
td:nth-child(9) {
  font-width: 150%;
}
td:nth-child(10) {
  font-width: 200%;
}
```

```html hidden
<table>
  <thead>
    <tr>
      <th scope="row"></th>
      <th scope="col">50%</th>
      <th scope="col">62.5%</th>
      <th scope="col">75%</th>
      <th scope="col">87.5%</th>
      <th scope="col">100%</th>
      <th scope="col">112.5%</th>
      <th scope="col">125%</th>
      <th scope="col">150%</th>
      <th scope="col">200%</th>
    </tr>
  </thead>
  <tbody>
    <tr class="inconsolata">
      <th scope="row">Inconsolata</th>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
    </tr>
    <tr class="anek-malayalam">
      <th scope="row">Anek Malayalam</th>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
      <td>e</td>
    </tr>
  </tbody>
</table>
```

{{EmbedLiveSample('Font face selection', "100%", "250px")}}

Ảnh chụp màn hình bên dưới cho thấy bảng trên được hiển thị như thế nào, trong trường hợp trình duyệt của bạn không hỗ trợ thuộc tính `font-width`:

![A two-row comparison table showing the lowercase letter e rendered at different widths (50%, 62.5%, 75%, 87.5%, 100%, 112.5%, 125%, 150%, 200%). The top row is labeled Inconsolata and the bottom row Anek Malayalam. Both fonts are sans-serif and Inconsolata's letters are slightly wider compared to Anek Malayalam's.](font-face-selection.png)

- [Inconsolata](https://fonts.google.com/specimen/Inconsolata) là phông chữ biến thể hỗ trợ phạm vi chiều rộng liên tục từ 50% đến 200%. <!-- Note, dynamically obtained woff2 from Google fonts using query: https://fonts.googleapis.com/css2?family=Inconsolata:wdth@50..200 -->
- [Anek Malayalam](https://fonts.google.com/specimen/Anek+Malayalam) là phông chữ biến thể google hỗ trợ chiều rộng từ 75% đến 125%. Các giá trị dưới và trên phạm vi này sẽ chọn phông chữ gần nhất.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax("font-width")}}

## Ví dụ

### Thiết lập phần trăm chiều rộng phông chữ

```html
<p class="condensed">an elephantine lizard</p>
<p class="normal">an elephantine lizard</p>
<p class="expanded">an elephantine lizard</p>
```

```css
@font-face {
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-family: "LeagueMonoVariable";
  font-style: normal;
}

p {
  font:
    1.5rem "LeagueMonoVariable",
    sans-serif;
}

.condensed {
  font-width: 50%;
}

.normal {
  font-width: 100%;
}

.expanded {
  font-width: 200%;
}
```

{{EmbedLiveSample("Setting font width percentages", "100%", 200)}}

### Cung cấp dự phòng font-stretch

Vì `font-width` chưa có hỗ trợ trình duyệt rộng rãi, bạn có thể muốn bao gồm thuộc tính kế thừa {{cssxref("font-stretch")}} làm dự phòng. Đặt `font-stretch` trước `font-width` để các trình duyệt hỗ trợ sử dụng thuộc tính hiện đại:

```css
p {
  font-stretch: condensed; /* for browsers that don't support font-width */
  font-width: condensed;
}
```

> [!NOTE]
> Bạn có thể tự động hóa mẫu dự phòng này bằng cách sử dụng plugin [postcss-preset-env](https://preset-env.cssdb.org/) cho PostCSS, bao gồm transform [postcss-font-width-property](https://github.com/csstools/postcss-plugins/tree/main/plugins/postcss-font-width-property) để tự động chuyển đổi thuộc tính `font-width` thành `font-stretch`.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-width")}} descriptor for {{cssxref("@font-face")}}
- Legacy {{cssxref("font-stretch")}} alias property with better browser support
- {{cssxref("font-style")}} property
- {{cssxref("font-weight")}} property
- SVG {{SVGAttr("font-stretch")}} attribute
- [Learn: Fundamental text and font styling](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
- [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts) module
