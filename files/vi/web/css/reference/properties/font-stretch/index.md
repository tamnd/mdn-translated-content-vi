---
title: font-stretch
slug: Web/CSS/Reference/Properties/font-stretch
page-type: css-property
browser-compat: css.properties.font-stretch
sidebar: cssref
---

> [!NOTE]
> Thuộc tính `font-stretch` đã được đổi tên thành {{cssxref("font-width")}} trong [đặc tả CSS Fonts](https://drafts.csswg.org/css-fonts/#font-stretch-prop). Để duy trì tương thích, đặc tả giữ lại `font-stretch` như là bí danh kế thừa cho thuộc tính `font-width`.

Thuộc tính **`font-stretch`** [CSS](/en-US/docs/Web/CSS) chọn mặt phông chữ bình thường, thu hẹp hoặc mở rộng từ một phông chữ.

{{InteractiveExample("CSS Demo: font-stretch")}}

```css interactive-example-choice
font-stretch: condensed;
```

```css interactive-example-choice
font-stretch: expanded;
```

```css interactive-example-choice
font-stretch: ultra-expanded;
```

```css interactive-example-choice
font-stretch: 50%;
```

```css interactive-example-choice
font-stretch: 100%;
```

```css interactive-example-choice
font-stretch: 150%;
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
font-stretch: normal;
font-stretch: ultra-condensed;
font-stretch: extra-condensed;
font-stretch: condensed;
font-stretch: semi-condensed;
font-stretch: semi-expanded;
font-stretch: expanded;
font-stretch: extra-expanded;
font-stretch: ultra-expanded;

/* Giá trị phần trăm */
font-stretch: 50%;
font-stretch: 100%;
font-stretch: 200%;

/* Giá trị toàn cục */
font-stretch: inherit;
font-stretch: initial;
font-stretch: revert;
font-stretch: revert-layer;
font-stretch: unset;
```

Thuộc tính này có thể được chỉ định là một từ khóa đơn hoặc giá trị {{cssxref("&lt;percentage&gt;")}}.

### Giá trị

- `normal`
  - : Chỉ định mặt phông chữ thu hẹp bình thường.
- `semi-condensed`, `condensed`, `extra-condensed`, `ultra-condensed`
  - : Chỉ định mặt phông chữ thu hẹp hơn bình thường, với `ultra-condensed` là thu hẹp nhất.
- `semi-expanded`, `expanded`, `extra-expanded`, `ultra-expanded`
  - : Chỉ định mặt phông chữ mở rộng hơn bình thường, với `ultra-expanded` là mở rộng nhất.
- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} từ 50% đến 200% (bao gồm cả hai đầu). Giá trị âm không được phép cho thuộc tính này.

### Ánh xạ từ khóa sang số

Bảng dưới đây cho thấy ánh xạ giữa các giá trị từ khóa và phần trăm số:

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

Một số họ phông chữ cung cấp các mặt bổ sung trong đó các ký tự hẹp hơn mặt bình thường (mặt _thu hẹp_) hoặc rộng hơn mặt bình thường (mặt _mở rộng_).

Bạn có thể sử dụng `font-stretch` để chọn mặt thu hẹp hoặc mở rộng từ các phông chữ như vậy. Nếu phông chữ bạn đang sử dụng không có mặt thu hẹp hoặc mở rộng, thuộc tính này sẽ không có hiệu ứng.

### Chọn mặt phông chữ

Mặt được chọn cho một giá trị nhất định của `font-stretch` phụ thuộc vào các mặt được phông chữ đó hỗ trợ. Nếu phông chữ không cung cấp mặt khớp chính xác với giá trị đã cho, thì các giá trị nhỏ hơn `100%` ánh xạ đến mặt thu hẹp, và các giá trị lớn hơn hoặc bằng `100%` ánh xạ đến mặt mở rộng.

Bảng dưới đây minh họa hiệu ứng của việc đặt các giá trị phần trăm khác nhau của `font-stretch` trên hai phông chữ khác nhau:

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
  font-stretch: 50%;
}
td:nth-child(3) {
  font-stretch: 62.5%;
}
td:nth-child(4) {
  font-stretch: 75%;
}
td:nth-child(5) {
  font-stretch: 87.5%;
}
td:nth-child(6) {
  font-stretch: 100%;
}
td:nth-child(7) {
  font-stretch: 112.5%;
}
td:nth-child(8) {
  font-stretch: 125%;
}
td:nth-child(9) {
  font-stretch: 150%;
}
td:nth-child(10) {
  font-stretch: 200%;
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

- [Inconsolata](https://fonts.google.com/specimen/Inconsolata) là phông chữ biến thể cung cấp dải chiều rộng liên tục từ 50% đến 200%. <!-- Note, dynamically obtained woff2 from Google fonts using query: https://fonts.googleapis.com/css2?family=Inconsolata:wdth@50..200 -->
- [Anek Malayalam](https://fonts.google.com/specimen/Anek+Malayalam) là phông chữ google biến thể hỗ trợ chiều rộng từ 75% đến 125%. Các giá trị dưới và trên phạm vi này chọn phông chữ khớp gần nhất.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax("font-stretch")}}

## Ví dụ

### Đặt phần trăm co giãn phông chữ

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
  font-stretch: 50%;
}

.normal {
  font-stretch: 100%;
}

.expanded {
  font-stretch: 200%;
}
```

{{EmbedLiveSample("Setting font stretch percentages", "100%", 200)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Bộ mô tả {{cssxref("@font-face/font-stretch")}} cho {{cssxref("@font-face")}}
- Thuộc tính {{cssxref("font-width")}} hiện đại, thay thế `font-stretch`
- Thuộc tính {{cssxref("font-style")}}
- Thuộc tính {{cssxref("font-weight")}}
- Thuộc tính SVG {{SVGAttr("font-stretch")}}
- [Học: Kiểu dáng văn bản và phông chữ cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
- [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts) module
