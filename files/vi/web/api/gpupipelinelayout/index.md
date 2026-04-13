---
title: GPUPipelineLayout
slug: Web/API/GPUPipelineLayout
page-type: web-api-interface
browser-compat: api.GPUPipelineLayout
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUPipelineLayout`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} xác định các {{domxref("GPUBindGroupLayout")}} được sử dụng bởi một pipeline. Các {{domxref("GPUBindGroup")}} được sử dụng với pipeline trong quá trình mã hóa lệnh phải có {{domxref("GPUBindGroupLayout")}} tương thích.

Đối tượng `GPUPipelineLayout` được tạo bằng phương thức {{domxref("GPUDevice.createPipelineLayout()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUPipelineLayout.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

> [!NOTE]
> [WebGPU samples](https://webgpu.github.io/webgpu-samples/) có nhiều ví dụ hơn.

### Ví dụ bố cục pipeline cơ bản

Đoạn mã sau:

- Tạo một {{domxref("GPUBindGroupLayout")}} mô tả một liên kết với bộ đệm, kết cấu và bộ lấy mẫu.
- Tạo một `GPUPipelineLayout` dựa trên {{domxref("GPUBindGroupLayout")}}.

```js
// …

const bindGroupLayout = device.createBindGroupLayout({
  entries: [
    {
      binding: 0,
      visibility: GPUShaderStage.VERTEX | GPUShaderStage.FRAGMENT,
      buffer: {},
    },
    {
      binding: 1,
      visibility: GPUShaderStage.FRAGMENT,
      texture: {},
    },
    {
      binding: 2,
      visibility: GPUShaderStage.FRAGMENT,
      sampler: {},
    },
  ],
});

const pipelineLayout = device.createPipelineLayout({
  bindGroupLayouts: [bindGroupLayout],
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
