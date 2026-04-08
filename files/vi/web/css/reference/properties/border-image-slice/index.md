---
title: border-image-slice
slug: Web/CSS/Reference/Properties/border-image-slice
page-type: css-property
browser-compat: css.properties.border-image-slice
sidebar: cssref
---

Thuộc tính **`border-image-slice`** [CSS](/en-US/docs/Web/CSS) chia hình ảnh được chỉ định bởi {{cssxref("border-image-source")}} thành các vùng. Các vùng này tạo thành các thành phần của [hình ảnh đường viền](/en-US/docs/Web/CSS/Reference/Properties/border-image) của phần tử.

{{InteractiveExample("CSS Demo: border-image-slice")}}

```css interactive-example-choice
border-image-slice: 30;
```

```css interactive-example-choice
border-image-slice: 30 fill;
```

```css interactive-example-choice
border-image-slice: 44;
```

```css interactive-example-choice
border-image: url("/shared-assets/images/examples/border-florid.svg") round;
border-image-slice: calc(50 / 184 * 100%) calc(80 / 284 * 100%) fill;
border-image-width: 30px 48px;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is a box with a border around it.</div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 50px;
  background: #fff3d4;
  color: black;
  border: 30px solid;
  border-image: url("/shared-assets/images/examples/border-diamonds.png") 30
    round;
  font-size: 1.2em;
}
```

## Cú pháp

```css
/* Tất cả các cạnh */
border-image-slice: 30%;

/* trên và dưới | trái và phải */
border-image-slice: 10% 30%;

/* trên | trái và phải | dưới */
border-image-slice: 30 30% 45;

/* trên | phải | dưới | trái */
border-image-slice: 7 12 14 5;

/* Sử dụng từ khóa `fill` */
border-image-slice: 10% fill;
border-image-slice: fill 10%;

/* Giá trị toàn cục */
border-image-slice: inherit;
border-image-slice: initial;
border-image-slice: revert;
border-image-slice: revert-layer;
border-image-slice: unset;
```

Thuộc tính `border-image-slice` có thể được chỉ định bằng một đến bốn giá trị `<number-percentage>` để biểu diễn vị trí của mỗi lát cắt hình ảnh. Giá trị âm không hợp lệ; giá trị lớn hơn kích thước tương ứng sẽ bị kẹp lại ở `100%`.

- Khi chỉ định **một** vị trí, nó tạo ra cả bốn lát cắt với cùng khoảng cách từ các cạnh tương ứng.
- Khi chỉ định **hai** vị trí, giá trị đầu tiên tạo ra các lát cắt đo từ **trên và dưới**, giá trị thứ hai tạo ra các lát cắt đo từ **trái và phải**.
- Khi chỉ định **ba** vị trí, giá trị đầu tiên tạo ra lát cắt đo từ **trên**, giá trị thứ hai tạo ra các lát cắt đo từ **trái và phải**, giá trị thứ ba tạo ra lát cắt đo từ **dưới**.
- Khi chỉ định **bốn** vị trí, chúng tạo ra các lát cắt đo từ **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

Giá trị `fill` tùy chọn, nếu được sử dụng, có thể được đặt ở bất kỳ đâu trong khai báo.

### Giá trị

- {{cssxref("&lt;number&gt;")}}
  - : Biểu diễn độ lệch cạnh tính bằng _pixel_ cho hình ảnh raster và _tọa độ_ cho hình ảnh vector. Đối với hình ảnh vector, con số này tương đối với kích thước của phần tử, không phải kích thước của hình ảnh nguồn, vì vậy phần trăm thường được ưu tiên hơn trong những trường hợp này.
- {{cssxref("&lt;percentage&gt;")}}
  - : Biểu diễn độ lệch cạnh dưới dạng phần trăm của kích thước hình ảnh nguồn: chiều rộng của hình ảnh cho các độ lệch ngang, chiều cao cho các độ lệch dọc.
- `fill`
  - : Bảo toàn vùng hình ảnh ở giữa và hiển thị nó như một hình ảnh nền, nhưng được xếp chồng lên {{cssxref("background")}} thực sự. Chiều rộng và chiều cao của nó được định kích thước để khớp với vùng hình ảnh trên và trái tương ứng.

## Mô tả

Quá trình cắt lát tạo ra tổng cộng chín vùng: bốn góc, bốn cạnh và một vùng ở giữa. Bốn đường cắt lát, được đặt ở khoảng cách nhất định từ các cạnh tương ứng, kiểm soát kích thước của các vùng.

