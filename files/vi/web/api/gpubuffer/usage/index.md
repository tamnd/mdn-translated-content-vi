---
title: "GPUBuffer: usage property"
short-title: usage
slug: Web/API/GPUBuffer/usage
page-type: web-api-instance-property
browser-compat: api.GPUBuffer.usage
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`usage`** của giao diện {{domxref("GPUBuffer")}} chứa {{glossary("bitwise flags")}} đại diện cho các cách sử dụng cho phép của `GPUBuffer`.

`usage` được đặt qua thuộc tính `usage` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createBuffer()")}} gốc.

## Giá trị

Các cờ bitwise đại diện cho các cách sử dụng ban đầu được đặt khi `GPUBuffer` được tạo lần đầu tiên. Số được trả về là tổng các giá trị thập phân đại diện cho các cờ khác nhau, như được thấy trong bảng dưới đây.

| Cờ bitwise                     | Mô tả cách sử dụng                                                                                                                                                                                                                                                                                                               | Hex tương đương | Thập phân tương đương |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | --------------------- |
| `GPUBufferUsage.COPY_SRC`      | Buffer có thể được sử dụng làm nguồn của thao tác sao chép, ví dụ đối số nguồn của lệnh gọi {{domxref("GPUCommandEncoder.copyBufferToBuffer","copyBufferToBuffer()")}}.                                                                                                                                                          | 0x0004          | 4                     |
| `GPUBufferUsage.COPY_DST`      | Buffer có thể được sử dụng làm đích của thao tác sao chép/ghi, ví dụ đối số đích của lệnh gọi {{domxref("GPUCommandEncoder.copyTextureToBuffer", "copyTextureToBuffer()")}}.                                                                                                                                                     | 0x0008          | 8                     |
| `GPUBufferUsage.INDEX`         | Buffer có thể được sử dụng làm buffer chỉ mục, ví dụ đối số `buffer` được truyền vào {{domxref("GPURenderPassEncoder.setIndexBuffer", "setIndexBuffer()")}}.                                                                                                                                                                     | 0x0010          | 16                    |
| `GPUBufferUsage.INDIRECT`      | Buffer có thể được sử dụng để lưu trữ các đối số lệnh gián tiếp, ví dụ đối số `indirectBuffer` của lệnh gọi {{domxref("GPURenderPassEncoder.drawIndirect", "drawIndirect()")}} hoặc {{domxref("GPUComputePassEncoder.dispatchWorkgroupsIndirect", "dispatchWorkgroupsIndirect()")}}.                                             | 0x0100          | 256                   |
| `GPUBufferUsage.MAP_READ`      | Buffer có thể được ánh xạ để đọc, ví dụ khi gọi {{domxref("GPUBuffer.mapAsync", "mapAsync()")}} với `mode` là `GPUMapMode.READ`. Cờ này chỉ có thể kết hợp với `GPUBufferUsage.COPY_DST`.                                                                                                                                        | 0x0001          | 1                     |
| `GPUBufferUsage.MAP_WRITE`     | Buffer có thể được ánh xạ để ghi, ví dụ khi gọi {{domxref("GPUBuffer.mapAsync", "mapAsync()")}} với `mode` là `GPUMapMode.WRITE`. Cờ này chỉ có thể kết hợp với `GPUBufferUsage.COPY_SRC`.                                                                                                                                       | 0x0002          | 2                     |
| `GPUBufferUsage.QUERY_RESOLVE` | Buffer có thể được sử dụng để ghi lại kết quả truy vấn, ví dụ đối số đích của lệnh gọi {{domxref("GPUCommandEncoder.resolveQuerySet", "resolveQuerySet()")}}.                                                                                                                                                                    | 0x0200          | 512                   |
| `GPUBufferUsage.STORAGE`       | Buffer có thể được sử dụng làm buffer lưu trữ, ví dụ như tài nguyên trong mục nhóm ràng buộc khi tạo {{domxref("GPUBindGroup")}} (qua {{domxref("GPUDevice.createBindGroup", "createBindGroup()")}}), tuân thủ mục {{domxref("GPUBindGroupLayout")}} với kiểu bố cục ràng buộc buffer là `"storage"` hoặc `"read-only-storage"`. | 0x0080          | 128                   |
| `GPUBufferUsage.UNIFORM`       | Buffer có thể được sử dụng làm buffer đồng nhất, ví dụ như tài nguyên trong mục nhóm ràng buộc khi tạo {{domxref("GPUBindGroup")}} (qua {{domxref("GPUDevice.createBindGroup", "createBindGroup()")}}), tuân thủ mục {{domxref("GPUBindGroupLayout")}} với kiểu bố cục ràng buộc buffer là `"uniform"`.                          | 0x0040          | 64                    |
| `GPUBufferUsage.VERTEX`        | Buffer có thể được sử dụng làm buffer đỉnh, ví dụ đối số `buffer` được truyền vào {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}}.                                                                                                                                                                      | 0x0020          | 32                    |

## Ví dụ

```js
const output = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

console.log(output.usage); // 132

const stagingBuffer = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});

console.log(stagingBuffer.usage); // 9
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
