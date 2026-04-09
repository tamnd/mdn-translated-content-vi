---
title: "CanvasRenderingContext2D: phương thức getContextAttribut()"
short-title: getContextAttribut()
slug: Web/API/CanvasRenderingContext2D/getContextAttributes
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.getContextAttributes
---

{{APIRef("WebGL")}}

Phương thức **`CanvasRenderingContext2D.getContextAttributes()`** trả về một đối tượng chứa các thuộc tính được ngữ cảnh sử dụng.

Lưu ý rằng các thuộc tính ngữ cảnh có thể được yêu cầu khi tạo ngữ cảnh với [`HTMLCanvasElement.getContext()`](/en-US/docs/Web/API/HTMLCanvasElement/getContext), nhưng các thuộc tính được hỗ trợ và sử dụng thực sự có thể khác nhau.

## Cú pháp

```js-nolint
getContextAttributes()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng `CanvasRenderingContext2DSettings` chứa các tham số ngữ cảnh thực tế. Nó có các thành viên sau:

- `alpha`{{optional_inline}}
- : Boolean cho biết canvas có chứa kênh alpha hay không.
  Nếu `false`, phông nền luôn mờ đục, điều này có thể tăng tốc độ vẽ nội dung và hình ảnh trong suốt.
- `colorSpace`{{optional_inline}}
- : Cho biết không gian màu của bối cảnh hiển thị. Các giá trị có thể là: -`srgb`: biểu thị [sRGB color space](https://en.wikipedia.org/wiki/SRGB)-`display-p3`: biểu thị [display-p3 color space](https://en.wikipedia.org/wiki/DCI-P3)
- `colorType`{{optional_inline}}
- : Cho biết loại màu của bối cảnh hiển thị. Các giá trị có thể là: -`"unorm8"`biểu thị các kênh màu thành các giá trị không dấu 8 bit. Đây là giá trị mặc định. -`"float16"` biểu thị các kênh màu thành các giá trị dấu phẩy động 16-bit.
- `desynchronized`{{optional_inline}}
- : Boolean chỉ ra tác nhân người dùng đã giảm độ trễ bằng cách giải đồng bộ hóa chu trình vẽ canvas khỏi vòng lặp sự kiện.
- `willReadFrequently`{{optional_inline}}
- : Boolean cho biết canvas này có sử dụng khả năng tăng tốc phần mềm (thay vì tăng tốc phần cứng) để hỗ trợ các hoạt động đọc lại thường xuyên thông qua {{domxref("CanvasRenderingContext2D.getImageData", "getImageData()")}} hay không.

## Ví dụ

Ví dụ này cho thấy cách bạn có thể chỉ định các thuộc tính ngữ cảnh khi tạo ngữ cảnh canvas, sau đó gọi `getContextAttributes()` để đọc lại các tham số thực tế mà trình duyệt đã sử dụng.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += text;
}
```

Đầu tiên chúng ta tạo ngữ cảnh bằng cách sử dụng [`HTMLCanvasElement.getContext()`](/en-US/docs/Web/API/HTMLCanvasElement/getContext), chỉ xác định một thuộc tính ngữ cảnh.

```js
let canvas = document.createElement("canvas");
let ctx = canvas.getContext("2d", { alpha: false });
```

Nếu phương thức `getContextAttributes()` được hỗ trợ, chúng tôi sẽ sử dụng nó để đọc lại các thuộc tính thực tế được trình duyệt sử dụng (bao gồm cả những thuộc tính chúng tôi đã chỉ định rõ ràng):

```js
if (ctx.getContextAttributes) {
  const attributes = ctx.getContextAttributes();
  log(JSON.stringify(attributes));
} else {
  log("CanvasRenderingContext2D.getContextAttributes() is not supported");
}
```

Tùy thuộc vào các thuộc tính được trình duyệt hỗ trợ, nhật ký bên dưới sẽ hiển thị một chuỗi trông giống như:`{alpha: false, colorSpace: 'srgb', desynchronized: false, willReadFrequently: false}`

{{EmbedLiveSample('Examples','100%','50')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`HTMLCanvasElement.getContext()`](/en-US/docs/Web/API/HTMLCanvasElement/getContext)
- [`WebGLRenderingContext.getContextAttributes()`](/en-US/docs/Web/API/WebGLRenderingContext/getContextAttributes)
