---
title: "GPU: phương thức getPreferredCanvasFormat()"
short-title: getPreferredCanvasFormat()
slug: Web/API/GPU/getPreferredCanvasFormat
page-type: web-api-instance-method
browser-compat: api.GPU.getPreferredCanvasFormat
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getPreferredCanvasFormat()`** của giao diện {{domxref("GPU")}} trả về định dạng texture canvas tối ưu để hiển thị nội dung có độ sâu 8 bit, dải động tiêu chuẩn trên hệ thống hiện tại.

Phương thức này thường được dùng để cung cấp cho lệnh gọi {{domxref("GPUCanvasContext.configure()")}} giá trị `format` tối ưu cho hệ thống hiện tại. Điều này được khuyến nghị - nếu bạn không dùng định dạng được ưu tiên khi cấu hình canvas context, bạn có thể phát sinh thêm chi phí, chẳng hạn như các bản sao texture bổ sung, tùy theo nền tảng.

## Cú pháp

```js-nolint
getPreferredCanvasFormat()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi cho biết định dạng texture canvas. Giá trị có thể là `rgba8unorm` hoặc `bgra8unorm`.

### Ngoại lệ

Không có.

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

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
