---
title: "CanvasRenderingContext2D: thuộc tính fontVariantCaps"
short-title: phông chữBiến thểCaps
slug: Web/API/CanvasRenderingContext2D/fontVariantCaps
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.fontVariantCaps
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.fontVariantCaps`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) chỉ định cách viết hoa thay thế của văn bản được hiển thị.

Điều này tương ứng với thuộc tính CSS {{cssxref("font-variant-caps")}}.

## Giá trị

Giá trị viết hoa thay thế phông chữ, là một trong:

- `normal`(mặc định)
- : Vô hiệu hóa việc sử dụng glyphs thay thế.
- `small-caps`
- : Cho phép hiển thị chữ hoa nhỏ (tính năng OpenType:`smcp`).
  Các ký tự viết hoa nhỏ thường sử dụng dạng chữ hoa nhưng được giảm kích thước thành chữ thường.
- `all-small-caps`
- : Cho phép hiển thị chữ hoa nhỏ cho cả chữ hoa và chữ thường (tính năng OpenType:`c2sc`,`smcp`).
- `petite-caps`
- : Cho phép hiển thị các chữ viết hoa nhỏ (tính năng OpenType:`pcap`).
- `all-petite-caps`
- : Cho phép hiển thị chữ in hoa nhỏ cho cả chữ hoa và chữ thường (các tính năng của OpenType:`c2pc`,`pcap`).
- `unicase`
- : Cho phép hiển thị hỗn hợp chữ hoa nhỏ với chữ thường (tính năng OpenType:`unic`).
- `titling-caps`
- : Cho phép hiển thị chữ hoa tiêu đề (tính năng OpenType:`titl`).
  Các ký tự viết hoa thường được thiết kế để sử dụng với các chữ cái viết thường. Khi được sử dụng trong tất cả các chuỗi tiêu đề viết hoa, chúng có thể trông quá mạnh. Viết hoa tiêu đề được thiết kế đặc biệt cho tình huống này.

Thuộc tính có thể được sử dụng để lấy hoặc đặt giá trị viết hoa phông chữ.

Lưu ý rằng có những lo ngại về khả năng truy cập đối với một số vấn đề này, được nêu trong chủ đề [`font-variant-caps`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-caps#accessibility) tương ứng.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "Xin chào thế giới" bằng cách sử dụng từng giá trị được hỗ trợ của thuộc tính `fontVariantCaps`. Giá trị cũng được hiển thị cho từng trường hợp bằng cách đọc thuộc tính.

### HTML

```html
<canvas id="canvas" width="700" height="220"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.font = "20px serif";

// Default (normal)
ctx.fillText(`Hello world (default: ${ctx.fontVariantCaps})`, 5, 20);

// Capitalization: small-caps
ctx.fontVariantCaps = "small-caps";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 50);

// Capitalization: all-small-caps
ctx.fontVariantCaps = "all-small-caps";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 80);

// Capitalization: petite-caps
ctx.fontVariantCaps = "petite-caps";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 110);

// Capitalization: all-petite-caps
ctx.fontVariantCaps = "all-petite-caps";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 140);

// Capitalization: unicase
ctx.fontVariantCaps = "unicase";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 170);

// Capitalization: titling-caps
ctx.fontVariantCaps = "titling-caps";
ctx.fillText(`Hello world (${ctx.fontVariantCaps})`, 5, 200);
```

### Kết quả

{{ EmbedLiveSample('Examples', 700, 230) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
