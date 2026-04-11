---
title: "WebGLRenderingContext: getContextAttributes() method"
short-title: getContextAttributes()
slug: Web/API/WebGLRenderingContext/getContextAttributes
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getContextAttributes
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getContextAttributes()`** trả về một đối tượng `WebGLContextAttributes` chứa các tham số ngữ cảnh thực tế. Có thể trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), nếu ngữ cảnh bị mất.

## Cú pháp

```js-nolint
getContextAttributes()
```

### Thông số

Không có.

### Giá trị trả về

Một đối tượng `WebGLContextAttributes` chứa các tham số ngữ cảnh thực tế, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu ngữ cảnh bị mất.

## Ví dụ

Cho phần tử {{HTMLElement("canvas")}} này

```html
<canvas id="canvas"></canvas>
```

và đưa ra bối cảnh WebGL này

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.getContextAttributes();
```

phương thức `getContextAttributes` trả về một đối tượng mô tả các thuộc tính được đặt trong ngữ cảnh này, ví dụ:

```json
{
  "alpha": true,
  "antialias": true,
  "depth": true,
  "failIfMajorPerformanceCaveat": false,
  "powerPreference": "default",
  "premultipliedAlpha": true,
  "preserveDrawingBuffer": false,
  "stencil": false,
  "desynchronized": false
}
```

Các thuộc tính ngữ cảnh có thể được thiết lập khi tạo ngữ cảnh bằng phương thức {{domxref("HTMLCanvasElement.getContext()")}}:

```js
canvas.getContext("webgl", { antialias: false, depth: false });
```

Xem {{domxref("HTMLCanvasElement.getContext()", "getContext()")}} để biết thêm thông tin về các thuộc tính riêng lẻ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.getContext()")}}
- {{domxref("CanvasRenderingContext2D.getContextAttributes()")}}
