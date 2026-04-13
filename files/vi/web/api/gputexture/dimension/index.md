---
title: "GPUTexture: dimension property"
short-title: dimension
slug: Web/API/GPUTexture/dimension
page-type: web-api-instance-property
browser-compat: api.GPUTexture.dimension
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`dimension`** của giao diện {{domxref("GPUTexture")}} đại diện cho kích thước của tập hợp texel cho mỗi subresource của `GPUTexture`.

Giá trị này được đặt thông qua thuộc tính `dimension` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu, mặc định là `"2d"` nếu bị bỏ qua.

## Giá trị

Một giá trị liệt kê. Các giá trị có thể là:

- `"1d"`: Kết cấu một chiều với một kích thước duy nhất là chiều rộng.
- `"2d"`: Kết cấu hai chiều với chiều rộng và chiều cao, có thể có thêm các lớp. Chỉ kết cấu `"2d"` mới có thể có mipmap, multisampling, dùng định dạng nén hoặc depth/stencil, và được dùng làm render attachment.
- `"3d"`: Kết cấu ba chiều với chiều rộng, chiều cao và chiều sâu.

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.dimension); // "2d"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
