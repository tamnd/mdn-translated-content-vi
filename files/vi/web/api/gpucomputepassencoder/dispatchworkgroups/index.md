---
title: "GPUComputePassEncoder: dispatchWorkgroups() method"
short-title: dispatchWorkgroups()
slug: Web/API/GPUComputePassEncoder/dispatchWorkgroups
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.dispatchWorkgroups
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`dispatchWorkgroups()`** của giao diện {{domxref("GPUComputePassEncoder")}} gửi đi một lưới workgroup cụ thể để thực hiện công việc do {{domxref("GPUComputePipeline")}} hiện tại đảm nhiệm (tức là được đặt thông qua {{domxref("GPUComputePassEncoder.setPipeline()")}}).

## Cú pháp

```js-nolint
dispatchWorkgroups(workgroupCountX)
dispatchWorkgroups(workgroupCountX, workgroupCountY)
dispatchWorkgroups(workgroupCountX, workgroupCountY, workgroupCountZ)
```

### Tham số

- `workgroupCountX`
  - : Chiều X của lưới workgroup cần gửi.
- `workgroupCountY` {{optional_inline}}
  - : Chiều Y của lưới workgroup cần gửi. Nếu bỏ qua, `workgroupCountY` mặc định là 1.
- `workgroupCountZ` {{optional_inline}}
  - : Chiều Z của lưới workgroup cần gửi. Nếu bỏ qua, `workgroupCountZ` mặc định là 1.

> [!NOTE]
> Các giá trị chiều X, Y và Z truyền vào `dispatchWorkgroups()` và {{domxref("GPUComputePassEncoder.dispatchWorkgroupsIndirect()")}} là số lượng workgroup cần gửi cho mỗi chiều, không phải số lần gọi shader cho mỗi chiều. Điều này khớp với hành vi của các GPU API native hiện đại, nhưng khác với hành vi của OpenCL. Điều này có nghĩa là nếu {{domxref("GPUShaderModule")}} định nghĩa một entry point với `@workgroup_size(4, 4)`, và công việc được gửi bằng lệnh `passEncoder.dispatchWorkgroups(8, 8);`, thì entry point sẽ được gọi tổng cộng 1024 lần, vì một workgroup 4 x 4 được gửi 8 lần theo cả trục X và Y. `4 * 4 * 8 * 8 = 1024`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`dispatchWorkgroups()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPUComputePassEncoder")}} sẽ trở nên không hợp lệ:

- `workgroupCountX`, `workgroupCountY` và `workgroupCountZ` đều nhỏ hơn hoặc bằng giới hạn `maxComputeWorkgroupsPerDimension` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/), một số lệnh được ghi thông qua {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này xuất phát từ {{domxref("GPUComputePassEncoder")}} được tạo qua `beginComputePass()`.

Ở đầu code, ta đặt kích thước buffer toàn cục là 1000. Lưu ý rằng kích thước workgroup trong shader được đặt là 64.

```js
const BUFFER_SIZE = 1000;

// Compute shader
const shader = `
@group(0) @binding(0)
var<storage, read_write> output: array<f32>;

@compute @workgroup_size(64)

...

`;
```

Ở phần sau trong code, tham số `workgroupCountX` của `dispatchWorkgroups()` được đặt dựa trên kích thước buffer toàn cục và số lượng workgroup của shader.

```js
// …

// Create GPUCommandEncoder to encode commands to issue to the GPU
const commandEncoder = device.createCommandEncoder();

// Initiate compute pass
const passEncoder = commandEncoder.beginComputePass();

// Issue commands
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);
passEncoder.dispatchWorkgroups(Math.ceil(BUFFER_SIZE / 64));

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
