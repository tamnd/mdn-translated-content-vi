---
title: "WebGLActiveInfo: thuộc tính size"
short-title: size
slug: Web/API/WebGLActiveInfo/size
page-type: web-api-instance-property
browser-compat: api.WebGLActiveInfo.size
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLActiveInfo.size`** là một {{jsxref("Number")}} đại diện cho kích thước của dữ liệu được yêu cầu được trả về bởi lệnh gọi các phương thức {{domxref("WebGLRenderingContext.getActiveAttrib()", "getActiveAttrib()")}} hoặc {{domxref("WebGLRenderingContext.getActiveUniform()", "getActiveUniform()")}}.

## Ví dụ

```js
const activeAttrib = gl.getActiveAttrib(program, index);
activeAttrib.size;

const activeUniform = gl.getActiveUniform(program, index);
activeUniform.size;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLActiveInfo")}}
