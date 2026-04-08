---
title: font-size-adjust
slug: Web/CSS/Reference/Properties/font-size-adjust
page-type: css-property
browser-compat: css.properties.font-size-adjust
sidebar: cssref
---

Thuộc tính **`font-size-adjust`** [CSS](/en-US/docs/Web/CSS) cung cấp cách để sửa đổi kích thước của chữ thường so với kích thước của chữ hoa, từ đó xác định tổng thể {{cssxref("font-size")}}. Thuộc tính này hữu ích trong các tình huống có thể xảy ra dự phòng phông chữ.

Khả năng đọc có thể trở thành vấn đề khi {{ Cssxref("font-family") }} được chọn đầu tiên không khả dụng và phông chữ dự phòng thay thế có giá trị khung nhìn (chiều cao của chữ thường chia cho kích thước phông chữ) khác đáng kể. Khả năng đọc của phông chữ, đặc biệt ở kích thước phông chữ nhỏ, được xác định nhiều hơn bởi kích thước của chữ thường hơn là kích thước của chữ hoa. Thuộc tính `font-size-adjust` hữu ích để điều chỉnh kích thước phông chữ của các phông chữ dự phòng nhằm giữ giá trị khung nhìn nhất quán giữa các phông chữ, đảm bảo văn bản hiển thị tương tự bất kể phông chữ nào được sử dụng.

## Cú pháp

```css
/* Từ khóa */
font-size-adjust: none;

/* Một giá trị: <number> hoặc from-font */
font-size-adjust: 0.5;
font-size-adjust: from-font;

/* Hai giá trị */
font-size-adjust: ex-height 0.5;
font-size-adjust: ch-width from-font;

/* Giá trị toàn cục */
font-size-adjust: inherit;
font-size-adjust: initial;
font-size-adjust: revert;
font-size-adjust: revert-layer;
font-size-adjust: unset;
```

### Giá trị

Thuộc tính `font-size-adjust` nhận giá trị là từ khóa `none`, một giá trị (`<number>` hoặc `from-font`), hoặc hai giá trị (`<font-metric>` và `<number>` hoặc `from-font`).

- `none`
  - : Không có điều chỉnh nào được áp dụng cho giá trị `font-size` của phông chữ dự phòng.
- `<font-metric>` {{optional_inline}}
  - : Chỉ định chỉ số phông chữ lựa chọn đầu tiên để sử dụng khi điều chỉnh kích thước phông chữ của phông chữ dự phòng. Tham số này chấp nhận một trong các từ khóa được liệt kê bên dưới. Đây là tham số tùy chọn, và `ex-height` được sử dụng nếu không có `<font-metric>` nào được chỉ định.
    - `ex-height`
      - : Sử dụng tỷ lệ chiều cao x (chiều cao của chữ "x" thường trong phông chữ) so với kích thước phông chữ (giá trị khung nhìn) để điều chỉnh kích thước phông chữ dự phòng. Giá trị từ khóa này được sử dụng để chuẩn hóa chữ thường giữa các phông chữ.
    - `cap-height`
      - : Sử dụng tỷ lệ chiều cao hoa (chiều cao của chữ hoa) so với kích thước phông chữ để điều chỉnh kích thước phông chữ dự phòng. Giá trị từ khóa này được sử dụng để chuẩn hóa chữ hoa giữa các phông chữ.
    - `ch-width`
      - : Sử dụng tỷ lệ chiều rộng tiến (khoảng ngang mà một ký tự chiếm trong phông chữ) của ký tự "0" (ZERO, U+0030) so với kích thước phông chữ. Giá trị từ khóa này được sử dụng để chuẩn hóa bước nhỏ theo chiều ngang của các phông chữ.
    - `ic-width`
      - : Sử dụng tỷ lệ chiều rộng tiến của ký tự "水" (biểu tượng chữ nước CJK, U+6C34) so với kích thước phông chữ. Giá trị từ khóa này được sử dụng để chuẩn hóa bước rộng theo chiều ngang của các phông chữ, đặc biệt là những phông chữ bao gồm ký tự CJK (Trung, Nhật, Hàn).
    - `ic-height`
      - : Sử dụng tỷ lệ chiều cao tiến (khoảng dọc mà một ký tự chiếm trong phông chữ) của ký tự "水" (biểu tượng chữ nước CJK, U+6C34) so với kích thước phông chữ. Giá trị từ khóa này được sử dụng để chuẩn hóa bước rộng theo chiều dọc của các phông chữ, đặc biệt là những phông chữ bao gồm ký tự CJK.

