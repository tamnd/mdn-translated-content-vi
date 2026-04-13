---
title: "GPURenderPassEncoder: phương thức drawIndexedIndirect()"
short-title: drawIndexedIndirect()
slug: Web/API/GPURenderPassEncoder/drawIndexedIndirect
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.drawIndexedIndirect
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`drawIndexedIndirect()`** của giao diện {{domxref("GPURenderPassEncoder")}} vẽ các nguyên thủy có chỉ mục sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.

## Cú pháp

```js-nolint
drawIndexedIndirect(indirectBuffer, indirectOffset)
```

### Tham số

- `indirectBuffer`
  - : Một {{domxref("GPUBuffer")}} chứa các giá trị `indexCount`, `instanceCount`, `firstIndex`, `baseVertex` và `firstInstance` cần thiết để thực hiện thao tác vẽ. Bộ đệm phải chứa một khối năm giá trị số nguyên không dấu 32-bit được đóng gói chặt chẽ biểu diễn các giá trị (tổng cộng 20 byte), theo cùng thứ tự như các đối số cho {{domxref("GPURenderPassEncoder.drawIndexed()")}}. Ví dụ:

    ```js
    const uint32 = new Uint32Array(5);
    uint32[0] = 3; // The indexCount value
    uint32[1] = 1; // The instanceCount value
    uint32[2] = 0; // The firstIndex value
    uint32[3] = 0; // The baseVertex value
    uint32[4] = 0; // The firstInstance value

    // Write values into a GPUBuffer
    device.queue.writeBuffer(buffer, 0, uint32, 0, uint32.length);
    ```

    > [!NOTE]
    > Tính năng `indirect-first-instance` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) cần được bật để sử dụng các giá trị `firstInstance` khác 0. Nếu tính năng `indirect-first-instance` không được bật và `firstInstance` khác 0, lệnh gọi `drawIndexedIndirect()` sẽ được xử lý như không có hoạt động nào.

- `indirectOffset`
  - : Độ lệch, tính bằng byte, vào `indirectBuffer` nơi dữ liệu giá trị bắt đầu.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`drawIndirect()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `indirectBuffer` chứa cờ `GPUBufferUsage.INDIRECT`.
- `indirectOffset` cộng với tổng kích thước được chỉ định bởi các tham số giá trị trong `indirectBuffer` nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `indirectBuffer`.
- `indirectOffset` là bội số của 4.

## Ví dụ

```js
// …

// Create GPURenderPassEncoder
const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// Set pipeline and vertex buffer
passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.setIndexBuffer(indexBuffer, "uint16");

// Create drawIndexedIndirect values
const uint32 = new Uint32Array(5);
uint32[0] = 3;
uint32[1] = 1;
uint32[2] = 0;
uint32[3] = 0;
uint32[4] = 0;

// Create a GPUBuffer and write the draw values into it
const drawValues = device.createBuffer({
  size: 20,
  usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.INDIRECT,
});
device.queue.writeBuffer(drawValues, 0, uint32, 0, uint32.length);

// Draw the vertices
passEncoder.drawIndexedIndirect(drawValues, 0);

// End the render pass
passEncoder.end();

// End frame by passing array of GPUCommandBuffers to command queue for execution
device.queue.submit([commandEncoder.finish()]);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
