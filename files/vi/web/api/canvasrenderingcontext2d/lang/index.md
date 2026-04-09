---
title: "CanvasRenderingContext2D: thuộc tính lang"
short-title: lang
slug: Web/API/CanvasRenderingContext2D/lang
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CanvasRenderingContext2D.lang
---

{{APIRef("Canvas API")}}{{SeeCompatTable}}

Thuộc tính **`CanvasRenderingContext2D.lang`** của API Canvas 2D nhận hoặc đặt ngôn ngữ của ngữ cảnh vẽ canvas.

## Giá trị

Thuộc tính `lang` có thể nhận một trong các giá trị chuỗi sau:

- {{glossary("BCP 47 language tag")}} thể hiện ngôn ngữ của ngữ cảnh canvas.
- Chuỗi `inherit`, trong trường hợp này, ngôn ngữ được kế thừa từ thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của phần tử {{HTMLElement("canvas")}} gốc hoặc tổ tiên có sẵn gần nhất với bộ`lang` rõ ràng.
- Một chuỗi trống (`""`), có thể được đặt để chỉ định rằng bối cảnh canvas không có ngôn ngữ.

Giá trị mặc định là `inherit`.

## Sự miêu tả

Đôi khi, bạn cần đặt ngôn ngữ cho ngữ cảnh hiển thị canvas để nó biết cách hiển thị các tính năng phụ thuộc vào ngôn ngữ: ví dụ: một số phông chữ có một số ký tự nhất định được hiển thị khác nhau ở các ngôn ngữ khác nhau. Ngữ cảnh canvas trên màn hình (`CanvasRenderingContext2D`) luôn được liên kết với một phần tử`<canvas>`cụ thể, vì vậy bất cứ khi nào bạn kết xuất nội dung bằng cách sử dụng nó, nó có thể lấy ngôn ngữ từ giá trị thuộc tính`lang`của phần tử`<canvas>`.

Tuy nhiên, ngữ cảnh canvas ngoài màn hình ({{domxref("OffscreenCanvasRenderingContext2D")}}) hiển thị nội dung của nó trước khi được liên kết với phần tử `<canvas>`, do đó, nó không thể lấy được ngôn ngữ hiển thị từ thuộc tính`lang`của phần tử`<canvas>`. Thuộc tính`lang` giải quyết vấn đề này, cho phép bạn đặt ngôn ngữ trực tiếp trên bối cảnh hiển thị canvas, cho dù bạn đang sử dụng canvas trên màn hình hay ngoài màn hình.

### Giá trị `inherit`

Khi giá trị `inherit`được sử dụng, ngôn ngữ của ngữ cảnh canvas được kế thừa từ thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của nguồn HTML có sẵn gần nhất:

- Trong trường hợp ngữ cảnh trên màn hình hoặc ngữ cảnh ngoài màn hình được chuyển từ ngữ cảnh trên màn hình, đây sẽ là phần tử {{HTMLElement("canvas")}} gốc, miễn là nó có bộ thuộc tính `lang` hợp lệ.
- Nếu thuộc tính `lang`không có sẵn trên phần tử`<canvas>`được liên kết, điều này có thể xảy ra đối với bối cảnh trên hoặc ngoài màn hình, thì đây sẽ là thuộc tính gốc gần nhất có sẵn với bộ`lang` rõ ràng, thường là gốc tài liệu.

Do những hạn chế về mặt kỹ thuật, giá trị `inherit` hoạt động khác nhau đối với canvas trên màn hình và ngoài màn hình:

- Đối với canvas trên màn hình, giá trị `lang`được kế thừa khi đối tượng`CanvasRenderingContext2D`liên kết được tạo lần đầu tiên; giá trị`lang`được kế thừa sau đó sẽ thay đổi linh hoạt nếu giá trị thuộc tính`lang` được cập nhật.
- Đối với canvas ngoài màn hình, giá trị `lang`được kế thừa khi đối tượng`OffscreenCanvasRenderingContext2D`liên kết được tạo lần đầu tiên và sau đó được cố định trong suốt thời gian tồn tại của {{domxref("OffscreenCanvas")}}. Nó **không** thay đổi nếu giá trị thuộc tính`lang`được cập nhật. Do đó, chỉ có thể thay đổi ngôn ngữ của canvas ngoài màn hình bằng cách đặt rõ ràng giá trị`lang`.

