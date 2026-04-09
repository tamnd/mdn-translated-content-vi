---
title: "CanvasRenderingContext2D: thuộc tính textRendering"
short-title: kết xuất văn bản
slug: Web/API/CanvasRenderingContext2D/textRendering
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.textRendering
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.textRendering`** của[Canvas API](/en-US/docs/Web/API/Canvas_API)cung cấp thông tin cho công cụ hiển thị về nội dung cần tối ưu hóa khi hiển thị văn bản.

Các giá trị tương ứng với thuộc tính SVG[`text-rendering`](/en-US/docs/Web/SVG/Reference/Attribute/text-rendering)(và thuộc tính CSS{{cssxref("text-rendering")}}).

## Giá trị

Gợi ý hiển thị văn bản cho công cụ trình duyệt. Đây là một trong:

- `auto`
  - : Trình duyệt đưa ra những phỏng đoán có căn cứ về thời điểm cần tối ưu hóa tốc độ, mức độ dễ đọc và độ chính xác hình học trong khi vẽ văn bản.
- `optimizeSpeed`
  - : Trình duyệt nhấn mạnh tốc độ hiển thị hơn mức độ dễ đọc và độ chính xác hình học khi vẽ văn bản.
    Nó vô hiệu hóa kerning và chữ ghép.
- `optimizeLegibility`
  - : Trình duyệt nhấn mạnh mức độ dễ đọc về tốc độ hiển thị và độ chính xác hình học.
    Điều này cho phép kerning và các chữ ghép tùy chọn.
- `geometricPrecision`
  - : Trình duyệt nhấn mạnh độ chính xác hình học về tốc độ hiển thị và mức độ dễ đọc.
    Một số khía cạnh nhất định của phông chữ — chẳng hạn như kerning — không chia tỷ lệ tuyến tính. Đối với các yếu tố tỷ lệ lớn, bạn có thể thấy kết xuất văn bản kém đẹp nhưng kích thước đúng như bạn mong đợi (không làm tròn lên hoặc giảm xuống kích thước phông chữ gần nhất được hệ điều hành cơ bản hỗ trợ).

Thuộc tính có thể được sử dụng để lấy hoặc đặt giá trị.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "Xin chào thế giới" bằng cách sử dụng từng giá trị được hỗ trợ của thuộc tính`textRendering`. Giá trị cũng được hiển thị cho từng trường hợp bằng cách đọc thuộc tính.

### HTML

```html
<canvas id="canvas" width="700" height="220"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.font = "20px serif";

// Default (auto)
ctx.fillText(`Hello world (default: ${ctx.textRendering})`, 5, 20);

// Text rendering: optimizeSpeed
ctx.textRendering = "optimizeSpeed";
ctx.fillText(`Hello world (${ctx.textRendering})`, 5, 50);

// Text rendering: optimizeLegibility
ctx.textRendering = "optimizeLegibility";
ctx.fillText(`Hello world (${ctx.textRendering})`, 5, 80);

// Text rendering: geometricPrecision
ctx.textRendering = "geometricPrecision";
ctx.fillText(`Hello world (${ctx.textRendering})`, 5, 110);
```

### Kết quả

{{ EmbedLiveSample('Examples', 700, 230) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