- {{cssxref("&lt;number&gt;")}}
  - : Điều chỉnh kích thước phông chữ được sử dụng tùy thuộc vào `<font-metric>` được chỉ định. Khi không có `<font-metric>` được chỉ định (trong trường hợp đó giá trị mặc định `ex-height` được sử dụng), giá trị `<number>` điều chỉnh kích thước phông chữ của phông chữ dự phòng sao cho chiều cao x của nó là bội số được chỉ định của kích thước phông chữ. Giá trị này thường phải khớp với giá trị khung nhìn (tỷ lệ chiều cao x so với kích thước phông chữ) của phông chữ lựa chọn đầu tiên. Điều này có nghĩa là phông chữ lựa chọn đầu tiên, khi khả dụng, sẽ hiển thị nhất quán trên các trình duyệt, bất kể chúng có hỗ trợ `font-size-adjust` hay không.

    Khi một giá trị `<font-metric>` được chỉ định, giá trị `<number>` điều chỉnh kích thước phông chữ theo `<font-metric>` được chọn để duy trì sự xuất hiện nhất quán cho chỉ số phông chữ được chỉ định trên các phông chữ khác nhau.

    Giá trị `<number>` chấp nhận bất kỳ số nào từ `0` đến vô cùng. `0` tạo ra văn bản có chiều cao bằng không (tức là văn bản bị ẩn). Giá trị âm không hợp lệ.

- `from-font`
  - : Sử dụng giá trị `<number>` cho `<font-metric>` được chỉ định từ phông chữ khả dụng đầu tiên.

## Mô tả

Để đảm bảo tương thích với các trình duyệt không hỗ trợ `font-size-adjust`, thuộc tính này được chỉ định là hệ số nhân số của thuộc tính {{cssxref("font-size")}}. Con số này thường phải khớp với giá trị khung nhìn của phông chữ lựa chọn đầu tiên.

> [!NOTE]
> Nếu `<font-metric>` được chỉ định đã bị ghi đè trong {{cssxref("@font-face")}}, ví dụ bằng cách sử dụng bộ mô tả [`size-adjust`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/size-adjust), thì chỉ số bị ghi đè sẽ được sử dụng trong tính toán `font-size-adjust`. Điều này có nghĩa là khi `font-size-adjust` và `size-adjust` được áp dụng cùng nhau, `size-adjust` không có bất kỳ hiệu ứng nào.

Kích thước phông chữ được điều chỉnh được tính bằng công thức `u = ( m / m′ ) s`, trong đó:

- `m` là tỷ lệ của `<font-metric>` được chỉ định so với kích thước phông chữ lựa chọn đầu tiên.

- `m′` là tỷ lệ của `<font-metric>` tương ứng so với kích thước phông chữ dự phòng.

- `s` là giá trị của thuộc tính `font-size`.

- `u` là kích thước phông chữ mới, được điều chỉnh cho phông chữ dự phòng.

Xem ví dụ này để hiểu cách tính kích thước phông chữ được điều chỉnh. Phông chữ lựa chọn đầu tiên có `font-size` là `12px` (`s`), và tỷ lệ `cap-height` so với kích thước phông chữ là `0.20` (`m`). Tỷ lệ `cap-height` so với kích thước phông chữ trong phông chữ dự phòng là `0.15` (`m′`). Giá trị `font-size-adjust` đã được chỉ định là `cap-height 0.20`. Nếu phông chữ chính không khả dụng, kích thước phông chữ được điều chỉnh của phông chữ dự phòng sẽ được tính là `16px` (`(0.20 / 0.15) * 12`). Điều này sẽ đảm bảo rằng `cap-height` của phông chữ dự phòng tương tự như phông chữ lựa chọn đầu tiên khi hiển thị.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Chuẩn hóa kích thước phông chữ theo chữ thường và chữ hoa

Ví dụ này minh họa cách thuộc tính `font-size-adjust` có thể được sử dụng để giữ cùng giá trị khung nhìn trên các phông chữ. Phông chữ Verdana có giá trị khung nhìn tương đối cao là `0.545`, nghĩa là chữ thường tương đối cao so với chữ hoa. Điều này làm cho văn bản ở kích thước phông chữ nhỏ có thể đọc được. Tuy nhiên, phông chữ Times có giá trị khung nhìn thấp hơn là `0.447`, do đó văn bản ít đọc được hơn ở kích thước nhỏ. Nếu Verdana là phông chữ lựa chọn đầu tiên và Times là phông chữ dự phòng, việc chỉ định thuộc tính `font-size-adjust` có thể giúp giữ cùng giá trị khung nhìn trong Times. Vì vậy, nếu phông chữ dự phòng là Times, văn bản sẽ duy trì mức độ đọc được tương tự như với Verdana.