## Ví dụ

### Cách sử dụng cơ bản

```js
const canvasElem = document.querySelector("canvas");
const ctx = canvasElem.getContext("2d");

// Get context language; returns "inherit" by default
console.log(ctx.lang);

// Set context language
ctx.lang = "en";
// Logs "en"
console.log(ctx.lang);
```

### Trình diễn hỗ trợ bản địa hóa ngữ cảnh canvas

Trong ví dụ này, chúng tôi kết xuất chuỗi văn bản thành ngữ cảnh canvas 2D bằng một phông chữ cụ thể có chữ ghép phụ thuộc vào ngôn ngữ. Chúng tôi cho phép điều chỉnh ngôn ngữ của ngữ cảnh canvas để bạn có thể thấy sự khác biệt trong kết xuất.

#### HTML

HTML có phần tử {{htmlelement("select")}} cho phép bạn chọn ngôn ngữ —`en`(tiếng Anh) hoặc`tr`(tiếng Thổ Nhĩ Kỳ) — và phần tử {{htmlelement("canvas")}} để hiển thị.

```html live-example___canvas-l10n
<p>
  <label for="lang">Choose language:</label>
  <select id="lang" name="lang">
    <option>en</option>
    <option>tr</option>
  </select>
</p>
<canvas></canvas>
```

#### JavaScript

Trong JavaScript, trước tiên, chúng tôi lấy tham chiếu đến phần tử `<canvas>`, phần tử`CanvasRenderingContext2D`và phần tử`<select>`, sau đó tải phông chữ phụ thuộc vào ngôn ngữ bằng cách sử dụng [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API). Sau khi phông chữ được tải, chúng tôi sẽ chạy hàm`init()`. Hàm này xác định một hàm khác —`drawText()`, dùng để vẽ một số văn bản vào ngữ cảnh canvas sử dụng phông chữ đã tải, thêm [`change`](/en-US/docs/Web/API/HTMLElement/change_event) [event listener](/en-US/docs/Web/API/EventTarget/addEventListener) vào phần tử`<select>`, sau đó gọi`drawText()` để văn bản được vẽ ngay vào canvas khi trang tải lần đầu tiên.

```js live-example___canvas-l10n
const canvasElem = document.querySelector("canvas");
const ctx = canvasElem.getContext("2d");

const selectElem = document.querySelector("select");

const latoMediumFontFace = new FontFace(
  // Lato-Medium is a font with language specific ligatures
  "Lato-Medium",
  'url("https://mdn.github.io/shared-assets/fonts/Lato-Medium.ttf")',
);

latoMediumFontFace.load().then((font) => {
  document.fonts.add(font);
  init();
});

function init() {
  function drawText() {
    ctx.clearRect(0, 0, canvasElem.width, canvasElem.height);
    ctx.font = "30px Lato-Medium";
    ctx.color = "black";
    ctx.fillText("finish crafting", 50, 100);
  }

  selectElem.addEventListener("change", () => {
    document.documentElement.lang = selectElem.value;
    drawText();
  });

  drawText();
}
```

Khi giá trị `<select>`được thay đổi, hàm xử lý sự kiện`change` sẽ kích hoạt:

- Đặt giá trị thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của phần tử`<html>`thành giá trị phần tử`<select>`, thay đổi ngôn ngữ của tài liệu một cách hiệu quả.
- Chạy hàm `drawText()`. Thuộc tính`CanvasRenderingContext2D.lang`được đặt thành`inherit` theo mặc định, do đó ngữ cảnh canvas kế thừa ngôn ngữ của tài liệu.

