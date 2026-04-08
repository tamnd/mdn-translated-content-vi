---
title: rx
slug: Web/CSS/Reference/Properties/rx
page-type: css-property
browser-compat: css.properties.rx
sidebar: cssref
---

Thuộc tính **`rx`** trong [CSS](/en-US/docs/Web/CSS) xác định bán kính theo trục x (chiều ngang) của phần tử SVG {{SVGElement("ellipse")}} và độ cong ngang của các góc hình chữ nhật SVG {{SVGElement("rect")}}. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("rx")}} của hình.

> [!NOTE]
> Thuộc tính `rx` chỉ áp dụng cho các phần tử {{SVGElement("ellipse")}} và {{SVGElement("rect")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG khác, phần tử HTML hay phần tử giả.

## Cú pháp

```css
/* Giá trị khởi tạo */
rx: auto;

/* Giá trị độ dài và phần trăm */
rx: 20px;
rx: 20%;

/* Giá trị toàn cục */
rx: inherit;
rx: initial;
rx: revert;
rx: revert-layer;
rx: unset;
```

### Giá trị

Giá trị {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc từ khóa `auto` biểu thị bán kính ngang của hình ellipse và bán kính viền ngang của hình chữ nhật.

- {{cssxref("length")}}
  - : Độ dài tuyệt đối hoặc tương đối có thể được biểu thị bằng bất kỳ đơn vị nào được phép trong kiểu dữ liệu {{cssxref("&lt;length&gt;")}} của CSS. Giá trị âm không hợp lệ.

- {{cssxref("percentage")}}
  - : Giá trị phần trăm tham chiếu đến chiều rộng của khung nhìn SVG hiện tại. Giá trị được dùng cho `<rect>` không bao giờ vượt quá 50% chiều rộng của hình chữ nhật.

- `auto`
  - : Khi được đặt hoặc mặc định là `auto`, giá trị `rx` bằng với giá trị độ dài tuyệt đối được dùng cho {{cssxref("ry")}}. Nếu cả `rx` và `ry` đều có giá trị tính toán là `auto`, giá trị được dùng là `0`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo góc bo tròn

Ví dụ này minh họa việc tạo hình chữ nhật có góc bo tròn bằng cách áp dụng thuộc tính `rx` cho các phần tử `<rect>` trong SVG.

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

Với CSS, chúng ta đặt giá trị `rx` cho bốn hình chữ nhật:

```css
svg {
  border: 1px solid;
}

rect:nth-of-type(2) {
  rx: 10px;
  fill: red;
}

rect:nth-of-type(3) {
  rx: 2em;
  fill: blue;
}

rect:nth-of-type(4) {
  rx: 5%;
  fill: orange;
}

rect:nth-of-type(5) {
  rx: 80%;
  fill: green;
}
```

#### Kết quả

{{EmbedLiveSample("Creating rounded corners", "300", "180")}}

Hình chữ nhật đầu tiên mặc định là `auto`; vì tất cả các giá trị `ry` trong ví dụ này cũng mặc định là `auto`, giá trị được dùng của `rx` là `0`. Hình chữ nhật đỏ và xanh lam có góc bo tròn lần lượt là `10px` và `2em`. Vì khung nhìn SVG mặc định là 300px x 150px, giá trị `5%` của hình chữ nhật cam tạo ra bán kính `15px`. Hình chữ nhật xanh lá có `rx: 80%`. Tuy nhiên, vì giá trị của `rx` không bao giờ vượt quá `50%` chiều rộng của hình chữ nhật, hiệu ứng tương đương như khi đặt `rx: 50%; ry: 50%`.

### Xác định bán kính ngang của hình ellipse

Ví dụ `<ellipse>` cơ bản này minh họa thuộc tính CSS `rx` được ưu tiên hơn thuộc tính SVG `rx` khi xác định bán kính ngang của hình.

#### HTML

Chúng ta bao gồm hai phần tử `<ellipse>` giống hệt nhau trong SVG; mỗi phần tử có thuộc tính `rx` được đặt là `20`.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="80" cy="50" rx="20" ry="40" />
  <ellipse cx="80" cy="50" rx="20" ry="40" />
</svg>
```

#### CSS

Chúng ta chỉ tạo kiểu cho hình ellipse đầu tiên, để phần còn lại sử dụng kiểu mặc định của user agent (với {{cssxref("fill")}} mặc định là màu đen). Thuộc tính hình học `rx` ghi đè giá trị của thuộc tính SVG {{SVGAttr("rx")}}. Chúng ta cũng đặt các thuộc tính `fill` và {{cssxref("stroke")}} để phân biệt hình được tạo kiểu với phần còn lại.

```css
svg {
  border: 1px solid;
}

ellipse:first-of-type {
  rx: 80px;
  fill: magenta;
  stroke: rebeccapurple;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the horizontal radius of an ellipse", "300", "180")}}

Bán kính ngang của hình ellipse được tạo kiểu là `80px`, như được xác định trong giá trị thuộc tính CSS `rx`. Bán kính ngang của hình ellipse không được tạo kiểu là `20px`, được xác định bởi thuộc tính `rx`.

### Giá trị phần trăm bán kính ngang của hình ellipse

Ví dụ này minh họa việc sử dụng giá trị phần trăm cho `rx`.

#### HTML

Chúng ta sử dụng cùng markup như ví dụ trước.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="80" cy="50" rx="20" ry="40" />
  <ellipse cx="80" cy="50" rx="20" ry="40" />
</svg>
```

#### CSS

CSS tương tự như ví dụ trước, với sự khác biệt duy nhất là giá trị thuộc tính `rx`; trong trường hợp này, chúng ta sử dụng giá trị phần trăm.

```css
svg {
  border: 1px solid;
}

ellipse:first-of-type {
  rx: 30%;
  fill: magenta;
  stroke: rebeccapurple;
}
```

#### Kết quả

{{EmbedLiveSample("Ellipse horizontal radius percentage values", "300", "180")}}

Khi sử dụng giá trị phần trăm cho `rx`, các giá trị tương đối với chiều rộng của khung nhìn SVG. Ở đây, kích thước bán kính ngang của hình ellipse được tạo kiểu là `30%` chiều rộng của khung nhìn SVG hiện tại. Vì chiều rộng mặc định là `300px`, giá trị `rx` là `90px`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính hình học: `rx`, {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Thuộc tính SVG {{SVGAttr("rx")}}
