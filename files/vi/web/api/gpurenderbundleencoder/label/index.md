---
title: "GPURenderBundleEncoder: thuộc tính label"
short-title: label
slug: Web/API/GPURenderBundleEncoder/label
page-type: web-api-instance-property
browser-compat: api.GPURenderBundleEncoder.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPURenderBundleEncoder")}} là một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Nhãn có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createRenderBundleEncoder()")}} nguồn gốc, hoặc bạn có thể lấy và đặt nó trực tiếp trên đối tượng `GPURenderBundleEncoder`.

> [!NOTE]
> Thuộc tính này về mặt chức năng giống hệt với thuộc tính tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.label", "label")}}.

## Giá trị

Một chuỗi. Nếu không có giá trị nhãn nào được đặt trước đó, việc lấy nhãn sẽ trả về một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPURenderBundleEncoder.label`:

```js
const renderBundleEncoder = device.createRenderBundleEncoder({
  colorFormats: [presentationFormat],
});

renderBundleEncoder.label = "my_render_bundle_encoder";
console.log(renderBundleEncoder.label); // "my_render_bundle_encoder"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.createRenderBundleEncoder()")}} nguồn gốc, sau đó lấy nó thông qua `GPURenderBundleEncoder.label`:

```js
const renderBundleEncoder = device.createRenderBundleEncoder({
  colorFormats: [presentationFormat],
  label: "my_render_bundle_encoder",
});

console.log(renderBundleEncoder.label); // "my_render_bundle_encoder"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
