---
title: "CanvasRenderingContext2D: thuộc tính fontStretch"
short-title: phông chữCăng
slug: Web/API/CanvasRenderingContext2D/fontStretch
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.fontStretch
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.fontStretch`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) chỉ định cách phông chữ có thể được mở rộng hoặc thu gọn khi vẽ văn bản.

Thuộc tính tương ứng với thuộc tính CSS {{cssxref("font-stretch")}} khi được sử dụng với từ khóa (giá trị phần trăm không được hỗ trợ).

## Giá trị

Giá trị kéo dài phông chữ dưới dạng một chuỗi. Đây là một trong:`ultra-condensed`,`extra-condensed`,`condensed`,`semi-condensed`,`normal`(mặc định),`semi-expanded`,`expanded`,`extra-expanded`,`ultra-expanded`.

Thuộc tính có thể được sử dụng để lấy hoặc đặt giá trị kéo dài phông chữ.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "Xin chào thế giới" bằng cách sử dụng từng giá trị được hỗ trợ của thuộc tính `fontStretch`. Giá trị kéo dài cũng được hiển thị cho từng trường hợp bằng cách đọc thuộc tính.

### HTML

```html
<canvas id="canvas" width="700" height="310"></canvas>
```

### JavaScript

Đầu tiên, chúng ta lấy canvas được khai báo trong tệp HTML và sử dụng nó để lấy `CanvasRenderingContext2D` mà sau này sẽ được sử dụng để vẽ văn bản.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
```

Bước tiếp theo trong ví dụ là tải một phông chữ có thể thay đổi theo trục chiều rộng. Điều này là cần thiết vì `fontStretch` chỉ có thể kéo dài phông chữ chứa thông tin về cách vẽ glyph khi kéo dài - nếu không, văn bản sẽ được vẽ bằng giá trị kéo dài phông chữ có sẵn gần nhất cho phông chữ, thường là chiều rộng bình thường.

Trong trường hợp này, chúng tôi sử dụng [`FontFace`](/en-US/docs/Web/API/FontFace) để xác định mặt phông chữ cho [Inconsolata](https://fonts.google.com/specimen/Inconsolata/tester) Google Font, hỗ trợ độ rộng phông chữ từ 50% đến 200% (cho phép chúng tôi thể hiện các giá trị`fontStretch`từ`ultra-condensed`đến`ultra-expanded`). Sau đó, chúng tôi thêm phần này vào [`FontFaceSet`](/en-US/docs/Web/API/FontFaceSet)([`document.fonts`](/en-US/docs/Web/API/Document/fonts)) của tài liệu để có thể sử dụng nó để vẽ.

```js
const fontFile = new FontFace(
  "Inconsolata",
  'url("https://fonts.gstatic.com/s/inconsolata/v31/QlddNThLqRwH-OJ1UHjlKENVzlm-WkL3GZQmAwPyya15.woff2") format("woff2")',
  { stretch: "50% 200%" },
);

document.fonts.add(fontFile);
```

Đoạn mã bên dưới gọi [`FontFaceSet.load()`](/en-US/docs/Web/API/FontFaceSet/load) để tìm nạp và tải Google Font. Lưu ý rằng lệnh gọi này đặt kích thước phông chữ cần thiết và trả về lời hứa sẽ được giải quyết khi phông chữ được tải.

Sau đó, chúng tôi chỉ định mặt phông chữ mà chúng tôi đã tải xuống cho ngữ cảnh và sử dụng ngữ cảnh để vẽ văn bản vào khung vẽ ở mỗi cấp độ kéo dài của từ khóa. Lưu ý rằng một lần nữa kích thước của phông chữ mong muốn được chỉ định (điều này không nhất thiết phải khớp với kích thước phông chữ được tải).

```js
document.fonts.load("30px Inconsolata").then(
  () => {
    ctx.font = "30px 'Inconsolata'";
    // Default (normal)
    ctx.fillText(`Hello world (default: ${ctx.fontStretch})`, 5, 20);

    ctx.fontStretch = "ultra-condensed";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 50);

    ctx.fontStretch = "extra-condensed";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 80);

    ctx.fontStretch = "condensed";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 110);

    ctx.fontStretch = "semi-condensed";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 140);

    ctx.fontStretch = "extra-condensed";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 170);

    ctx.fontStretch = "semi-expanded";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 200);

    ctx.fontStretch = "expanded";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 230);

    ctx.fontStretch = "extra-expanded";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 260);

    ctx.fontStretch = "ultra-expanded";
    ctx.fillText(`Hello world (${ctx.fontStretch})`, 5, 290);
  },
  (err) => {
    console.error(err);
  },
);
```

### Kết quả

{{ EmbedLiveSample('Examples', 700, 300) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
