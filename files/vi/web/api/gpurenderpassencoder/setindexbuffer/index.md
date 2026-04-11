---
title: "GPURenderPassEncoder: phương thức setIndexBuffer()"
short-title: setIndexBuffer()
slug: Web/API/GPURenderPassEncoder/setIndexBuffer
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setIndexBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setIndexBuffer()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt {{domxref("GPUBuffer")}} hiện tại sẽ cung cấp dữ liệu chỉ mục cho các lệnh vẽ tiếp theo.

## Cú pháp

```js-nolint
setIndexBuffer(buffer, indexFormat, offset, size)
```

### Tham số

- `buffer`
  - : Một {{domxref("GPUBuffer")}} biểu diễn bộ đệm chứa dữ liệu chỉ mục để sử dụng cho các lệnh vẽ tiếp theo.
- `indexFormat`
  - : Một giá trị liệt kê xác định định dạng của dữ liệu chỉ mục chứa trong `buffer`. Các giá trị có thể là:
    - `"uint16"`
    - `"uint32"`
- `offset` {{optional_inline}}
  - : Một số biểu diễn độ lệch, tính bằng byte, vào `buffer` nơi dữ liệu chỉ mục bắt đầu. Nếu bỏ qua, `offset` mặc định là 0.
- `size` {{optional_inline}}
  - : Một số biểu diễn kích thước, tính bằng byte, của dữ liệu chỉ mục chứa trong `buffer`. Nếu bỏ qua, `size` mặc định là {{domxref("GPUBuffer.size")}} của `buffer` trừ `offset`.

#### Lưu ý về indexFormat

`indexFormat` xác định cả kiểu dữ liệu của các giá trị chỉ mục trong bộ đệm và, khi được dùng với một pipeline chỉ định topology nguyên thủy dải (`"line-strip"` hoặc `"triangle-strip"`), cũng xác định giá trị khởi động lại nguyên thủy. Giá trị khởi động lại nguyên thủy là một giá trị chỉ mục cho biết rằng một nguyên thủy mới nên được bắt đầu thay vì tiếp tục xây dựng dải với các đỉnh đã được lập chỉ mục trước đó. Giá trị là `0xFFFF` cho `"uint16"`, hoặc `0xFFFFFFFF` cho `"uint32"`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setIndexBuffer()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `buffer` chứa cờ `GPUBufferUsage.INDEX`.
- `offset` + `size` nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `buffer`.
- `offset` là bội số của kích thước byte của `indexFormat` (2 cho `"uint16"`, 4 cho `"uint32"`).

## Ví dụ

Trong ví dụ WebGPU Samples [Shadow Mapping](https://webgpu.github.io/webgpu-samples/samples/shadowMapping/), `setIndexBuffer()` được sử dụng trong hai lần thực thi kết xuất riêng biệt trong mỗi khung hình hoạt ảnh, một lần để vẽ mô hình chính và một lần để vẽ bóng của nó. Nghiên cứu danh sách mã ví dụ để có đầy đủ ngữ cảnh.

```js
// …

const commandEncoder = device.createCommandEncoder();
{
  const shadowPass = commandEncoder.beginRenderPass(shadowPassDescriptor);
  shadowPass.setPipeline(shadowPipeline);
  shadowPass.setBindGroup(0, sceneBindGroupForShadow);
  shadowPass.setBindGroup(1, modelBindGroup);
  shadowPass.setVertexBuffer(0, vertexBuffer);
  shadowPass.setIndexBuffer(indexBuffer, "uint16");
  shadowPass.drawIndexed(indexCount);

  shadowPass.end();
}
{
  const renderPass = commandEncoder.beginRenderPass(renderPassDescriptor);
  renderPass.setPipeline(pipeline);
  renderPass.setBindGroup(0, sceneBindGroupForRender);
  renderPass.setBindGroup(1, modelBindGroup);
  renderPass.setVertexBuffer(0, vertexBuffer);
  renderPass.setIndexBuffer(indexBuffer, "uint16");
  renderPass.drawIndexed(indexCount);

  renderPass.end();
}

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
