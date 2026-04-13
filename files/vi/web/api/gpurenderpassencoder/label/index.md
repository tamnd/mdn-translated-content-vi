---
title: "GPURenderPassEncoder: thuộc tính label"
short-title: label
slug: Web/API/GPURenderPassEncoder/label
page-type: web-api-instance-property
browser-compat: api.GPURenderPassEncoder.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPURenderPassEncoder")}} là một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Nhãn có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc, hoặc bạn có thể lấy và đặt nó trực tiếp trên đối tượng `GPURenderPassEncoder`.

## Giá trị

Một chuỗi. Nếu không có giá trị nhãn nào được đặt trước đó, việc lấy nhãn sẽ trả về một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPURenderPassEncoder.label`:

```js
const commandEncoder = device.createCommandEncoder();

const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: clearColor,
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
};

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
passEncoder.label = "my_render_pass_encoder";

console.log(passEncoder.label); // "my_render_pass_encoder"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc, sau đó lấy nó thông qua `GPURenderPassEncoder.label`:

```js
const commandEncoder = device.createCommandEncoder();

const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: clearColor,
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
  label: "my_render_pass_encoder",
};

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

console.log(passEncoder.label); // "my_render_pass_encoder"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
