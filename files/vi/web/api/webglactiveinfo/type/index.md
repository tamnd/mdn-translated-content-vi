---
title: "WebGLActiveInfo: thuộc tính type"
short-title: type
slug: Web/API/WebGLActiveInfo/type
page-type: web-api-instance-property
browser-compat: api.WebGLActiveInfo.type
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLActiveInfo.type`** đại diện cho loại của dữ liệu được yêu cầu được trả về bởi lệnh gọi các phương thức {{domxref("WebGLRenderingContext.getActiveAttrib()", "getActiveAttrib()")}} hoặc {{domxref("WebGLRenderingContext.getActiveUniform()", "getActiveUniform()")}}.

## Ví dụ

```js
const activeAttrib = gl.getActiveAttrib(program, index);
activeAttrib.type;

const activeUniform = gl.getActiveUniform(program, index);
activeUniform.type;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLActiveInfo")}}
