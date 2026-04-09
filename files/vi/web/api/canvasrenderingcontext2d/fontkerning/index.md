---
title: "CanvasRenderingContext2D: thuộc tính fontKerning"
short-title: phông chữKerning
slug: Web/API/CanvasRenderingContext2D/fontKerning
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.fontKerning
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.fontKerning`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) chỉ định cách sử dụng thông tin về phông chữ.

Kerning điều chỉnh cách các chữ cái liền kề được đặt theo phông chữ tỷ lệ, cho phép chúng nằm sát khu vực thị giác của nhau nếu còn chỗ trống. Ví dụ: trong các phông chữ có độ chính xác cao, các ký tự `AV`,`Ta`và`We` lồng vào nhau và làm cho khoảng cách giữa các ký tự trở nên thống nhất và dễ đọc hơn so với văn bản tương đương không có độ sâu.

Thuộc tính tương ứng với thuộc tính CSS {{cssxref("font-kerning")}}.

## Giá trị

Thuộc tính có thể được sử dụng để lấy hoặc đặt giá trị.

Các giá trị được phép là:

- `auto`
- : Trình duyệt xác định có nên sử dụng font kerning hay không.
  Ví dụ: một số trình duyệt sẽ tắt tính năng kerning trên các phông chữ nhỏ vì việc áp dụng tính năng này có thể gây hại cho khả năng đọc của văn bản.
- `normal`
- : Thông tin về phông chữ được lưu trữ trong phông chữ phải được áp dụng.
- `none`
- : Thông tin về phông chữ được lưu trữ trong phông chữ bị tắt.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "AVA Ta We" bằng cách sử dụng từng giá trị được hỗ trợ của thuộc tính `textRendering`.

### HTML

```html
<canvas id="canvas" width="700" height="140"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.font = "30px serif";

// Default (auto)
ctx.fillText(`AVA Ta We (default: ${ctx.fontKerning})`, 5, 30);

// Font kerning: normal
ctx.fontKerning = "normal";
ctx.fillText(`AVA Ta We (${ctx.fontKerning})`, 5, 70);

// Font kerning: none
ctx.fontKerning = "none";
ctx.fillText(`AVA Ta We (${ctx.fontKerning})`, 5, 110);
```

### Kết quả

Lưu ý rằng chuỗi cuối cùng đã tắt tính năng kerning phông chữ, do đó các ký tự liền kề sẽ được trải đều.

{{ EmbedLiveSample('Examples', 700, 150) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
