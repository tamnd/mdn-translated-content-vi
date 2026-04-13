---
title: GPUBindGroup
slug: Web/API/GPUBindGroup
page-type: web-api-interface
browser-compat: api.GPUBindGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUBindGroup`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} dựa trên {{domxref("GPUBindGroupLayout")}} và xác định một tập hợp tài nguyên được liên kết cùng nhau trong một nhóm và cách các tài nguyên đó được sử dụng trong các giai đoạn shader.

Đối tượng `GPUBindGroup` được tạo bằng phương thức {{domxref("GPUDevice.createBindGroup()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUBindGroup.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

> [!NOTE]
> [WebGPU samples](https://webgpu.github.io/webgpu-samples/) có nhiều ví dụ hơn.

### Ví dụ cơ bản

[Bản demo tính toán cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/) của chúng tôi cho thấy ví dụ về việc tạo bố cục nhóm liên kết rồi sử dụng nó như mẫu khi tạo nhóm liên kết.

```js
// …

const bindGroupLayout = device.createBindGroupLayout({
  entries: [
    {
      binding: 0,
      visibility: GPUShaderStage.COMPUTE,
      buffer: {
        type: "storage",
      },
    },
  ],
});

const bindGroup = device.createBindGroup({
  layout: bindGroupLayout,
  entries: [
    {
      binding: 0,
      resource: {
        buffer: output,
      },
    },
  ],
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
