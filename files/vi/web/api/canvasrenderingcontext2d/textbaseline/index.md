---
title: "CanvasRenderingContext2D: thuộc tính textBaseline"
short-title: văn bảnBaseline
slug: Web/API/CanvasRenderingContext2D/textBaseline
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.textBaseline
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.textBaseline`** của API Canvas 2D chỉ định đường cơ sở văn bản hiện tại được sử dụng khi vẽ văn bản.

## Giá trị

Các giá trị có thể:

- `"top"`
  - : Đường cơ sở của văn bản là phần trên cùng của hình vuông em.
- `"hanging"`
  - : Đường cơ sở của văn bản là đường cơ sở treo. (Được sử dụng bởi người Tây Tạng và người Ấn Độ khác
    kịch bản.)
- `"middle"`
  - : Đường cơ sở của văn bản là giữa hình vuông em.
- `"alphabetic"`
  - : Đường cơ sở của văn bản là{{glossary("/Baseline/Typography", "alphabetic baseline")}}bình thường. Giá trị mặc định.
- `"ideographic"`
  - : Đường cơ sở của văn bản là đường cơ sở của chữ tượng hình; đây là phần dưới cùng của cơ thể
    các ký tự, nếu phần chính của các ký tự nhô ra phía dưới đường cơ sở của bảng chữ cái. (Được sử dụng bởi chữ viết tiếng Trung, tiếng Nhật và tiếng Hàn.)
- `"bottom"`
  - : Đường cơ sở của văn bản là phần dưới cùng của hộp giới hạn. Điều này khác với
    đường cơ sở ý thức hệ trong đó đường cơ sở ý thức hệ không tính đến hậu duệ.

Giá trị mặc định là`"alphabetic"`.

## Ví dụ

### So sánh giá trị tài sản

Ví dụ này minh họa các giá trị thuộc tính`textBaseline`khác nhau.

#### HTML

```html
<canvas id="canvas" width="550" height="500"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const baselines = [
  "top",
  "hanging",
  "middle",
  "alphabetic",
  "ideographic",
  "bottom",
];
ctx.font = "36px serif";
ctx.strokeStyle = "red";

baselines.forEach((baseline, index) => {
  ctx.textBaseline = baseline;
  const y = 75 + index * 75;
  ctx.beginPath();
  ctx.moveTo(0, y + 0.5);
  ctx.lineTo(550, y + 0.5);
  ctx.stroke();
  ctx.fillText(`Abcdefghijklmnop (${baseline})`, 0, y);
});
```

#### Kết quả

{{ EmbedLiveSample('Comparison_of_property_values', 700, 550) }}

### So sánh giá trị thuộc tính trên cùng một dòng

Giống như ví dụ trước, ví dụ này minh họa các giá trị thuộc tính`textBaseline`khác nhau, nhưng trong trường hợp này tất cả chúng được xếp theo chiều ngang dọc theo cùng một đường — để dễ dàng thấy chúng khác nhau như thế nào.

#### HTML

```html
<canvas id="canvas" width="724" height="160"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const baselines = [
  "top",
  "hanging",
  "middle",
  "alphabetic",
  "ideographic",
  "bottom",
];
ctx.font = "20px serif";
ctx.strokeStyle = "red";

ctx.beginPath();
ctx.moveTo(0, 100);
ctx.lineTo(840, 100);
ctx.moveTo(0, 55);
ctx.stroke();

baselines.forEach((baseline, index) => {
  ctx.save();
  ctx.textBaseline = baseline;
  let x = index * 120 + 10;
  ctx.fillText("Abcdefghijk", x, 100);
  ctx.restore();
  ctx.fillText(baseline, x + 5, 50);
});
```

#### Kết quả

{{ EmbedLiveSample('Comparison of property values on the same line', 900, 200) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
