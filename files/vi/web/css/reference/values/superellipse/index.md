---
title: superellipse()
slug: Web/CSS/Reference/Values/superellipse
page-type: css-function
status:
  - experimental
browser-compat: css.types.superellipse
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`superellipse()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) xác định độ cong của một hình elip, và được dùng để chỉ định [hình dạng góc](/vi/docs/Web/CSS/Reference/Properties/corner-shape) trực tiếp hoặc thông qua các từ khóa {{cssxref("&lt;corner-shape-value>")}}.

## Cú pháp

```css
superellipse(infinity)
superellipse(4)
superellipse(1.7)
superellipse(0)
superellipse(-2.8)
superellipse(-3)
superellipse(-infinity)
```

### Tham số

- {{cssxref("&lt;number>")}}
  - : Một số trong khoảng từ `-infinity` đến `infinity`, bao gồm cả hai đầu.

### Giá trị trả về

Một hình dạng siêu elip.

## Mô tả

Hàm `superellipse()` trả về một hình dạng siêu elip, được dùng để chỉ định các giá trị {{cssxref("corner-shape")}}. Siêu elip là một đường cong khép kín đối xứng nằm giữa hình chữ nhật và hình elip. Nó giống một hình elip nhưng giữ lại các đặc điểm hình học của hai trục.

Hình dạng siêu elip được tính toán dựa trên một phiên bản sửa đổi của phương trình elip. Phương trình sau định nghĩa một hình elip có tâm tại gốc tọa độ:

<math display="block">
  <mfrac>
    <msup>
      <mi>x</mi>
      <mn>2</mn>
    </msup>
    <msup>
      <mi>a</mi>
      <mn>2</mn>
    </msup>
  </mfrac>
  <mo>+</mo>
  <mfrac>
    <msup>
      <mi>y</mi>
      <mn>2</mn>
    </msup>
    <msup>
      <mi>b</mi>
      <mn>2</mn>
    </msup>
  </mfrac>
    <mo>=</mo>
    <mn>1</mn>
  </math>

Các biến `a` và `b` là bán kính của hình elip, còn các tọa độ `x` và `y` là các điểm trên chu vi của hình elip.

Hình tròn là trường hợp đặc biệt của hình elip khi hai bán kính `a` và `b` bằng nhau. Với `a` và `b` đều bằng `r`, phương trình đường tròn có thể viết là:

<math display="block">
  <mrow>
    <msup>
      <mi>x</mi>
      <mn>2</mn>
    </msup>
    <mo>+</mo>
    <msup>
      <mi>y</mi>
      <mn>2</mn>
    </msup>
    <mo>=</mo>
    <msup>
      <mi>r</mi>
      <mn>2</mn>
    </msup>
  </mrow>
</math>

Trong phương trình này, `x` và `y` là tọa độ các điểm trên chu vi đường tròn, và `r` là bán kính với tâm tại `(0, 0)`. Hình elip được tạo ra bằng cách co giãn hình tròn theo trục `x` và/hoặc `y`.

Hình dạng siêu elip được tạo bằng cách thay số mũ `2` trong mỗi trường hợp bằng 2<sup>K</sup>, trong đó `K` là đối số truyền vào hàm `superellipse()`, giúp điều chỉnh độ cong của hình elip:

<math display="block">
  <mrow>
    <msup>
      <mi>x</mi>
      <msup>
        <mn>2</mn>
        <mi>K</mi>
      </msup>
    </msup>
    <mo>+</mo>
    <msup>
      <mi>y</mi>
      <msup>
        <mn>2</mn>
        <mi>K</mi>
      </msup>
    </msup>
    <mo>=</mo>
    <mn>1</mn>
  </mrow>
</math>

Sơ đồ sau minh họa các giá trị `superellipse()` khác nhau cho góc trên phải của một container: `infinity`, `1`, `0`, `-1` và `-infinity`:

![Sơ đồ đường minh họa các hình elip được tạo bằng các giá trị K khác nhau, như mô tả tiếp theo](superellipse-param.svg)

- Giá trị `K` bằng `0` tạo ra một đường thẳng. Giá trị này có thể dùng để tạo góc vát và tương ứng với từ khóa `bevel` của {{cssxref("&lt;corner-shape-value>")}}.
- Giá trị `K` bằng `1` tạo ra hình elip thông thường, tương ứng với từ khóa `round`.
- Giá trị `K` lớn hơn `1` làm hình elip có dạng vuông hơn; `2` tương ứng với từ khóa `squircle`.
- Giá trị `K` bằng `infinity` tạo ra một hình vuông hoàn hảo (tương ứng với từ khóa `square`), mặc dù các giá trị `K` từ `10` trở lên về cơ bản không thể phân biệt với hình vuông.
- Các giá trị `K` âm tạo ra đường cong lõm, dẫn đến các hình dạng góc cong vào trong hoặc "bị khoét". Giá trị `K` bằng `-1` tương ứng với từ khóa `scoop` và `-infinity` tương ứng với từ khóa `notch`.

Một siêu elip âm hoặc dương sẽ trông đối xứng với siêu elip có giá trị nghịch đảo của nó.

> [!NOTE]
> Đối với bất kỳ giá trị tham số `K` nào được truyền vào, giá trị trả về của hàm `superellipse()` luôn giống nhau cho giá trị `K` đó. Khi giá trị đó được áp dụng cho hai phần tử, hình dạng góc có thể khác nhau nếu kích thước hộp hoặc các giá trị {{cssxref("border-radius")}} khác nhau.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### So sánh các giá trị `superellipse()`

Trong ví dụ này, hai thanh trượt [`<input type="range">`](/vi/docs/Web/HTML/Reference/Elements/input/range) cho phép bạn duyệt qua nhiều giá trị `corner-shape` `superellipse()` và giá trị {{cssxref("border-radius")}} khác nhau, giúp bạn so sánh hiệu ứng của từng giá trị lên một container. Code được ẩn để ngắn gọn, nhưng bạn có thể xem giải thích đầy đủ về [so sánh giá trị superellipse](/vi/docs/Web/CSS/Reference/Properties/corner-shape#superellipse_value_comparison) trên trang tham khảo {{cssxref("corner-shape")}}.

```html hidden live-sample___value-comparison
<form>
  <div>
    <label for="superellipse-slider">Choose a superellipse() value:</label>
    <input
      type="range"
      id="superellipse-slider"
      min="-5"
      value="0"
      max="5"
      step="0.1" />
  </div>
  <div>
    <label for="radius-slider">Choose a border-radius value:</label>
    <input type="range" id="radius-slider" min="0" value="45" max="90" />
  </div>
