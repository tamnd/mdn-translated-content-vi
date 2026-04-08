---
title: <corner-shape-value>
slug: Web/CSS/Reference/Values/corner-shape-value
page-type: css-type
status:
  - experimental
browser-compat: css.types.corner-shape-value
sidebar: cssref
---

{{SeeCompatTable}}

Kiểu dữ liệu **`<corner-shape-value>`** trong [CSS](/vi/docs/Web/CSS) mô tả hình dạng của góc container. Nó được sử dụng bởi thuộc tính viết tắt {{cssxref("corner-shape")}} và các [thuộc tính cấu thành](/vi/docs/Web/CSS/Reference/Properties/corner-shape#constituent_properties) của nó để chỉ định hình dạng áp dụng cho các góc container bị ảnh hưởng.

## Cú pháp

Kiểu dữ liệu `<corner-shape-value>` có thể nhận một hàm {{cssxref("superellipse()")}} định nghĩa hình dạng tùy chỉnh, hoặc một trong sáu giá trị từ khóa mô tả các giá trị `superellipse()` phổ biến.

### Giá trị

- {{cssxref("superellipse()")}}
  - : Định nghĩa hình dạng siêu ellipse góc tùy chỉnh. Tham số âm tạo ra đường cong hướng vào trong, hoặc lõm, trong khi tham số dương tạo ra đường cong hướng ra ngoài, hoặc lồi.
- Từ khóa
  - : Các giá trị từ khóa có sẵn như sau:
    - `bevel`
      - : Định nghĩa góc chéo thẳng, không lồi cũng không lõm. Từ khóa `bevel` tương đương với `superellipse(0)`.
    - `notch`
      - : Định nghĩa góc vuông lõm 90 độ. Từ khóa `notch` tương đương với `superellipse(-infinity)`.
    - `round`
      - : Định nghĩa ellipse lồi thông thường, là góc bo tròn tiêu chuẩn được tạo bởi {{cssxref("border-radius")}} mà không có `corner-shape` được áp dụng. Từ khóa `round` tương đương với `superellipse(1)`. Đây là giá trị mặc định (khởi tạo) cho tất cả các thuộc tính `corner-shape`.
    - `scoop`
      - : Định nghĩa ellipse lõm thông thường. Từ khóa `scoop` tương đương với `superellipse(-1)`.
    - `square`
      - : Định nghĩa góc vuông lồi 90 độ, là hình dạng góc mặc định khi không có `border-radius` (hoặc `border-radius: 0`) được áp dụng. Từ khóa `square` tương đương với `superellipse(infinity)`.
    - `squircle`
      - : Định nghĩa một "squircle", là đường cong lồi nằm giữa `round` và `square`. Từ khóa `squircle` tương đương với `superellipse(2)`.

> [!NOTE]
> Bạn có thể animate mượt mà giữa các giá trị `superellipse()` khác nhau, và giữa các từ khóa hình dạng góc khác nhau, vì animation nội suy giữa các giá trị `superellipse()` tương đương của chúng.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh giá trị `<corner-shape-value>`

Trong ví dụ này, chúng ta cung cấp một menu thả xuống cho phép bạn chọn các giá trị `<corner-shape-value>` khác nhau và một thanh trượt cập nhật {{cssxref("border-radius")}} của container. Điều này cho phép hình dung hiệu ứng của các từ khóa khác nhau và các giá trị tham số `superellipse()`.

Thuộc tính `corner-shape` định nghĩa hình dạng của các góc hộp trong khi vùng áp dụng hình dạng được chỉ định bởi thuộc tính `border-radius`. Code được ẩn để ngắn gọn, nhưng bạn có thể tìm thấy [giải thích đầy đủ về các giá trị `corner-shape`](/vi/docs/Web/CSS/Reference/Properties/corner-shape#comparing_corner-shape_values) cùng với các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

```html hidden live-sample___value-comparison
<form>
  <div>
    <label for="corner-shape-choice">Choose a corner-shape value:</label>
    <select id="corner-shape-choice">
      <optgroup label="Keywords">
        <option value="square">square | superellipse(infinity)</option>
        <option selected value="squircle">squircle | superellipse(2)</option>
        <option value="round">round | superellipse(1)</option>
        <option value="bevel">bevel | superellipse(0)</option>
        <option value="scoop">scoop | superellipse(-1)</option>
        <option value="notch">notch | superellipse(-infinity)</option>
      </optgroup>
      <optgroup label="Functions">
        <option>superellipse(3)</option>
        <option>superellipse(1.5)</option>
        <option>superellipse(0.5)</option>
        <option>superellipse(-0.5)</option>
        <option>superellipse(-1.5)</option>
        <option>superellipse(-3)</option>
      </optgroup>
    </select>
  </div>
  <div>
    <label for="radius-slider">Choose a border-radius value:</label>
    <input
      type="range"
      id="radius-slider"
      min="0"
      value="45"
      max="90"
      step="1" />
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
  margin-top: 20px;
}

select {
  padding: 3px 5px;
}

form div:nth-of-type(2) {
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
const select = document.querySelector("select");
const range = document.getElementById("radius-slider");

function setCorners() {
  rectangle.style.cornerShape = select.value;
  const brValue = `${range.value}px`;
  rectangle.style.borderRadius = brValue;
  rectangle.innerHTML = `<div><code>corner-shape: ${select.value};</code><br><code>border-radius: ${brValue};</code></div>`;
}

select.addEventListener("change", setCorners);
range.addEventListener("input", setCorners);
setCorners();
```

{{EmbedLiveSample("value-comparison", "100%", "300")}}

> [!NOTE]
> Xem thêm ví dụ [so sánh giá trị hàm `superellipse()`](/vi/docs/Web/CSS/Reference/Values/superellipse#superellipse_value_comparison).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("corner-shape")}}
- {{cssxref("border-radius")}}
- {{cssxref("superellipse()")}}
- Mô-đun [CSS borders and box decorations](/vi/docs/Web/CSS/Guides/Borders_and_box_decorations)
