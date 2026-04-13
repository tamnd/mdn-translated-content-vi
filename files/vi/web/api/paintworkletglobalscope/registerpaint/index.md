---
title: "PaintWorkletGlobalScope: phương thức registerPaint()"
short-title: registerPaint()
slug: Web/API/PaintWorkletGlobalScope/registerPaint
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PaintWorkletGlobalScope.registerPaint
---

{{APIRef("CSS Painting API")}}{{SeeCompatTable}}

Phương thức **`registerPaint()`** của giao diện {{domxref("PaintWorkletGlobalScope")}} đăng ký một lớp để tạo ảnh lập trình nơi một thuộc tính CSS mong đợi một tệp.

## Cú pháp

```js-nolint
registerPaint(name, classRef)
```

### Tham số

- `name`
  - : Tên của lớp worklet cần đăng ký.
- `classRef`
  - : Một tham chiếu đến lớp triển khai worklet.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném khi một trong các đối số không hợp lệ hoặc bị thiếu.
- `InvalidModificationError` {{domxref("DOMException")}}
  - : Được ném khi một worklet đã tồn tại với tên được chỉ định.

## Ví dụ

```js
/* checkboardWorklet.js */

class CheckerboardPainter {
  paint(ctx, geom, properties) {
    const colors = ["red", "green", "blue"];
    const size = 32;
    for (let y = 0; y < geom.height / size; y++) {
      for (let x = 0; x < geom.width / size; x++) {
        const color = colors[(x + y) % colors.length];
        ctx.beginPath();
        ctx.fillStyle = color;
        ctx.rect(x * size, y * size, size, size);
        ctx.fill();
      }
    }
  }
}

// Đăng ký lớp của chúng ta dưới một tên cụ thể
registerPaint("checkerboard", CheckerboardPainter);
```

```js
CSS.paintWorklet.addModule("checkboardWorklet.js");
```

```css
li {
  background-image: paint(checkerboard);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
