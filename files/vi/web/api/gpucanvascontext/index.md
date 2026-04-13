---
title: GPUCanvasContext
slug: Web/API/GPUCanvasContext
page-type: web-api-interface
browser-compat: api.GPUCanvasContext
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUCanvasContext`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho ngữ cảnh kết xuất WebGPU của phần tử {{htmlelement("canvas")}}, được trả về qua lệnh gọi {{domxref("HTMLCanvasElement.getContext()")}} với `contextType` là `"webgpu"`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUCanvasContext.canvas", "canvas")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến canvas mà ngữ cảnh được tạo từ đó.

## Phương thức phiên bản

- {{domxref("GPUCanvasContext.configure", "configure()")}}
  - : Cấu hình ngữ cảnh để sử dụng cho kết xuất với {{domxref("GPUDevice")}} cho trước và xóa canvas thành màu đen trong suốt.
- {{domxref("GPUCanvasContext.getConfiguration", "getConfiguration()")}}
  - : Trả về cấu hình hiện tại được đặt cho ngữ cảnh.
- {{domxref("GPUCanvasContext.getCurrentTexture", "getCurrentTexture()")}}
  - : Trả về {{domxref("GPUTexture")}} tiếp theo sẽ được ghép vào tài liệu bởi ngữ cảnh canvas.
- {{domxref("GPUCanvasContext.unconfigure", "unconfigure()")}}
  - : Xóa bất kỳ cấu hình ngữ cảnh nào đã được đặt trước đó, và hủy bất kỳ texture nào được tạo ra khi ngữ cảnh canvas đã được cấu hình.

## Ví dụ

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
