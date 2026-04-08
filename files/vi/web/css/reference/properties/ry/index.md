---
title: ry
slug: Web/CSS/Reference/Properties/ry
page-type: css-property
browser-compat: css.properties.ry
sidebar: cssref
---

Thuộc tính **`ry`** trong [CSS](/en-US/docs/Web/CSS) xác định bán kính theo trục y (chiều dọc) của phần tử SVG {{SVGElement("ellipse")}} và độ cong dọc của các góc hình chữ nhật SVG {{SVGElement("rect")}}. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("ry")}} của hình.

> [!NOTE]
> Thuộc tính `ry` chỉ áp dụng cho các phần tử {{SVGElement("ellipse")}} và {{SVGElement("rect")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG khác, phần tử HTML hay phần tử giả.

## Cú pháp

```css
/* Giá trị khởi tạo */
ry: auto;

/* Giá trị độ dài và phần trăm */
ry: 30px;
ry: 30%;

/* Giá trị toàn cục */
ry: inherit;
ry: initial;
ry: revert;
ry: revert-layer;
ry: unset;
```

### Giá trị

Giá trị {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc từ khóa `auto` biểu thị bán kính dọc của hình ellipse và bán kính viền dọc của hình chữ nhật.

- {{cssxref("length")}}
  - : Độ dài tuyệt đối hoặc tương đối có thể được biểu thị bằng bất kỳ đơn vị nào được phép trong kiểu dữ liệu {{cssxref("&lt;length&gt;")}} của CSS. Giá trị âm không hợp lệ.

- {{cssxref("percentage")}}
  - : Giá trị phần trăm tham chiếu đến chiều cao của khung nhìn SVG hiện tại. Giá trị được dùng cho `<rect>` không bao giờ vượt quá 50% chiều cao của hình chữ nhật.

- `auto`
  - : Khi được đặt hoặc mặc định là `auto`, giá trị `ry` bằng với giá trị độ dài tuyệt đối được dùng cho {{cssxref("rx")}}. Nếu cả `ry` và `rx` đều có giá trị tính toán là `auto`, giá trị được dùng là `0`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo góc bo tròn

Ví dụ này minh họa việc tạo hình chữ nhật có góc bo tròn bằng cách áp dụng thuộc tính `ry` cho các phần tử `<rect>` trong SVG.

#### HTML

Chúng ta bao gồm một hình ảnh SVG với bốn phần tử `<rect>`; tất cả các hình chữ nhật đều giống nhau ngoại trừ giá trị thuộc tính {{SVGAttr("x")}}, xác định vị trí của chúng dọc theo trục x.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <rect width="50" height="120" y="5" x="5" />
  <rect width="50" height="120" y="5" x="60" />
  <rect width="50" height="120" y="5" x="115" />
  <rect width="50" height="120" y="5" x="170" />
  <rect width="50" height="120" y="5" x="225" />
</svg>
```

#### CSS

Với CSS, chúng ta đặt giá trị `ry` cho bốn hình chữ nhật:

```css
svg {
  border: 1px solid;
}

rect:nth-of-type(2) {
  ry: 10px;
  fill: red;
}

rect:nth-of-type(3) {
  ry: 2em;
  fill: blue;
}

rect:nth-of-type(4) {
  ry: 5%;
  fill: orange;
}

rect:nth-of-type(5) {
  ry: 80%;
  fill: green;
}
```

#### Kết quả

{{EmbedLiveSample("Creating rounded corners", "300", "180")}}

Hình chữ nhật đầu tiên mặc định là `auto`; vì tất cả các giá trị `rx` trong ví dụ này cũng mặc định là `auto`, giá trị được dùng của `ry` là `0`. Hình chữ nhật đỏ và xanh lam có góc bo tròn lần lượt là `10px` và `2em`. Vì khung nhìn SVG mặc định là 300px x 150px, giá trị `5%` của hình chữ nhật cam tạo ra bán kính `7.5px`. Hình chữ nhật xanh lá có `ry: 80%`. Tuy nhiên, vì giá trị của `ry` không bao giờ vượt quá `50%` chiều cao của hình chữ nhật, hiệu ứng tương đương như khi đặt `ry: 50%; rx: 50%`.

### Xác định bán kính dọc của hình ellipse

Ví dụ `<ellipse>` cơ bản này minh họa thuộc tính CSS `ry` được ưu tiên hơn thuộc tính SVG `ry` khi xác định bán kính dọc của hình.

#### HTML

Chúng ta bao gồm hai phần tử `<ellipse>` giống hệt nhau trong SVG; mỗi phần tử có thuộc tính `ry` được đặt là `20`.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="80" cy="50" rx="40" ry="20" />
  <ellipse cx="80" cy="50" rx="40" ry="20" />
</svg>
```

#### CSS

Chúng ta chỉ tạo kiểu cho hình ellipse đầu tiên, để phần còn lại sử dụng kiểu mặc định của user agent (với {{cssxref("fill")}} mặc định là màu đen). Thuộc tính hình học `ry` ghi đè giá trị của thuộc tính SVG {{SVGAttr("ry")}}. Chúng ta cũng đặt các thuộc tính `fill` và {{cssxref("stroke")}} để phân biệt hình được tạo kiểu với phần còn lại.

```css
svg {
  border: 1px solid;
}

ellipse:first-of-type {
  ry: 80px;
  fill: magenta;
  stroke: rebeccapurple;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the vertical radius of an ellipse", "300", "180")}}

Bán kính dọc của hình ellipse được tạo kiểu là `80px`, như được xác định trong giá trị thuộc tính CSS `ry`. Bán kính dọc của hình ellipse không được tạo kiểu là `20px`, được xác định bởi thuộc tính `ry`.

### Giá trị phần trăm bán kính dọc của hình ellipse

Ví dụ này minh họa việc sử dụng giá trị phần trăm cho `ry`.

#### HTML

Chúng ta sử dụng cùng markup như ví dụ trước.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="80" cy="50" rx="40" ry="20" />
  <ellipse cx="80" cy="50" rx="40" ry="20" />
</svg>
```

#### CSS

CSS tương tự như ví dụ trước, với sự khác biệt duy nhất là giá trị thuộc tính `ry`; trong trường hợp này, chúng ta sử dụng giá trị phần trăm.

```css
svg {
  border: 1px solid;
}

ellipse:first-of-type {
  ry: 30%;
  fill: magenta;
  stroke: rebeccapurple;
}
```

#### Kết quả

{{EmbedLiveSample("Ellipse vertical radius percentage values", "300", "180")}}

Khi sử dụng giá trị phần trăm cho `ry`, các giá trị tương đối với chiều cao của khung nhìn SVG. Ở đây, kích thước bán kính dọc của hình ellipse được tạo kiểu là `30%` chiều cao của khung nhìn SVG hiện tại. Vì chiều cao mặc định là `150px`, giá trị `ry` là `45px`, khiến hình ellipse cao `90px`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính hình học: `ry`, {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("height")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Thuộc tính SVG {{SVGAttr("ry")}}
