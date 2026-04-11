---
title: TextMetrics
slug: Web/API/TextMetrics
page-type: web-api-interface
browser-compat: api.TextMetrics
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Giao diện **`TextMetrics`** đại diện cho kích thước của một đoạn văn bản trong canvas; một thực thể `TextMetrics` có thể được lấy bằng phương thức {{domxref("CanvasRenderingContext2D.measureText()")}}.

## Thuộc tính phiên bản

- {{domxref("TextMetrics.width")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của một đoạn văn bản nội tuyến tính bằng pixel CSS. Tính đến font chữ hiện tại của ngữ cảnh.
- {{domxref("TextMetrics.actualBoundingBoxLeft")}} {{ReadOnlyInline}}
  - : Khoảng cách song song với đường cơ sở từ điểm căn chỉnh do thuộc tính {{domxref("CanvasRenderingContext2D.textAlign")}} xác định đến cạnh trái của hình chữ nhật bao quanh văn bản đã cho, tính bằng pixel CSS; số dương cho biết khoảng cách về bên trái từ điểm căn chỉnh đã cho.
- {{domxref("TextMetrics.actualBoundingBoxRight")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ điểm căn chỉnh do thuộc tính {{domxref("CanvasRenderingContext2D.textAlign")}} xác định đến cạnh phải của hình chữ nhật bao quanh văn bản đã cho, tính bằng pixel CSS. Khoảng cách được đo song song với đường cơ sở.
- {{domxref("TextMetrics.fontBoundingBoxAscent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đỉnh của hình chữ nhật bao quanh cao nhất trong tất cả các font chữ được dùng để hiển thị văn bản, tính bằng pixel CSS.
- {{domxref("TextMetrics.fontBoundingBoxDescent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của hình chữ nhật bao quanh tất cả các font chữ được dùng để hiển thị văn bản, tính bằng pixel CSS.
- {{domxref("TextMetrics.actualBoundingBoxAscent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đỉnh của hình chữ nhật bao quanh dùng để hiển thị văn bản, tính bằng pixel CSS.
- {{domxref("TextMetrics.actualBoundingBoxDescent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của hình chữ nhật bao quanh dùng để hiển thị văn bản, tính bằng pixel CSS.
- {{domxref("TextMetrics.emHeightAscent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đỉnh của ô _em_ trong hộp dòng, tính bằng pixel CSS.
- {{domxref("TextMetrics.emHeightDescent")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của ô _em_ trong hộp dòng, tính bằng pixel CSS.
- {{domxref("TextMetrics.hangingBaseline")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đường cơ sở treo (hanging baseline) của hộp dòng, tính bằng pixel CSS.
- {{domxref("TextMetrics.alphabeticBaseline")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến {{glossary("/Baseline/Typography", "đường cơ sở chữ cái")}} của hộp dòng, tính bằng pixel CSS.
- {{domxref("TextMetrics.ideographicBaseline")}} {{ReadOnlyInline}}
  - : Trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đường cơ sở tượng hình (ideographic baseline) của hộp dòng, tính bằng pixel CSS.

## Ví dụ

### Minh họa các đường cơ sở

Ví dụ này minh họa các đường cơ sở mà đối tượng `TextMetrics` lưu giữ. Đường cơ sở mặc định là `alphabeticBaseline`. Xem thêm thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}}.

#### HTML

```html
<canvas id="canvas" width="550" height="500"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const baselinesAboveAlphabetic = [
  "fontBoundingBoxAscent",
  "actualBoundingBoxAscent",
  "emHeightAscent",
  "hangingBaseline",
];
const baselinesBelowAlphabetic = [
  "ideographicBaseline",
  "emHeightDescent",
  "actualBoundingBoxDescent",
  "fontBoundingBoxDescent",
];
const baselines = [...baselinesAboveAlphabetic, ...baselinesBelowAlphabetic];
ctx.font = "25px serif";
ctx.strokeStyle = "red";

baselines.forEach((baseline, index) => {
  const text = `Abcdefghijklmnop (${baseline})`;
  const textMetrics = ctx.measureText(text);
  const y = 50 + index * 50;
  ctx.beginPath();
  ctx.fillText(text, 0, y);

  const baselineMetricValue = textMetrics[baseline];
  if (baselineMetricValue === undefined) {
    return;
  }

  const lineY = baselinesBelowAlphabetic.includes(baseline)
    ? y + Math.abs(baselineMetricValue)
    : y - Math.abs(baselineMetricValue);
  ctx.moveTo(0, lineY);
  ctx.lineTo(550, lineY);
  ctx.stroke();
});
```

#### Kết quả

{{EmbedLiveSample('Baselines_illustrated', 700, 550)}}

### Đo chiều rộng văn bản

Khi đo theo chiều x của một đoạn văn bản, tổng của `actualBoundingBoxLeft` và `actualBoundingBoxRight` có thể rộng hơn chiều rộng của hộp nội tuyến (`width`), do các font chữ nghiêng/in nghiêng mà ký tự vượt ra ngoài chiều rộng tiến.

Do đó, sử dụng tổng của `actualBoundingBoxLeft` và `actualBoundingBoxRight` là cách chính xác hơn để lấy chiều rộng văn bản tuyệt đối:

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const text = "Abcdefghijklmnop";
ctx.font = "italic 50px serif";
const textMetrics = ctx.measureText(text);

console.log(textMetrics.width);
// 459.8833312988281

console.log(
  textMetrics.actualBoundingBoxRight + textMetrics.actualBoundingBoxLeft,
);
// 462.8833333333333
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức tạo trong {{domxref("CanvasRenderingContext2D")}}
- Phần tử {{HTMLElement("canvas")}} và giao diện liên quan {{domxref("HTMLCanvasElement")}}
