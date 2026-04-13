---
title: "WebGLContextEvent: thuộc tính statusMessage"
short-title: statusMessage
slug: Web/API/WebGLContextEvent/statusMessage
page-type: web-api-instance-property
browser-compat: api.WebGLContextEvent.statusMessage
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLContextEvent.statusMessage`** chứa thông tin trạng thái sự kiện bổ sung, hoặc là một chuỗi rỗng nếu không có thông tin bổ sung nào.

## Ví dụ

Thuộc tính `statusMessage` có thể chứa một chuỗi phụ thuộc nền tảng với chi tiết về một sự kiện. Điều này có thể xảy ra, ví dụ, nếu sự kiện {{domxref("HTMLCanvasElement/webglcontextcreationerror_event", "webglcontextcreationerror")}} được kích hoạt.

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

canvas.addEventListener("webglcontextcreationerror", (e) => {
  console.log(
    `WebGL context creation failed: ${e.statusMessage || "Unknown error"}`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [webglcontextcreationerror](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextcreationerror_event)
