---
title: "GPURenderBundle: label property"
short-title: label
slug: Web/API/GPURenderBundle/label
page-type: web-api-instance-property
browser-compat: api.GPURenderBundle.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPURenderBundle")}} là một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPURenderBundleEncoder.finish()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPURenderBundle`.

## Giá trị

Một chuỗi. Nếu chưa có giá trị nhãn nào được đặt trước đó, việc lấy nhãn sẽ trả về một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPURenderBundle.label`:

```js
const renderBundle = renderBundleEncoder.finish();

renderBundle.label = "my_render_bundle";
console.log(renderBundle.label); // "my_render_bundle"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPURenderBundleEncoder.finish()")}} nguồn gốc, sau đó lấy qua `GPURenderBundle.label`:

```js
const renderBundle = renderBundleEncoder.finish({
  label: "my_render_bundle",
});

console.log(renderBundle.label); // "my_render_bundle"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
