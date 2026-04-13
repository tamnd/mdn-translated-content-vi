---
title: PaintWorkletGlobalScope
slug: Web/API/PaintWorkletGlobalScope
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PaintWorkletGlobalScope
---

{{APIRef("CSS Painting API")}}{{SeeCompatTable}}

Giao diện **`PaintWorkletGlobalScope`** của [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API) đại diện cho đối tượng toàn cục có sẵn bên trong một paint {{domxref("Worklet")}}.

## Mối lo ngại về quyền riêng tư

Để tránh rò rỉ các liên kết đã truy cập, tính năng này hiện đang bị vô hiệu hóa trong các trình duyệt dựa trên Chrome đối với các phần tử {{HTMLElement("a")}} với thuộc tính `href`, và cho các phần tử con của các phần tử như vậy.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ {{domxref('WorkletGlobalScope')}}._

- {{domxref('PaintWorkletGlobalScope.devicePixelRatio')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tỷ lệ giữa pixel vật lý và pixel logic của thiết bị hiện tại.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ {{domxref('WorkletGlobalScope')}}._

- {{domxref('PaintWorkletGlobalScope.registerPaint()')}} {{Experimental_Inline}}
  - : Đăng ký một lớp để tạo ảnh lập trình nơi một thuộc tính CSS mong đợi một tệp.

## Ví dụ

### Tạo paint worklet

Ví dụ sau đây cho thấy một module worklet mẫu. `registerPaint()` được gọi mà không có tham chiếu đến paint `Worklet`.

```js
class CheckerboardPainter {
  paint(ctx, geom, properties) {
    // Đối tượng toàn cục ở đây là PaintWorkletGlobalScope
    const dpr = self.devicePixelRatio;

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

### Tải paint worklet

```js
if ("paintWorklet" in CSS) {
  CSS.paintWorklet.addModule("checkerboard.js");
}
```

### Sử dụng paint worklet

```css
textarea {
  background-image: url("checkerboard.png"); /* Fallback */
  background-image: paint(checkerboard);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
