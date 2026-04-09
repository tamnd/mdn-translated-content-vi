---
title: "CanvasRenderingContext2D: phương thức StrokeText()"
short-title: nét văn bản()
slug: Web/API/CanvasRenderingContext2D/strokeText
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.strokeText
---

{{APIRef("Canvas API")}}

Phương thức{{domxref("CanvasRenderingContext2D")}}**`strokeText()`**, một phần của API Canvas 2D, các nét — nghĩa là vẽ đường viền của — các ký tự của chuỗi văn bản tại tọa độ đã chỉ định. Tham số tùy chọn cho phép chỉ định chiều rộng tối đa cho văn bản được hiển thị mà{{Glossary("user agent")}}sẽ đạt được bằng cách thu gọn văn bản hoặc bằng cách sử dụng cỡ chữ thấp hơn.

Phương thức này vẽ trực tiếp vào khung vẽ mà không sửa đổi đường dẫn hiện tại, do đó, mọi lệnh gọi{{domxref("CanvasRenderingContext2D.fill()", "fill()")}}hoặc{{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}}tiếp theo sẽ không ảnh hưởng đến nó.

> [!LƯU Ý]
> Sử dụng phương pháp{{domxref('CanvasRenderingContext2D.fillText()', 'fillText()')}}để
> điền vào các ký tự văn bản thay vì chỉ vẽ đường viền của chúng.

## Cú pháp

```js-nolint
strokeText(text, x, y)
strokeText(text, x, y, maxWidth)
```

### Tham số

- `text`
  - : Một chuỗi chỉ định chuỗi văn bản sẽ hiển thị trong ngữ cảnh.
    Văn bản được hiển thị bằng cách sử dụng cài đặt được chỉ định bởi{{domxref("CanvasRenderingContext2D.font","font")}},{{domxref("CanvasRenderingContext2D.textAlign","textAlign")}},{{domxref("CanvasRenderingContext2D.textBaseline","textBaseline")}}và{{domxref("CanvasRenderingContext2D.direction","direction")}}.
- `x`
  - : Tọa độ trục x của điểm bắt đầu vẽ văn bản.
- `y`
  - : Tọa độ trục y của điểm bắt đầu vẽ văn bản.
- `maxWidth`{{optional_inline}}
  - : Chiều rộng tối đa mà văn bản có thể được hiển thị một lần. Nếu không được chỉ định thì không có giới hạn
    theo chiều rộng của văn bản. Tuy nhiên, nếu giá trị này được cung cấp, tác nhân người dùng sẽ điều chỉnh độ sâu, chọn phông chữ cô đọng theo chiều ngang hơn (nếu có sẵn hoặc có thể được tạo mà không làm giảm chất lượng) hoặc thu nhỏ kích thước phông chữ nhỏ hơn để vừa với văn bản theo chiều rộng đã chỉ định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Vẽ phác thảo văn bản

Ví dụ này viết từ "Xin chào thế giới" bằng phương thức`strokeText()`.

#### HTML

Đầu tiên, chúng ta cần một canvas để vẽ vào. Mã này tạo bối cảnh rộng 400 pixel và cao 150 pixel.

```html
<canvas id="canvas" width="400" height="150"></canvas>
```

#### JavaScript

Mã JavaScript cho ví dụ này như sau.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "50px serif";
ctx.strokeText("Hello world", 50, 90);
```

Mã này lấy tham chiếu đến{{HTMLElement("canvas")}}, sau đó lấy tham chiếu đến bối cảnh đồ họa 2D của nó.

Với điều đó, chúng tôi đặt "serif"{{domxref("CanvasRenderingContext2D.font", "font")}}thành 50 pixel (phông chữ[serif](https://en.wikipedia.org/wiki/Serif)mặc định của người dùng), sau đó gọi`strokeText()`để vẽ văn bản "Xin chào thế giới", bắt đầu từ tọa độ (50, 90).

#### Kết quả

{{ EmbedLiveSample('Drawing_text_outlines', 700, 180) }}

### Hạn chế kích thước văn bản

Ví dụ này viết dòng chữ "Xin chào thế giới", giới hạn chiều rộng của nó ở mức 140 pixel.

#### HTML

```html
<canvas id="canvas" width="400" height="150"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "50px serif";
ctx.strokeText("Hello world", 50, 90, 140);
```

#### Kết quả

{{ EmbedLiveSample('Restricting_the_text_size', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Drawing text](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_text)
- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.fillText()")}}