</form>
<section></section>
```

```css hidden live-sample___value-comparison
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: fit-content;
  margin: 20px auto;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 100%;
  margin-top: 20px;
}

form div {
  margin-top: 5px;
  display: flex;
}

section {
  width: 100%;
  height: 180px;
  background-color: orange;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}

section {
  box-shadow: 1px 1px 3px gray;
}
```

```js hidden live-sample___value-comparison
const rectangle = document.querySelector("section");
const superEllipseRange = document.getElementById("superellipse-slider");
const borderRadiusRange = document.getElementById("radius-slider");

function setCorners() {
  const seValue = `superellipse(${superEllipseRange.value})`;
  rectangle.style.cornerShape = seValue;
  const brValue = `${borderRadiusRange.value}px`;
  rectangle.style.borderRadius = brValue;
  rectangle.innerHTML = `<div><code>corner-shape: ${seValue};</code><br><code>border-radius: ${brValue};</code></div>`;
}

superEllipseRange.addEventListener("input", setCorners);
borderRadiusRange.addEventListener("input", setCorners);
setCorners();
```

{{EmbedLiveSample("value-comparison", "100%", "300")}}

> [!NOTE]
> Xem thêm ví dụ [so sánh giá trị `<corner-shape-value>`](/vi/docs/Web/CSS/Reference/Values/corner-shape-value#corner-shape-value_value_comparison).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("corner-shape")}}
- {{cssxref("&lt;corner-shape-value>")}}
- [CSS borders and box decorations](/vi/docs/Web/CSS/Guides/Borders_and_box_decorations) module
