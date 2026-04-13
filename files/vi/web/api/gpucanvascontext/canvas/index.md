---
title: "GPUCanvasContext: canvas property"
short-title: canvas
slug: Web/API/GPUCanvasContext/canvas
page-type: web-api-instance-property
browser-compat: api.GPUCanvasContext.canvas
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`canvas`** của giao diện {{domxref("GPUCanvasContext")}} trả về tham chiếu đến canvas mà ngữ cảnh được tạo từ đó.

## Giá trị

Phiên bản đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}}.

## Ví dụ

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

// returns an HTMLCanvasElement reference
context.canvas;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
