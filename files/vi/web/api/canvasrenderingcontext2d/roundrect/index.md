---
title: "CanvasRenderingContext2D: phương thức roundRect()"
short-title: vòngRect()
slug: Web/API/CanvasRenderingContext2D/roundRect
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.roundRect
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.roundRect()`** của API Canvas 2D thêm hình chữ nhật bo tròn vào đường dẫn hiện tại.

Bán kính của các góc có thể được chỉ định theo cách tương tự như thuộc tính CSS{{cssxref("border-radius")}}.

Giống như các phương thức khác sửa đổi đường dẫn hiện tại, phương thức này không trực tiếp hiển thị bất kỳ thứ gì. Để vẽ hình chữ nhật bo tròn lên canvas, bạn có thể sử dụng các phương thức{{domxref("CanvasRenderingContext2D.fill", "fill()")}}hoặc{{domxref("CanvasRenderingContext2D.stroke", "stroke()")}}.

## Cú pháp

```js-nolint
roundRect(x, y, width, height, radii)
```

### Tham số

- `x`
  - : Tọa độ trục x của điểm bắt đầu của hình chữ nhật, tính bằng pixel.
- `y`
  - : Tọa độ trục y của điểm bắt đầu của hình chữ nhật, tính bằng pixel.
- `width`
  - : Chiều rộng của hình chữ nhật. Giá trị dương ở bên phải và âm ở bên trái.
- `height`
  - : Chiều cao của hình chữ nhật. Giá trị dương giảm, giá trị âm tăng.
- `radii`
  - : Một số hoặc danh sách xác định bán kính của cung tròn được sử dụng cho các góc của hình chữ nhật.
    Số lượng và thứ tự của hàm bán kính giống như thuộc tính CSS{{cssxref("border-radius")}}khi`width`và`height`là _dương_: -`all-corners`-`[all-corners]`-`[top-left-and-bottom-right, top-right-and-bottom-left]`-`[top-left, top-right-and-bottom-left, bottom-right]`-`[top-left, top-right, bottom-right, bottom-left]`

Nếu`width`là _âm_ thì hình chữ nhật tròn được lật theo chiều ngang, do đó các giá trị bán kính thường áp dụng cho các góc bên trái sẽ được sử dụng ở bên phải và ngược lại. Tương tự, khi`height`âm, hình tròn được lật theo chiều dọc. Bán kính đã chỉ định có thể được chia tỷ lệ (giảm) nếu bất kỳ cạnh nào ngắn hơn bán kính tổng hợp của các đỉnh ở hai đầu.

Tham số`radii`cũng có thể là một phiên bản{{domxref("DOMPoint")}}hoặc{{domxref("DOMPointReadOnly")}}hoặc một đối tượng chứa cùng thuộc tính (`{x: 0, y: 0}`) hoặc danh sách các đối tượng như vậy hoặc danh sách trộn các số và các đối tượng như vậy.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Nếu`radii`là danh sách có 0 hoặc nhiều hơn 4 phần tử hoặc nếu một trong các giá trị của nó là số âm.

## Ví dụ

### Vẽ hình chữ nhật

Ví dụ này tạo một số đường dẫn hình chữ nhật được làm tròn bằng phương pháp`roundRect()`. Các đường dẫn sau đó được hiển thị bằng phương thức`stroke()`.

#### HTML

```html
<canvas id="canvas" width="700" height="300"></canvas>
```

#### JavaScript

Đầu tiên chúng ta tạo một bối cảnh để vẽ các hình chữ nhật bo tròn.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
```

Mã bên dưới vẽ hai hình chữ nhật, cả hai đều bắt đầu từ điểm (10, 20) và có chiều rộng là 150 và chiều cao là 100. Hình chữ nhật đầu tiên được vẽ bằng màu đỏ và chỉ định bán kính bằng 0 cho tất cả các góc bằng cách sử dụng một số làm đối số. Phần thứ hai được vẽ bằng màu xanh lam và chỉ định bán kính 40px làm một phần tử trong danh sách.

```js
// Rounded rectangle with zero radius (specified as a number)
ctx.strokeStyle = "red";
ctx.beginPath();
ctx.roundRect(10, 20, 150, 100, 0);
ctx.stroke();

// Rounded rectangle with 40px radius (single element list)
ctx.strokeStyle = "blue";
ctx.beginPath();
ctx.roundRect(10, 20, 150, 100, [40]);
ctx.stroke();
```

Bên dưới hình chữ nhật trước, chúng ta vẽ một hình chữ nhật khác màu cam chỉ định giá trị bán kính của các góc đối diện.

```js
// Rounded rectangle with 2 different radii
ctx.strokeStyle = "orange";
ctx.beginPath();
ctx.roundRect(10, 150, 150, 100, [10, 40]);
ctx.stroke();
```

Cuối cùng, chúng ta vẽ hai hình chữ nhật bo tròn có bốn giá trị bán kính và cùng điểm bắt đầu. Sự khác biệt ở đây là hình thứ hai được vẽ với chiều rộng âm.

```js
// Rounded rectangle with four different radii
ctx.strokeStyle = "green";
ctx.beginPath();
ctx.roundRect(400, 20, 200, 100, [0, 30, 50, 60]);
ctx.stroke();

// Same rectangle drawn backwards
ctx.strokeStyle = "magenta";
ctx.beginPath();
ctx.roundRect(400, 150, -200, 100, [0, 30, 50, 60]);
ctx.stroke();
```

#### Kết quả

Kết quả được hiển thị dưới đây. Đối với hai hình chữ nhật ở bên phải, hãy lưu ý cách vẽ hình chữ nhật phía dưới với chiều rộng âm và cách này lật hình chữ nhật theo chiều ngang.

{{ EmbedLiveSample('Drawing_a_rectangle', 700, 300) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.rect()")}}
- {{domxref("CanvasRenderingContext2D.fillRect")}}
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
- {{domxref("CanvasRenderingContext2D.fill()")}}
- {{domxref("CanvasRenderingContext2D.stroke()")}}