![Chín vùng được xác định bởi các thuộc tính border-image hoặc border-image-slice](border-image-slice.png)

Sơ đồ trên minh họa vị trí của từng vùng.

- Vùng 1-4 là các vùng góc. Mỗi vùng được sử dụng một lần để tạo thành các góc của hình ảnh đường viền cuối cùng.
- Vùng 5-8 là các vùng cạnh. Chúng được [lặp lại, thu nhỏ, hoặc sửa đổi theo cách khác](/en-US/docs/Web/CSS/Reference/Properties/border-image-repeat) trong hình ảnh đường viền cuối cùng để khớp với kích thước của phần tử.
- Vùng 9 là vùng ở giữa. Nó bị loại bỏ theo mặc định, nhưng được sử dụng như một hình ảnh nền nếu từ khóa `fill` được đặt.

Các thuộc tính {{cssxref("border-image-repeat")}}, {{cssxref("border-image-width")}}, và {{cssxref("border-image-outset")}} xác định cách các vùng này được sử dụng để tạo thành hình ảnh đường viền cuối cùng.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chiều rộng đường viền và lát cắt có thể điều chỉnh

Ví dụ sau đây hiển thị một `<div>` với hình ảnh đường viền được đặt trên đó. Hình ảnh nguồn cho các đường viền như sau:

![kim cương nhiều màu đẹp](border-diamonds.png)

Các viên kim cương có kích thước 30px, vì vậy đặt 30 pixel làm giá trị cho cả {{cssxref("border-width")}} và `border-image-slice` sẽ cho bạn các viên kim cương hoàn chỉnh và khá sắc nét ở đường viền:

```css
border-width: 30px;
border-image-slice: 30;
```

Đây là các giá trị mặc định chúng tôi đã sử dụng trong ví dụ này. Tuy nhiên, chúng tôi cũng cung cấp hai thanh trượt để cho phép bạn thay đổi động các giá trị của hai thuộc tính trên, giúp bạn đánh giá hiệu ứng chúng tạo ra:

`border-image-slice` thay đổi kích thước của lát cắt hình ảnh được lấy mẫu để sử dụng ở mỗi đường viền và góc đường viền (và vùng nội dung, nếu từ khóa `fill` được sử dụng) — thay đổi giá trị này khỏi 30 khiến đường viền trông có phần không đều, nhưng có thể tạo ra một số hiệu ứng thú vị.

`border-width`: thay đổi chiều rộng của đường viền. Kích thước hình ảnh được lấy mẫu được chia tỷ lệ để vừa với bên trong đường viền, có nghĩa là nếu chiều rộng lớn hơn lát cắt, hình ảnh có thể bắt đầu trông có phần bị vỡ pixel (trừ khi bạn sử dụng hình ảnh SVG).

#### HTML

```html
<div class="wrapper">
  <div></div>
</div>

<ul>
  <li>
    <label for="width">slide to adjust <code>border-width</code></label>
    <input type="range" min="10" max="45" id="width" />
    <output id="width-output">30px</output>
  </li>
  <li>
    <label for="slice">slide to adjust <code>border-image-slice</code></label>
    <input type="range" min="10" max="45" id="slice" />
    <output id="slice-output">30</output>
  </li>
</ul>
```

#### CSS

```css
.wrapper {
  width: 400px;
  height: 300px;
}

div > div {
  width: 300px;
  height: 200px;
  border-width: 30px;
  border-style: solid;
  border-image: url("/shared-assets/images/examples/border-diamonds.png");
  border-image-slice: 30;
  border-image-repeat: round;
}

li {
  display: flex;
  place-content: center;
}
```

#### JavaScript

```js
const widthSlider = document.getElementById("width");
const sliceSlider = document.getElementById("slice");
const widthOutput = document.getElementById("width-output");
const sliceOutput = document.getElementById("slice-output");
const divElem = document.querySelector("div > div");

widthSlider.addEventListener("input", () => {
  const newValue = `${widthSlider.value}px`;
  divElem.style.borderWidth = newValue;
  widthOutput.textContent = newValue;
});

sliceSlider.addEventListener("input", () => {
  const newValue = sliceSlider.value;
  divElem.style.borderImageSlice = newValue;
  sliceOutput.textContent = newValue;
});
```

#### Kết quả

{{EmbedLiveSample('Adjustable_border_width_and_slice', '100%', 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô tả minh họa về cú pháp 1 đến 4 giá trị](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties#tricky_edge_cases)
- [Border images in CSS: A key focus area for Interop 2023](/en-US/blog/border-images-interop-2023/) trên blog MDN (2023)
