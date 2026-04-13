---
title: "GPURenderBundleEncoder: phương thức drawIndirect()"
short-title: drawIndirect()
slug: Web/API/GPURenderBundleEncoder/drawIndirect
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.drawIndirect
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`drawIndirect()`** của giao diện {{domxref("GPURenderBundleEncoder")}} vẽ các nguyên thủy sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.drawIndirect", "drawIndirect()")}}.

## Cú pháp

```js-nolint
drawIndirect(indirectBuffer, indirectOffset)
```

### Tham số

- `indirectBuffer`
  - : Một {{domxref("GPUBuffer")}} chứa các giá trị `vertexCount`, `instanceCount`, `firstVertex` và `firstInstance` cần thiết để thực hiện thao tác vẽ. Bộ đệm phải chứa một khối bốn giá trị số nguyên không dấu 32-bit được đóng gói chặt chẽ biểu diễn các giá trị (tổng cộng 16 byte), theo cùng thứ tự như các đối số cho {{domxref("GPURenderBundleEncoder.draw()")}}. Ví dụ:

    ```js
    const uint32 = new Uint32Array(4);
    uint32[0] = 3; // The vertexCount value
    uint32[1] = 1; // The instanceCount value
    uint32[2] = 0; // The firstVertex value
    uint32[3] = 0; // The firstInstance value

    // Write values into a GPUBuffer
    device.queue.writeBuffer(buffer, 0, uint32, 0, uint32.length);
    ```

    > [!NOTE]
    > Tính năng `indirect-first-instance` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) cần được bật để sử dụng các giá trị `firstInstance` khác 0. Nếu tính năng `indirect-first-instance` không được bật và `firstInstance` khác 0, lệnh gọi `drawIndirect()` sẽ được xử lý như không có hoạt động nào.

- `indirectOffset`
  - : Độ lệch, tính bằng byte, vào `indirectBuffer` nơi dữ liệu giá trị bắt đầu.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`drawIndirect()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderBundleEncoder")}} sẽ không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `indirectBuffer` chứa cờ `GPUBufferUsage.INDIRECT`.
- `indirectOffset` cộng với tổng kích thước được chỉ định bởi các tham số giá trị trong `indirectBuffer` nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `indirectBuffer`.
- `indirectOffset` là bội số của 4.

## Ví dụ

```js
// …

// Create GPURenderBundleEncoder
const bundleEncoder = device.createRenderBundleEncoder(descriptor);

// Set pipeline and vertex buffer
bundleEncoder.setPipeline(renderPipeline);
bundleEncoder.setVertexBuffer(0, vertexBuffer);

// Create drawIndirect values
const uint32 = new Uint32Array(4);
uint32[0] = 3;
uint32[1] = 1;
uint32[2] = 0;
uint32[3] = 0;

// Create a GPUBuffer and write the draw values into it
const drawValues = device.createBuffer({
  size: 16,
  usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.INDIRECT,
});
device.queue.writeBuffer(drawValues, 0, uint32, 0, uint32.length);

// Draw the vertices
bundleEncoder.drawIndirect(drawValues, 0);

// End the bundle recording
const renderBundle = bundleEncoder.finish();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
