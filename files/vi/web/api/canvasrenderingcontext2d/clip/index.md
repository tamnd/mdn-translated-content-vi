---
title: "CanvasRenderingContext2D: phương thức clip()"
short-title: clip()
slug: Web/API/CanvasRenderingContext2D/clip
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.clip
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.clip()`** của API Canvas 2D biến đường dẫn hiện tại hoặc đường dẫn đã cho thành phần cắt hiện tại
khu vực. Vùng cắt trước đó, nếu có, được giao với vùng hiện tại hoặc đã cho
đường dẫn để tạo vùng cắt mới.

Trong hình ảnh bên dưới, đường viền màu đỏ tượng trưng cho vùng cắt có hình dạng giống như một ngôi sao.
Chỉ những phần của mẫu bàn cờ nằm trong vùng cắt mới được
được vẽ.

! [Star-shaped clipping region](canvas_clipping_path.png)

> [!LƯU Ý]
> Hãy lưu ý rằng vùng cắt chỉ được xây dựng từ
> các hình dạng được thêm vào đường dẫn. Nó không hoạt động với các hình dạng nguyên thủy được vẽ trực tiếp vào
> canvas, chẳng hạn như {{domxref("CanvasRenderingContext2D.fillRect()","fillRect()")}}.
> Thay vào đó, bạn phải sử dụng {{domxref("CanvasRenderingContext2D.rect()","rect()")}} để
> thêm một hình chữ nhật vào đường path trước khi gọi `clip()`.

> [!LƯU Ý]
> Đường dẫn clip không thể được hoàn nguyên trực tiếp. Bạn phải lưu trạng thái canvas của mình bằng {{domxref("CanvasRenderingContext2D/save", "save()")}} trước khi gọi `clip()` và khôi phục nó sau khi bạn vẽ xong vùng bị cắt bằng {{domxref("CanvasRenderingContext2D/restore", "restore()")}}.

## Cú pháp

```js-nolint
clip()
clip(path)
clip(fillRule)
clip(path, fillRule)
```

### Tham số

- `fillRule`
- : Thuật toán xác định xem một điểm nằm trong hay ngoài phần cắt
  khu vực. Các giá trị có thể:
- `nonzero`
- : [non-zero winding rule](https://en.wikipedia.org/wiki/Nonzero-rule).
  Quy tắc mặc định.
- `evenodd`
- : [even-odd winding rule](https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule).

- `path`
- : Đường dẫn {{domxref("Path2D")}} được sử dụng làm vùng cắt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Một vùng cắt đơn giản

Ví dụ này sử dụng phương thức `clip()` để tạo vùng cắt theo
thành hình cung tròn. Hai hình chữ nhật sau đó được vẽ; chỉ những phần bên trong
vùng cắt được hiển thị.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Vùng cắt là một hình tròn đầy đủ, có tâm ở (100, 75) và bán kính là 50.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create circular clipping region
ctx.beginPath();
ctx.arc(100, 75, 50, 0, Math.PI * 2);
ctx.clip();

// Draw stuff that gets clipped
ctx.fillStyle = "blue";
ctx.fillRect(0, 0, canvas.width, canvas.height);
ctx.fillStyle = "orange";
ctx.fillRect(0, 0, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('A_simple_clipping_region', 700, 180) }}

### Chỉ định đường dẫn và fillRule

Ví dụ này lưu hai hình chữ nhật vào đối tượng Path2D, sau đó tạo thành đối tượng hiện tại
cắt vùng bằng phương thức `clip()`. Quy tắc`"evenodd"`
tạo một lỗ nơi các hình chữ nhật cắt giao nhau; theo mặc định (với
quy tắc `"nonzero"`), sẽ không có lỗ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create clipping path
let region = new Path2D();
region.rect(80, 10, 20, 130);
region.rect(40, 50, 100, 50);
ctx.clip(region, "evenodd");

// Draw stuff that gets clipped
ctx.fillStyle = "blue";
ctx.fillRect(0, 0, canvas.width, canvas.height);
```

#### Kết quả

{{ EmbedLiveSample('Specifying_a_path_and_a_fillRule', 700, 180) }}

### Tạo vùng cắt phức tạpVí dụ này sử dụng hai đường dẫn, hình tròn và hình vuông để tạo một phần cắt phức tạp

khu vực. Phương thức `clip()` được gọi hai lần, lần đầu tiên để thiết lập dòng điện
cắt vùng vào vòng tròn bằng cách sử dụng đối tượng `Path2D`, sau đó lại cắt
giao vùng cắt hình tròn với một hình vuông. Vùng cắt cuối cùng là một hình dạng
biểu thị giao điểm của hình tròn và hình vuông.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create two clipping paths
let circlePath = new Path2D();
circlePath.arc(150, 75, 75, 0, 2 * Math.PI);
let squarePath = new Path2D();
squarePath.rect(85, 10, 130, 130);

// Set the clip to the circle
ctx.clip(circlePath);
// Set the clip to be the intersection of the circle and the square
ctx.clip(squarePath);

// Draw stuff that gets clipped
ctx.fillStyle = "blue";
ctx.fillRect(0, 0, canvas.width, canvas.height);
```

#### Kết quả

{{ EmbedLiveSample('Creating_a_complex_clipping_region', 300, 150) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
