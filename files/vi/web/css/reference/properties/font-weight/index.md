---
title: font-weight
slug: Web/CSS/Reference/Properties/font-weight
page-type: css-property
browser-compat: css.properties.font-weight
sidebar: cssref
---

Thuộc tính **`font-weight`** [CSS](/en-US/docs/Web/CSS) đặt độ đậm (hoặc độ nặng) của phông chữ. Các độ đậm có sẵn phụ thuộc vào {{cssxref("font-family")}} hiện đang được đặt.

{{InteractiveExample("CSS Demo: font-weight")}}

```css interactive-example-choice
font-weight: normal;
```

```css interactive-example-choice
font-weight: bold;
```

```css interactive-example-choice
font-weight: lighter;
```

```css interactive-example-choice
font-weight: bolder;
```

```css interactive-example-choice
font-weight: 100;
```

```css interactive-example-choice
font-weight: 900;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
section {
  font-size: 1.2em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa <font-weight-absolute> */
font-weight: normal;
font-weight: bold;

/* Giá trị số <font-weight-absolute> [1,1000] */
font-weight: 100;
font-weight: 200;
font-weight: 300;
font-weight: 400; /* normal */
font-weight: 500;
font-weight: 600;
font-weight: 700; /* bold */
font-weight: 800;
font-weight: 900;

/* Giá trị từ khóa tương đối so với phần tử cha */
font-weight: lighter;
font-weight: bolder;

/* Giá trị toàn cục */
font-weight: inherit;
font-weight: initial;
font-weight: revert;
font-weight: revert-layer;
font-weight: unset;
```

Thuộc tính `font-weight` được chỉ định bằng giá trị `<font-weight-absolute>` hoặc giá trị độ đậm tương đối, như liệt kê bên dưới.

### Giá trị

- `normal`
  - : Độ đậm phông chữ bình thường. Tương đương với `400`.

- `bold`
  - : Độ đậm phông chữ đậm. Tương đương với `700`.

