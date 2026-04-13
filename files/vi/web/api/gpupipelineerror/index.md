---
title: GPUPipelineError
slug: Web/API/GPUPipelineError
page-type: web-api-interface
browser-compat: api.GPUPipelineError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUPipelineError`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mô tả lỗi pipeline. Đây là giá trị nhận được khi {{jsxref("Promise")}} được trả về bởi lệnh gọi {{domxref("GPUDevice.createComputePipelineAsync()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}} bị từ chối.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GPUPipelineError.GPUPipelineError", "GPUPipelineError()")}}
  - : Tạo phiên bản đối tượng `GPUPipelineError` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("DOMException")}}._

- {{domxref("GPUPipelineError.reason", "reason")}} {{ReadOnlyInline}}
  - : Giá trị được liệt kê xác định lý do tạo pipeline thất bại theo cách máy có thể đọc được.

## Ví dụ

<!-- cSpell:ignore maijn -->

Trong đoạn code sau, chúng ta đang cố gắng tạo {{domxref("GPUComputePipeline")}} bằng {{domxref("GPUDevice.createComputePipelineAsync()")}}. Tuy nhiên, chúng ta đã viết sai `entryPoint` của pipeline tính toán là `"maijn"` (lẽ ra phải là `"main"`), do đó việc tạo pipeline thất bại và khối `catch` in lý do và thông báo lỗi kết quả ra console.

```js
// …

let computePipeline;

try {
  computePipeline = await device.createComputePipelineAsync({
    layout: device.createPipelineLayout({
      bindGroupLayouts: [bindGroupLayout],
    }),
    compute: {
      module: shaderModule,
      entryPoint: "maijn",
    },
  });
} catch (error) {
  // error is a GPUPipelineError object instance
  console.error(error.reason);
  console.error(`Pipeline creation failed: ${error.message}`);
}

// …
```

Trong trường hợp này, `reason` là `"Validation"` và `message` là `"Entry point "maijn" doesn't exist in the shader module [ShaderModule]."`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Thực tiễn xử lý lỗi WebGPU tốt nhất](https://toji.dev/webgpu-best-practices/error-handling)
