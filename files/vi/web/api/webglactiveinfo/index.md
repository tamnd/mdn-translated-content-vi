---
title: WebGLActiveInfo
slug: Web/API/WebGLActiveInfo
page-type: web-api-interface
browser-compat: api.WebGLActiveInfo
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLActiveInfo** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho thông tin được trả về bởi lệnh gọi các phương thức {{domxref("WebGLRenderingContext.getActiveAttrib()")}} và {{domxref("WebGLRenderingContext.getActiveUniform()")}}.

## Thuộc tính phiên bản

- {{domxref("WebGLActiveInfo.name")}}
  - : Tên chỉ đọc của biến được yêu cầu.
- {{domxref("WebGLActiveInfo.size")}}
  - : Kích thước chỉ đọc của biến được yêu cầu.
- {{domxref("WebGLActiveInfo.type")}}
  - : Loại chỉ đọc của biến được yêu cầu.

## Ví dụ

Đối tượng `WebGLActiveInfo` được trả về bởi:

- {{domxref("WebGLRenderingContext.getActiveAttrib()")}}
- {{domxref("WebGLRenderingContext.getActiveUniform()")}} hoặc
- {{domxref("WebGL2RenderingContext.getTransformFeedbackVarying()")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getActiveAttrib()")}}
- {{domxref("WebGLRenderingContext.getActiveUniform()")}}
