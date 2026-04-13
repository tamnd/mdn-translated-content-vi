---
title: GPUExternalTexture
slug: Web/API/GPUExternalTexture
page-type: web-api-interface
browser-compat: api.GPUExternalTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUExternalTexture`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một đối tượng bao bọc chứa ảnh chụp nhanh {{domxref("HTMLVideoElement")}} có thể được sử dụng như kết cấu trong các thao tác kết xuất GPU.

Đối tượng `GPUExternalTexture` được tạo bằng {{domxref("GPUDevice.importExternalTexture()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUExternalTexture.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

Trong ví dụ [Video Uploading](https://webgpu.github.io/webgpu-samples/samples/videoUploading/) của WebGPU Samples, một đối tượng `GPUExternalTexture` (được tạo qua lệnh gọi {{domxref("GPUDevice.importExternalTexture()")}}) được sử dụng như giá trị `resource` trong mục nhập nhóm liên kết, được chỉ định khi tạo {{domxref("GPUBindGroup")}} qua lệnh gọi {{domxref("GPUDevice.createBindGroup()")}}:

```js
// …
const uniformBindGroup = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 1,
      resource: sampler,
    },
    {
      binding: 2,
      resource: device.importExternalTexture({
        source: video,
      }),
    },
  ],
});
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
