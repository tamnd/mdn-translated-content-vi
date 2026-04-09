---
title: "CanvasRenderingContext2D: phương thức setTransform()"
short-title: setTransform()
slug: Web/API/CanvasRenderingContext2D/setTransform
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.setTransform
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.setTransform()`** của API Canvas 2D đặt lại (ghi đè) phép biến đổi hiện tại thành ma trận nhận dạng, sau đó gọi một phép biến đổi được mô tả bằng các đối số của phương thức này. Điều này cho phép bạn chia tỷ lệ, xoay, dịch (di chuyển) và nghiêng ngữ cảnh.

> [!LƯU Ý]
> Xem thêm phương pháp{{domxref("CanvasRenderingContext2D.transform()", "transform()")}}; thay vì ghi đè ma trận biến đổi hiện tại, nó
> nhân nó với một số đã cho.

## Cú pháp

```js-nolint
setTransform(a, b, c, d, e, f)
setTransform(matrix)
```

Ma trận chuyển đổi được mô tả bởi: <math><semantics><mrow><mo>[</mo><mtable columnsalign="center center center" rowpacing="0.5ex"><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd><mtd><mi>e</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd ><mtd><mi>f</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation Encoding="TeX">\left[ \begin{array}{ccc} a & c & e \\ b & d & f \\ 0 & 0 & 1 \end{array} \right]</annotation></semantics></math>.

Ma trận biến đổi này được nhân lên ở bên trái của vectơ cột biểu thị từng điểm được vẽ trên khung vẽ, để tạo ra tọa độ cuối cùng được sử dụng trên khung vẽ.

### Tham số

`setTransform()` chấp nhận hai loại tham số. Loại cũ hơn bao gồm một số tham số biểu thị các thành phần riêng lẻ của ma trận biến đổi cần đặt:

- `a` (`m11`)
  - : Ô ở hàng đầu tiên và cột đầu tiên của ma trận.
- `b` (`m12`)
  - : Ô ở hàng thứ hai và cột đầu tiên của ma trận.
- `c` (`m21`)
  - : Ô ở hàng đầu tiên và cột thứ hai của ma trận.
- `d` (`m22`)
  - : Ô ở hàng thứ hai và cột thứ hai của ma trận.
- `e` (`m41`)
  - : Ô ở hàng đầu tiên và cột thứ ba của ma trận.
- `f` (`m42`)
  - : Ô ở hàng thứ hai và cột thứ ba của ma trận.

Ngoài ra, bạn có thể truyền một tham số duy nhất là một đối tượng chứa các giá trị ở trên làm thuộc tính. Tên tham số là các khóa thuộc tính và nếu cả hai tên đồng nghĩa đều xuất hiện, ví dụ `m11` và `a`, thì chúng phải có cùng giá trị số; nếu không, {{jsxref("TypeError")}} sẽ bị ném ra. Dạng đối tượng cho phép bỏ qua một số tham số: `a` và `d` mặc định là `1`, còn các tham số khác mặc định là `0`.

Nếu một điểm ban đầu có tọa độ `(x, y)`, thì sau khi biến đổi nó sẽ có tọa độ `(ax + cy + e, bx + dy + f)`. Điều này có nghĩa là:

- `e` và `f` kiểm soát việc dịch theo chiều ngang và chiều dọc của ngữ cảnh.
- Khi `b` và `c` là `0`, `a` và `d` sẽ kiểm soát tỷ lệ theo chiều ngang và chiều dọc của ngữ cảnh.
- Khi `a` và `d` là `1`, `b` và `c` kiểm soát độ lệch ngang và dọc của ngữ cảnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Nghiêng một hình dạng

Ví dụ này nghiêng một hình chữ nhật theo cả chiều dọc (`.2`) và chiều ngang (`.8`). Tỷ lệ và dịch thuật không thay đổi.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.setTransform(1, 0.2, 0.8, 1, 0, 0);
ctx.fillRect(0, 0, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Skewing_a_shape', 700, 180) }}

### Truy xuất và truyền đối tượng DOMMatrix

Trong ví dụ sau, chúng ta có hai phần tử{{htmlelement("canvas")}}. Chúng tôi áp dụng một phép biến đổi cho ngữ cảnh của bối cảnh đầu tiên bằng cách sử dụng loại`setTransform()`đầu tiên và vẽ một hình vuông trên đó, sau đó truy xuất ma trận từ nó bằng cách sử dụng{{domxref("CanvasRenderingContext2D.getTransform()")}}.

Sau đó, chúng tôi áp dụng trực tiếp ma trận được truy xuất vào ngữ cảnh canvas thứ hai bằng cách chuyển trực tiếp đối tượng`DOMMatrix`đến`setTransform()`(tức là loại thứ hai) và vẽ một vòng tròn trên đó.

#### HTML

```html
<!-- First canvas (ctx1) -->
<canvas width="240"></canvas>
<!-- Second canvas (ctx2) -->
<canvas width="240"></canvas>
```

#### CSS

```css
canvas {
  border: 1px solid black;
}
```

#### JavaScript

```js
const canvases = document.querySelectorAll("canvas");
const ctx1 = canvases[0].getContext("2d");
const ctx2 = canvases[1].getContext("2d");

ctx1.setTransform(1, 0.2, 0.8, 1, 0, 0);
ctx1.fillRect(25, 25, 50, 50);

let storedTransform = ctx1.getTransform();
console.log(storedTransform);

ctx2.setTransform(storedTransform);
ctx2.beginPath();
ctx2.arc(50, 50, 50, 0, 2 * Math.PI);
ctx2.fill();
```

#### Kết quả

{{ EmbedLiveSample('Retrieving_and_passing_a_DOMMatrix_object', "100%", 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.transform()")}}
