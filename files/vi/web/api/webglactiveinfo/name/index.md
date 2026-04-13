---
title: "WebGLActiveInfo: thuộc tính name"
short-title: name
slug: Web/API/WebGLActiveInfo/name
page-type: web-api-instance-property
browser-compat: api.WebGLActiveInfo.name
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLActiveInfo.name`** đại diện cho tên của dữ liệu được yêu cầu được trả về bởi lệnh gọi các phương thức {{domxref("WebGLRenderingContext.getActiveAttrib()", "getActiveAttrib()")}} hoặc {{domxref("WebGLRenderingContext.getActiveUniform()", "getActiveUniform()")}}.

## Ví dụ

```js
const activeAttrib = gl.getActiveAttrib(program, index);
activeAttrib.name;

const activeUniform = gl.getActiveUniform(program, index);
activeUniform.name;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLActiveInfo")}}
