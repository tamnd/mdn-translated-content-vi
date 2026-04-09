---
title: "CanvasRenderingContext2D: thuộc tính textAlign"
short-title: văn bảnCăn chỉnh
slug: Web/API/CanvasRenderingContext2D/textAlign
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.textAlign
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.textAlign`** của API Canvas 2D chỉ định cách căn chỉnh văn bản hiện tại được sử dụng khi vẽ văn bản.

Căn chỉnh liên quan đến giá trị`x`của phương thức{{domxref("CanvasRenderingContext2D.fillText", "fillText()")}}. Ví dụ: nếu`textAlign`là`"center"`thì cạnh trái của văn bản sẽ là`x - (textWidth / 2)`.

## Giá trị

Các giá trị có thể:

- `"left"`
  - : Văn bản được căn trái.
- `"right"`
  - : Văn bản được căn phải.
- `"center"`
  - : Văn bản được căn giữa.
- `"start"`
  - : Văn bản được căn chỉnh ở đầu dòng thông thường (căn trái cho từ trái sang phải
    ngôn ngữ, căn phải cho các ngôn ngữ từ phải sang trái).
- `"end"`
  - : Văn bản được căn chỉnh ở cuối dòng thông thường (căn phải cho từ trái sang phải
    ngôn ngữ, căn trái cho ngôn ngữ từ phải sang trái).

Giá trị mặc định là`"start"`.

## Ví dụ

### Căn chỉnh văn bản chung

Ví dụ này minh họa ba giá trị "vật lý" của thuộc tính`textAlign`:`"left"`,`"center"`và`"right"`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
canvas.width = 350;
const ctx = canvas.getContext("2d");
const x = canvas.width / 2;

ctx.beginPath();
ctx.moveTo(x, 0);
ctx.lineTo(x, canvas.height);
ctx.stroke();

ctx.font = "30px serif";

ctx.textAlign = "left";
ctx.fillText("left-aligned", x, 40);

ctx.textAlign = "center";
ctx.fillText("center-aligned", x, 85);

ctx.textAlign = "right";
ctx.fillText("right-aligned", x, 130);
```

#### Kết quả

{{ EmbedLiveSample('General_text_alignment', 700, 180) }}

### Căn chỉnh văn bản phụ thuộc vào hướng

Ví dụ này minh họa hai giá trị phụ thuộc vào hướng của thuộc tính`textAlign`:`"start"`và`"end"`. Lưu ý rằng thuộc tính{{domxref("CanvasRenderingContext2D.direction", "direction")}}được chỉ định thủ công là`"ltr"`, mặc dù đây cũng là mặc định cho văn bản tiếng Anh.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "30px serif";
ctx.direction = "ltr";

ctx.textAlign = "start";
ctx.fillText("Start-aligned", 0, 50);

ctx.textAlign = "end";
ctx.fillText("End-aligned", canvas.width, 120);
```

#### Kết quả

{{ EmbedLiveSample('Direction-dependent_text_alignment', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