- `<number>`
  - : Giá trị {{cssxref("&lt;number&gt;")}} trong khoảng từ 1 đến 1000, bao gồm cả hai đầu. Số lớn hơn đại diện cho độ đậm hơn (hoặc bằng) so với số nhỏ hơn. Điều này cho phép kiểm soát chi tiết cho [phông chữ biến thể](#phông_chữ_biến_thể). Đối với phông chữ không biến thể, nếu độ đậm chính xác được chỉ định không có sẵn, sẽ sử dụng [thuật toán dự phòng](#trọng_lượng_dự_phòng) — các giá trị số chia hết cho 100 tương ứng với các tên độ đậm phổ biến, như mô tả trong phần [Bảng ánh xạ tên độ đậm phổ biến](#bảng_ánh_xạ_tên_độ_đậm_phổ_biến) bên dưới.

- `lighter`
  - : Độ đậm phông chữ nhẹ hơn một bậc so với phần tử cha. Lưu ý rằng chỉ có bốn độ đậm phông chữ được xem xét cho việc tính toán độ đậm tương đối; xem phần [Ý nghĩa của độ đậm tương đối](#ý_nghĩa_của_độ_đậm_tương_đối) bên dưới.

- `bolder`
  - : Độ đậm phông chữ nặng hơn một bậc so với phần tử cha. Lưu ý rằng chỉ có bốn độ đậm phông chữ được xem xét cho việc tính toán độ đậm tương đối; xem phần [Ý nghĩa của độ đậm tương đối](#ý_nghĩa_của_độ_đậm_tương_đối) bên dưới.

### Trọng lượng dự phòng

Nếu độ đậm chính xác được yêu cầu không có sẵn, quy tắc sau được dùng để xác định độ đậm thực sự được hiển thị:

- Nếu độ đậm mục tiêu nằm trong khoảng từ `400` đến `500` (bao gồm):
  - Tìm kiếm các độ đậm có sẵn giữa mục tiêu và `500`, theo thứ tự tăng dần.
  - Nếu không tìm thấy, tìm kiếm các độ đậm nhỏ hơn mục tiêu, theo thứ tự giảm dần.
  - Nếu không tìm thấy, tìm kiếm các độ đậm lớn hơn `500`, theo thứ tự tăng dần.

- Nếu độ đậm nhỏ hơn `400` được yêu cầu, tìm kiếm các độ đậm nhỏ hơn mục tiêu theo thứ tự giảm dần. Nếu không tìm thấy, tìm kiếm các độ đậm lớn hơn mục tiêu theo thứ tự tăng dần.

- Nếu độ đậm lớn hơn `500` được yêu cầu, tìm kiếm các độ đậm lớn hơn mục tiêu theo thứ tự tăng dần. Nếu không tìm thấy, tìm kiếm các độ đậm nhỏ hơn mục tiêu theo thứ tự giảm dần.

> [!NOTE]
> Thuật toán trọng lượng dự phòng chỉ được sử dụng để hiển thị. Giá trị tính toán của thuộc tính vẫn là giá trị được chỉ định.

### Ý nghĩa của độ đậm tương đối

Khi `lighter` hoặc `bolder` được chỉ định, biểu đồ bên dưới cho thấy cách xác định độ đậm phông chữ tuyệt đối của phần tử.

Lưu ý rằng khi sử dụng độ đậm tương đối, chỉ có bốn độ đậm phông chữ được xem xét — thin (100), normal (400), bold (700), và heavy (900). Nếu một họ phông chữ có nhiều độ đậm hơn, chúng sẽ bị bỏ qua cho mục đích tính toán độ đậm tương đối.

<table class="standard-table">
  <thead>
    <tr>
      <th>Giá trị kế thừa</th>
      <th><code>bolder</code></th>
      <th><code>lighter</code></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>100</th>
      <td>400</td>
      <td>100</td>
    </tr>
    <tr>
      <th>200</th>
      <td>400</td>
      <td>100</td>
    </tr>
    <tr>
      <th>300</th>
      <td>400</td>
      <td>100</td>
    </tr>
    <tr>
      <th>400</th>
      <td>700</td>
      <td>100</td>
    </tr>
    <tr>
      <th>500</th>
      <td>700</td>
      <td>100</td>
    </tr>
    <tr>
      <th>600</th>
      <td>900</td>
      <td>400</td>
    </tr>
    <tr>
      <th>700</th>
      <td>900</td>
      <td>400</td>
    </tr>
    <tr>
      <th>800</th>
      <td>900</td>
      <td>700</td>
    </tr>
    <tr>
      <th>900</th>
      <td>900</td>
      <td>700</td>
    </tr>
  </tbody>
</table>

### Bảng ánh xạ tên độ đậm phổ biến

Các giá trị số từ `100` đến `900` tương ứng gần với các tên độ đậm phổ biến sau (xem [đặc tả OpenType](https://learn.microsoft.com/en-us/typography/opentype/spec/os2#usweightclass)):

| Giá trị | Tên độ đậm phổ biến                                                                                                                |
| ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 100     | Thin (Hairline)                                                                                                                    |
| 200     | Extra Light (Ultra Light)                                                                                                          |
| 300     | Light                                                                                                                              |
| 400     | Normal (Regular)                                                                                                                   |
| 500     | Medium                                                                                                                             |
| 600     | Semi Bold (Demi Bold)                                                                                                              |
| 700     | Bold                                                                                                                               |
| 800     | Extra Bold (Ultra Bold)                                                                                                            |
| 900     | Black (Heavy)                                                                                                                      |
| 950     | [Extra Black (Ultra Black)](https://learn.microsoft.com/en-us/dotnet/api/system.windows.fontweights?view=netframework-4.8#remarks) |

### Phông chữ biến thể

Trong khi nhiều phông chữ có một độ đậm cụ thể tương ứng với một trong các số trong [Bảng ánh xạ tên độ đậm phổ biến](#bảng_ánh_xạ_tên_độ_đậm_phổ_biến), hầu hết phông chữ biến thể hỗ trợ một phạm vi độ đậm cung cấp độ chi tiết cao hơn nhiều, giúp các nhà thiết kế và nhà phát triển kiểm soát tốt hơn độ đậm đã chọn.

Đối với phông chữ biến thể TrueType hoặc OpenType, biến thể "wght" được sử dụng để triển khai các chiều rộng khác nhau.

Bản demo này tải với `font-weight: 500;` được đặt. Thay đổi giá trị của thuộc tính `font-weight` trong bộ chọn `.sample` để xem trọng lượng của văn bản thay đổi (ví dụ: 200, 700). Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___font-weight-example
<p class="sample">
  ...it would not be wonderful to meet a Megalosaurus, forty feet long or so,
  waddling like an elephantine lizard up Holborn Hill.
</p>
```

```css live-sample___font-weight-example
@font-face {
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/MutatorSans.ttf");
  font-family: "MutatorSans";
  font-style: normal;
  font-weight: 1 1000;
}

.sample {
  text-transform: uppercase;
  font-weight: 500;
  font-size: 1.5rem;
  font-family: "MutatorSans", sans-serif;
}
```

{{EmbedLiveSample("font-weight-example", "", "200px")}}

## Khả năng tiếp cận

Những người có tình trạng thị lực kém có thể gặp khó khăn khi đọc văn bản được đặt với giá trị `font-weight` là `100` (Thin/Hairline) hoặc `200` (Extra Light), đặc biệt nếu phông chữ có [tỷ lệ tương phản màu sắc thấp](/en-US/docs/Web/CSS/Reference/Properties/color#accessibility).

- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.8 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thiết lập độ đậm phông chữ

#### HTML

```html
<p>
  Alice was beginning to get very tired of sitting by her sister on the bank,
  and of having nothing to do: once or twice she had peeped into the book her
  sister was reading, but it had no pictures or conversations in it, "and what
  is the use of a book," thought Alice "without pictures or conversations?"
</p>

<div>
  I'm heavy<br />
  <span>I'm lighter</span>
</div>
```

#### CSS

```css
/* Set paragraph text to be bold. */
p {
  font-weight: bold;
}

/* Set div text to two steps heavier than
   normal but less than a standard bold. */
div {
  font-weight: 600;
}

/* Set span text to be one step lighter
   than its parent. */
span {
  font-weight: lighter;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_font_weights","400","300")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-family")}}
- {{cssxref("font-style")}}
- SVG {{SVGAttr("font-weight")}} attribute
- [Learn: Fundamental text and font styling](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
- [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts) module
