---
title: "GPURenderPipeline: getBindGroupLayout() method"
short-title: getBindGroupLayout()
slug: Web/API/GPURenderPipeline/getBindGroupLayout
page-type: web-api-instance-method
browser-compat: api.GPURenderPipeline.getBindGroupLayout
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getBindGroupLayout()`** của giao diện {{domxref("GPURenderPipeline")}} trả về đối tượng {{domxref("GPUBindGroupLayout")}} của pipeline với chỉ mục cho trước (tức là được bao gồm trong bố cục pipeline của lệnh gọi {{domxref("GPUDevice.createRenderPipeline()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}} gốc).

Nếu {{domxref("GPURenderPipeline")}} được tạo với `layout: "auto"`, phương thức này là cách duy nhất để lấy {{domxref("GPUBindGroupLayout")}} được tạo bởi pipeline.

## Cú pháp

```js-nolint
getBindGroupLayout(index)
```

### Tham số

- `index`
  - : Số đại diện cho chỉ mục của {{domxref("GPUBindGroupLayout")}} cần trả về.

### Giá trị trả về

Phiên bản đối tượng {{domxref("GPUBindGroupLayout")}}.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`getBindGroupLayout()`**, nếu không {{domxref("GPUValidationError")}} được tạo ra và đối tượng {{domxref("GPUBindGroupLayout")}} không hợp lệ được trả về:

- `index` nhỏ hơn số đối tượng {{domxref("GPUBindGroupLayout")}} được sử dụng trong bố cục pipeline.

## Ví dụ

> [!NOTE]
> Bạn có thể thấy các ví dụ hoàn chỉnh với `getBindGroupLayout()` trong các [mẫu WebGPU](https://webgpu.github.io/webgpu-samples/).

```js
// …

// Create a render pipeline using layout: "auto" to automatically generate
// appropriate bind group layouts
const fullscreenQuadPipeline = device.createRenderPipeline({
  layout: "auto",
  vertex: {
    module: device.createShaderModule({
      code: fullscreenTexturedQuadWGSL,
    }),
    entryPoint: "vert_main",
  },
  fragment: {
    module: device.createShaderModule({
      code: fullscreenTexturedQuadWGSL,
    }),
    entryPoint: "frag_main",
    targets: [
      {
        format: presentationFormat,
      },
    ],
  },
  primitive: {
    topology: "triangle-list",
  },
});

// …

// Create a bind group with the auto-generated layout from the render pipeline
const showResultBindGroup = device.createBindGroup({
  layout: fullscreenQuadPipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: sampler,
    },
    {
      binding: 1,
      resource: textures[1].createView(),
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
