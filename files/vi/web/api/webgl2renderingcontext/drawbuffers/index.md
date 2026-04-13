---
title: "WebGL2RenderingContext: phương thức drawBuffers()"
short-title: drawBuffers()
slug: Web/API/WebGL2RenderingContext/drawBuffers
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.drawBuffers
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.drawBuffers()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xác định các bộ đệm vẽ mà màu fragment được ghi vào. Các cài đặt bộ đệm vẽ là một phần của trạng thái của framebuffer hiện đang được liên kết hoặc bộ đệm vẽ nếu không có framebuffer nào được liên kết.

## Cú pháp

```js-nolint
drawBuffers(buffers)
```

### Tham số

- `buffers`
  - : Một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLenum")}} chỉ định các bộ đệm mà màu fragment sẽ được ghi vào. Các giá trị có thể:
    - `gl.NONE`
      - : Đầu ra fragment shader không được ghi vào bất kỳ bộ đệm màu nào.
    - `gl.BACK`
      - : Đầu ra fragment shader được ghi vào bộ đệm màu phía sau.
    - `gl.COLOR_ATTACHMENT{0-15}`
      - : Đầu ra fragment shader được ghi vào bộ đệm màu thứ n của framebuffer hiện tại.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buffers` chứa không phải một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` được ném.

## Ví dụ

```js
gl.drawBuffers([gl.NONE, gl.COLOR_ATTACHMENT1]);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.clearBuffer", "WebGL2RenderingContext.clearBuffer[fiuv]()")}}