#### Kết quả

Ví dụ được hiển thị như sau:

{{ EmbedLiveSample('canvas-l10n', "100%", 220) }}

Hãy thử thay đổi ngôn ngữ tài liệu bằng phần tử `<select>`. Khi ngôn ngữ được đặt thành tiếng Anh, phông chữ sẽ được hiển thị bằng chữ ghép "fi". Tuy nhiên, khi được đặt thành tiếng Thổ Nhĩ Kỳ, phông chữ sẽ được hiển thị mà không có chữ ghép "fi", vì ngôn ngữ đó không bao gồm nó.

### Hỗ trợ ngôn ngữ cho canvas ngoài màn hình

Ví dụ này tương tự như ví dụ trước, ngoại trừ phông chữ được hiển thị thành {{domxref("OffscreenCanvasRenderingContext2D")}} sau đó bitmap kết quả được chuyển sang `<canvas>` trên màn hình để hiển thị.

Ngoài ra, vì ngôn ngữ canvas ngoài màn hình được kế thừa chỉ được đặt một lần và không được cập nhật động nếu giá trị thuộc tính `lang`được kế thừa thay đổi, nên thay vào đó, chúng tôi đặt thuộc tính`lang`một cách rõ ràng trên`OffscreenCanvasRenderingContext2D`.

#### HTML

```html live-example___offscreen-l10n
<p>
  <label for="lang">Choose language:</label>
  <select id="lang" name="lang">
    <option>en</option>
    <option>tr</option>
  </select>
</p>
<canvas></canvas>
```

#### JavaScript

JavaScript hoạt động theo cách tương tự như ví dụ trước, ngoại trừ:

- Ngữ cảnh canvas trên màn hình được xác định là {{domxref("ImageBitmapRenderingContext")}}.
- Chúng tôi xác định `OffscreenCanvasRenderingContext2D`mới để vẽ văn bản lên, chuyển kết quả sang bitmap bằng cách sử dụng {{domxref("OffscreenCanvas.transferToImageBitmap", "transferToImageBitmap()")}}, sau đó hiển thị nó trên`<canvas>` bằng cách sử dụng {{domxref("ImageBitmapRenderingContext.transferFromImageBitmap", "transferFromImageBitmap()")}}.
- Khi giá trị `<select>`được thay đổi, chúng tôi cập nhật thuộc tính`lang`trực tiếp trên`OffscreenCanvasRenderingContext2D`thay vì thay đổi giá trị thuộc tính`<html>``lang`.

```js live-example___offscreen-l10n
const canvasElem = document.querySelector("canvas");
const ctx = canvasElem.getContext("bitmaprenderer");

const offscreen = new OffscreenCanvas(canvasElem.width, canvasElem.height);
const offscreenCtx = offscreen.getContext("2d");

const selectElem = document.querySelector("select");

const latoMediumFontFace = new FontFace(
  // Lato-Medium is a font with language specific ligatures.
  "Lato-Medium",
  'url("https://mdn.github.io/shared-assets/fonts/Lato-Medium.ttf")',
);

latoMediumFontFace.load().then((font) => {
  document.fonts.add(font);
  init();
});

function init() {
  function drawText() {
    offscreenCtx.clearRect(0, 0, canvasElem.width, canvasElem.height);
    offscreenCtx.lang = selectElem.value;
    offscreenCtx.font = "30px Lato-Medium";
    offscreenCtx.color = "black";
    offscreenCtx.fillText("finish crafting", 50, 100);

    const bitmap = offscreen.transferToImageBitmap();
    ctx.transferFromImageBitmap(bitmap);
  }

  selectElem.addEventListener("change", () => {
    drawText();
  });

  drawText();
}
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{ EmbedLiveSample('offscreen-l10n', "100%", 220) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D")}}
- [Canvas Localization Support](https://blogs.igalia.com/schenney/canvas-localization-support/) từ Igalia (2025)
