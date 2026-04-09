---
title: "Path2D: bộ khởi tạo Path2D()"
short-title: Path2D()
slug: Web/API/Path2D/Path2D
page-type: web-api-constructor
browser-compat: api.Path2D.Path2D
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**Bộ khởi tạo `Path2D()`** trả về một đối tượng `Path2D` mới được khởi tạo, có thể tùy chọn nhận một đường dẫn khác làm đối số để tạo bản sao, hoặc nhận một chuỗi chứa dữ liệu [đường dẫn SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths).

## Cú pháp

```js-nolint
new Path2D()
new Path2D(path)
new Path2D(d)
```

### Tham số

- `path` {{optional_inline}}
  - : Khi được gọi với một đối tượng `Path2D` khác, một bản sao của đối số `path` sẽ được tạo ra.
- `d` {{optional_inline}}
  - : Khi được gọi với một chuỗi chứa dữ liệu [đường dẫn SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths), một đường dẫn mới sẽ được tạo từ mô tả đó.

## Ví dụ

### Tạo và sao chép đường dẫn

Ví dụ này tạo và sao chép một đường dẫn `Path2D`. Trước hết, `path1` là một đường dẫn hình chữ nhật. Sau đó, chúng ta sao chép `path1` sang `path2` và thêm một hình tròn vào đó. Cuối cùng, chúng ta dùng `stroke()` với `path2`, đối tượng này chứa cả hình chữ nhật lẫn hình tròn. Lưu ý rằng `path1` vẫn không đổi, dù chúng ta không vẽ nó lên canvas. Mục đích duy nhất của nó là cho thấy bạn có thể xây dựng một đường dẫn phức tạp dựa trên các đường dẫn có sẵn.

```html hidden
<canvas id="canvas"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const path1 = new Path2D();
path1.rect(10, 10, 100, 100);

const path2 = new Path2D(path1);
path2.moveTo(220, 60);
path2.arc(170, 60, 50, 0, 2 * Math.PI);

ctx.stroke(path2);
```

{{ EmbedLiveSample('Creating_and_copying_paths', 700, 180) }}

### Dùng đường dẫn SVG

Ví dụ này tạo một đường dẫn `Path2D` bằng cách dùng [dữ liệu đường dẫn SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths). Đường dẫn sẽ di chuyển đến điểm (`M10 10`), sau đó đi ngang 80 điểm sang phải (`h 80`), rồi đi xuống 80 điểm (`v 80`), tiếp theo đi sang trái 80 điểm (`h -80`), và cuối cùng quay lại điểm bắt đầu (`Z`).

```html hidden
<canvas id="canvas"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const p = new Path2D("M10 10 h 80 v 80 h -80 Z");
ctx.fill(p);
```

{{ EmbedLiveSample('Using_SVG_paths', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Path2D")}}, giao diện mà bộ khởi tạo này thuộc về
