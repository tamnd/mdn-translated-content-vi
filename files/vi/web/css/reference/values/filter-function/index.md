---
title: <filter-function>
slug: Web/CSS/Reference/Values/filter-function
page-type: css-type
browser-compat: css.types.filter-function
sidebar: cssref
---

Kiểu dữ liệu **`<filter-function>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một hiệu ứng đồ họa có thể thay đổi giao diện của hình ảnh đầu vào. Nó được dùng trong các thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}}.

## Cú pháp

Kiểu dữ liệu `<filter-function>` được chỉ định bằng một trong các hàm bộ lọc liệt kê bên dưới. Mỗi hàm yêu cầu một đối số; nếu đối số không hợp lệ, sẽ không có bộ lọc nào được áp dụng.

- {{cssxref("filter-function/blur", "blur()")}}
  - : Làm mờ hình ảnh.
- {{cssxref("filter-function/brightness", "brightness()")}}
  - : Làm cho hình ảnh sáng hơn hoặc tối hơn.
- {{cssxref("filter-function/contrast", "contrast()")}}
  - : Tăng hoặc giảm độ tương phản của hình ảnh.
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - : Áp dụng bóng đổ phía sau hình ảnh.
- {{cssxref("filter-function/grayscale", "grayscale()")}}
  - : Chuyển đổi hình ảnh sang thang màu xám.
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - : Thay đổi màu sắc tổng thể của hình ảnh.
- {{cssxref("filter-function/invert", "invert()")}}
  - : Đảo ngược màu sắc của hình ảnh.
- {{cssxref("filter-function/opacity", "opacity()")}}
  - : Làm cho hình ảnh trong suốt.
- {{cssxref("filter-function/saturate", "saturate()")}}
  - : Tăng hoặc giảm độ bão hòa của hình ảnh đầu vào.
- {{cssxref("filter-function/sepia", "sepia()")}}
  - : Chuyển đổi hình ảnh sang tông màu nâu vàng (sepia).

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### So sánh các hàm bộ lọc

Ví dụ này cung cấp một đồ họa, một menu chọn để bạn chọn giữa các loại hàm bộ lọc khác nhau, và một thanh trượt để thay đổi giá trị sử dụng bên trong hàm bộ lọc. Cập nhật các điều khiển sẽ cập nhật hiệu ứng bộ lọc theo thời gian thực, cho phép bạn khám phá hiệu ứng của các bộ lọc khác nhau.

Menu thả xuống chọn tên hàm, và thanh trượt thiết lập giá trị tham số cho hàm đó. Đối với `drop-shadow`, giá trị được dùng cho cả độ lệch ngang và dọc, và bán kính được đặt bằng một nửa giá trị.

```html hidden live-sample___filter-functions
<div></div>
<ul>
  <li>
    <label for="filter-select">Choose a filter function:</label>
    <select id="filter-select">
      <option selected>blur</option>
      <option>brightness</option>
      <option>contrast</option>
      <option>drop-shadow</option>
      <option>grayscale</option>
      <option>hue-rotate</option>
      <option>invert</option>
      <option>opacity</option>
      <option>saturate</option>
      <option>sepia</option>
    </select>
  </li>
  <li><input type="range" /><output></output></li>
  <li>
    <p>Current value: <code></code></p>
  </li>
</ul>
```

```css hidden live-sample___filter-functions
div {
  width: 100%;
  height: 512px;
  background-image: url("https://mdn.github.io/shared-assets/images/examples/fx-nightly-512.png");
  background-repeat: no-repeat;
  background-position: center center;
}

li {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
}

input {
  width: 60%;
}

output {
  width: 5%;
  text-align: center;
}

select {
  width: 40%;
  margin-left: 2px;
}
```

```js hidden live-sample___filter-functions
const selectElem = document.querySelector("select");
const divElem = document.querySelector("div");
const slider = document.querySelector("input");
const output = document.querySelector("output");
const curValue = document.querySelector("p code");

selectElem.addEventListener("change", () => {
  setSlider(selectElem.value);
  setDiv(selectElem.value);
});

slider.addEventListener("input", () => {
  setDiv(selectElem.value);
});

function setSlider(filter) {
  switch (filter) {
    case "blur":
      slider.value = 0;
      slider.min = 0;
      slider.max = 30;
      slider.step = 1;
      slider.setAttribute("data-unit", "px");
      break;
    case "brightness":
    case "contrast":
    case "saturate":
      slider.value = 1;
      slider.min = 0;
      slider.max = 4;
      slider.step = 0.05;
      slider.setAttribute("data-unit", "");
      break;
    case "drop-shadow":
      slider.value = 0;
      slider.min = -20;
      slider.max = 40;
      slider.step = 1;
      slider.setAttribute("data-unit", "px");
      break;
    case "opacity":
      slider.value = 1;
      slider.min = 0;
      slider.max = 1;
      slider.step = 0.01;
      slider.setAttribute("data-unit", "");
      break;
    case "grayscale":
    case "invert":
    case "sepia":
      slider.value = 0;
      slider.min = 0;
      slider.max = 1;
      slider.step = 0.01;
      slider.setAttribute("data-unit", "");
      break;
    case "hue-rotate":
      slider.value = 0;
      slider.min = 0;
      slider.max = 360;
      slider.step = 1;
      slider.setAttribute("data-unit", "deg");
      break;
    default:
      console.error("Unknown filter set");
  }
}

function setDiv(filter) {
  const unit = slider.getAttribute("data-unit");
  const offset = `${Math.round(slider.value)}${unit}`;
  const radius = `${Math.round(Math.abs(slider.value / 2))}${unit}`;
  divElem.style.filter =
    filter === "drop-shadow"
      ? `${selectElem.value}(${offset} ${offset} ${radius})`
      : `${selectElem.value}(${slider.value}${unit})`;

  updateOutput();
  updateCurValue();
}

function updateOutput() {
  output.textContent = slider.value;
}

function updateCurValue() {
  curValue.textContent = `filter: ${divElem.style.filter}`;
}

setSlider(selectElem.value);
setDiv(selectElem.value);
```

{{EmbedLiveSample("filter-functions", "", "700px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("filter")}} và {{cssxref("backdrop-filter")}}