Tương tự, tỷ lệ chiều cao hoa so với kích thước phông chữ trong Verdana là `0.73` và trong Times là `0.66`. Khi thuộc tính `font-size-adjust` được áp dụng cho Times để điều chỉnh chữ hoa phù hợp với tỷ lệ trong Verdana, phông chữ Times sẽ hiển thị ở kích thước phông chữ được điều chỉnh là ((0.73 / 0.66) \* 14) `15.48px`.

```html
<p class="verdana">
  A: This text uses the Verdana font (14px), which has relatively large
  lowercase letters.
</p>
<p class="times">
  B: This text uses the Times font (14px), which is hard to read in small sizes.
</p>
<p class="times adj-times-ex-height">
  C: This text in 14px Times font is adjusted to the same aspect value as the
  Verdana font, so lowercase letters are normalized across the two fonts.
</p>
<p class="times adj-times-cap-height">
  D: This text in 14px Times font is adjusted to the same cap-height to font
  size ratio as the Verdana font, so uppercase letters are normalized across the
  two fonts.
</p>
```

```css
.times {
  font-family: "Times", serif;
  font-size: 14px;
}

.verdana {
  font-family: "Verdana", sans-serif;
  font-size: 14px;
}

.adj-times-ex-height {
  font-size-adjust: 0.545;
}

.adj-times-cap-height {
  font-size-adjust: cap-height 0.73;
}
```

{{ EmbedLiveSample('Normalizing font size by lowercase and uppercase letters', 500, 200) }}

Không có `font-size-adjust` trong `B`, việc chuyển từ phông chữ Verdana sang phông chữ Times có thể dẫn đến giảm đáng kể khả năng đọc do giá trị khung nhìn thấp hơn của nó.
Trong `C`, lưu ý rằng chỉ có một giá trị được chỉ định cho thuộc tính `font-size-adjust`, do đó giá trị `<font-metric>` mặc định `ex-height` được sử dụng. `D` cho thấy phông chữ trông như thế nào so với `A` nếu chiều cao chữ hoa của nó được điều chỉnh.

### Xác định giá trị khung nhìn của phông chữ

Đối với một phông chữ nhất định, cùng nội dung trong hai phần tử [`<span>`](/en-US/docs/Web/HTML/Reference/Elements/span) đặt cạnh nhau có thể được sử dụng để xác định giá trị khung nhìn của phông chữ. Nếu cùng kích thước phông chữ được sử dụng cho nội dung trong cả hai span, các span sẽ khớp khi giá trị `font-size-adjust` trong một span chính xác cho phông chữ đã cho.

Trong ví dụ bên dưới, có ba cặp phần tử `<span>` đặt cạnh nhau, mỗi cặp chứa chữ "b". Mục tiêu là điều chỉnh thuộc tính `font-size-adjust` cho `<span>` bên phải trong mỗi cặp cho đến khi các đường viền xung quanh hai chữ cái căn chỉnh. Giá trị `font-size-adjust` kết quả có thể được coi là giá trị khung nhìn cho phông chữ.

Bắt đầu từ `0.6` trong cặp đầu tiên và điều chỉnh xuống `0.5` trong cặp thứ hai, chúng ta tiếp tục điều chỉnh giá trị thuộc tính `font-size-adjust` cho đến khi các đường viền xung quanh các chữ "b" căn chỉnh hoàn hảo trong cặp thứ ba. Trong ví dụ này, giá trị khung nhìn được xác định là `0.482`.

```html
<div>
  <p><span>b</span><span class="adjust1">b</span></p>
  0.6
</div>

<div>
  <p><span>b</span><span class="adjust2">b</span></p>
  0.5
</div>

<div>
  <p><span>b</span><span class="adjust3">b</span></p>
  0.482
</div>
```

```css hidden
body {
  display: flex;
}

div {
  text-align: center;
}

p {
  margin: 0 30px 10px 30px;
}
```

```css
body {
  display: flex;
}

div {
  text-align: center;
}

p {
  font-family: "Futura", sans-serif;
  font-size: 50px;
}

span {
  border: solid 1px red;
}

.adjust1 {
  font-size-adjust: 0.6;
}

.adjust2 {
  font-size-adjust: 0.5;
}

.adjust3 {
  font-size-adjust: 0.482;
}
```

{{ EmbedLiveSample('Determining the aspect value of a font', 500, 120) }}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-size")}}
- {{cssxref("font-weight")}}
- Bộ mô tả `@font-face` {{cssxref("@font-face/size-adjust", "size-adjust")}}
- Thuộc tính SVG {{SVGAttr("font-size-adjust")}}
- [Học: Kiểu dáng văn bản và phông chữ cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
