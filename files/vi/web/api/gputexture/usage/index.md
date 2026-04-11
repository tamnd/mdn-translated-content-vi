---
title: "GPUTexture: usage property"
short-title: usage
slug: Web/API/GPUTexture/usage
page-type: web-api-instance-property
browser-compat: api.GPUTexture.usage
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`usage`** của giao diện {{domxref("GPUTexture")}} là các {{glossary("bitwise flags")}} đại diện cho các cách sử dụng được phép của `GPUTexture`.

Giá trị này được đặt thông qua thuộc tính `usage` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu.

## Giá trị

Các bitwise flag đại diện cho các cách sử dụng ban đầu được đặt khi `GPUTexture` được tạo lần đầu. Số trả về là tổng của các giá trị thập phân đại diện cho các cờ khác nhau, như trong bảng bên dưới.

| Cờ sử dụng                          | Mô tả sử dụng                                                                                                                                                                                                                                                                                                                  | Hex tương đương | Thập phân tương đương |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------- | --------------------- |
| `GPUTextureUsage.COPY_SRC`          | Kết cấu có thể được dùng làm nguồn của thao tác sao chép, ví dụ đối số nguồn của lời gọi {{domxref("GPUCommandEncoder.copyTextureToBuffer", "copyTextureToBuffer()")}}.                                                                                                                                                        | 0x01            | 1                     |
| `GPUTextureUsage.COPY_DST`          | Kết cấu có thể được dùng làm đích của thao tác sao chép/ghi, ví dụ đối số đích của lời gọi {{domxref("GPUCommandEncoder.copyBufferToTexture", "copyBufferToTexture()")}}.                                                                                                                                                      | 0x02            | 2                     |
| `GPUTextureUsage.RENDER_ATTACHMENT` | Kết cấu có thể được dùng làm attachment màu sắc hoặc depth/stencil trong render pass, ví dụ thuộc tính `view` của đối tượng descriptor trong lời gọi {{domxref("GPUCommandEncoder.beginRenderPass", "beginRenderPass()")}}.                                                                                                    | 0x10            | 16                    |
| `GPUTextureUsage.STORAGE_BINDING`   | Kết cấu có thể được ràng buộc để dùng làm storage texture trong shader, ví dụ làm tài nguyên trong mục bind group khi tạo {{domxref("GPUBindGroup")}} (qua {{domxref("GPUDevice.createBindGroup", "createBindGroup()")}}), tuân theo mục {{domxref("GPUBindGroupLayout")}} với bố cục ràng buộc storage texture được chỉ định. | 0x08            | 8                     |
| `GPUTextureUsage.TEXTURE_BINDING`   | Kết cấu có thể được ràng buộc để dùng làm sampled texture trong shader, ví dụ làm tài nguyên trong mục bind group khi tạo {{domxref("GPUBindGroup")}} (qua {{domxref("GPUDevice.createBindGroup", "createBindGroup()")}}), tuân theo mục {{domxref("GPUBindGroupLayout")}} với bố cục ràng buộc texture được chỉ định.         | 0x04            | 4                     |

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.usage); // 16
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
