---
title: "GPUComputePassEncoder: dispatchWorkgroupsIndirect() method"
short-title: dispatchWorkgroupsIndirect()
slug: Web/API/GPUComputePassEncoder/dispatchWorkgroupsIndirect
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.dispatchWorkgroupsIndirect
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`dispatchWorkgroupsIndirect()`** của giao diện {{domxref("GPUComputePassEncoder")}} gửi đi một lưới workgroup, được định nghĩa bởi các tham số của {{domxref("GPUBuffer")}}, để thực hiện công việc do {{domxref("GPUComputePipeline")}} hiện tại đảm nhiệm (tức là được đặt thông qua {{domxref("GPUComputePassEncoder.setPipeline()")}}).

## Cú pháp

```js-nolint
dispatchWorkgroupsIndirect(indirectBuffer, indirectOffset)
```

### Tham số

- `indirectBuffer`
  - : Một {{domxref("GPUBuffer")}} chứa các chiều X, Y và Z của lưới workgroup cần gửi. Buffer phải chứa một khối liền kề gồm ba giá trị số nguyên không dấu 32-bit đại diện cho các chiều (tổng cộng 12 byte), theo thứ tự giống như các đối số của {{domxref("GPUComputePassEncoder.dispatchWorkgroups()")}}. Ví dụ:

    ```js
    const uint32 = new Uint32Array(3);
    uint32[0] = 25; // The X value
    uint32[1] = 1; // The Y value
    uint32[2] = 1; // The Z value

    // Write values into a GPUBuffer
    device.queue.writeBuffer(buffer, 0, uint32, 0, uint32.length);
    ```

- `indirectOffset`
  - : Khoảng cách tính bằng byte vào trong `indirectBuffer` nơi dữ liệu chiều bắt đầu.

> [!NOTE]
> Các giá trị chiều X, Y và Z truyền vào {{domxref("GPUComputePassEncoder.dispatchWorkgroups()")}} và `dispatchWorkgroupsIndirect()` là số lượng workgroup cần gửi cho mỗi chiều, không phải số lần gọi shader cho mỗi chiều. Điều này khớp với hành vi của các GPU API native hiện đại, nhưng khác với hành vi của OpenCL. Điều này có nghĩa là nếu {{domxref("GPUShaderModule")}} định nghĩa một entry point với `@workgroup_size(4, 4)`, và công việc được gửi bằng `dispatchWorkgroupsIndirect(indirectBuffer);` với `indirectBuffer` chỉ định chiều X và Y là 8 và 8, thì entry point sẽ được gọi tổng cộng 1024 lần. `4 * 4 * 8 * 8 = 1024`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`dispatchWorkgroupsIndirect()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPUComputePassEncoder")}} sẽ trở nên không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `indirectBuffer` có chứa cờ `GPUBufferUsage.INDIRECT`.
- `indirectOffset` cộng với tổng kích thước được chỉ định bởi các chiều `X`, `Y` và `Z` phải nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `indirectBuffer`.
- `indirectOffset` là bội số của 4.

## Ví dụ

```js
// Set global buffer size
const BUFFER_SIZE = 1000;

// Compute shader; note workgroup size of 64
const shader = `
@group(0) @binding(0)
var<storage, read_write> output: array<f32>;

@compute @workgroup_size(64)

...

`;

// …

// Create GPUCommandEncoder to encode commands to issue to the GPU
const commandEncoder = device.createCommandEncoder();

// Initiate compute pass
const passEncoder = commandEncoder.beginComputePass();

// Issue commands
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);

const uint32 = new Uint32Array(3);
// Note workgroupCountX is set based on the global buffer size and the shader workgroup count.
uint32[0] = Math.ceil(BUFFER_SIZE / 64);
uint32[1] = 1;
uint32[2] = 1;

const workgroupDimensions = device.createBuffer({
  size: 12,
  usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.INDIRECT,
});
device.queue.writeBuffer(workgroupDimensions, 0, uint32, 0, uint32.length);

passEncoder.dispatchWorkgroupsIndirect(workgroupDimensions, 0);

// End the render pass
passEncoder.end();

// Copy output buffer to staging buffer
commandEncoder.copyBufferToBuffer(
  output,
  0, // Source offset
  stagingBuffer,
  0, // Destination offset
  BUFFER_SIZE,
);

// End frame by passing array of command buffers to command queue for execution
device.queue.submit([commandEncoder.finish()]);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
