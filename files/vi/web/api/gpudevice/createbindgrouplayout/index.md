---
title: "GPUDevice: phương thức createBindGroupLayout()"
short-title: createBindGroupLayout()
slug: Web/API/GPUDevice/createBindGroupLayout
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createBindGroupLayout
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createBindGroupLayout()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUBindGroupLayout")}} xác định cấu trúc và mục đích của các tài nguyên GPU liên quan như buffer sẽ được dùng trong pipeline, và được dùng làm khuôn mẫu khi tạo {{domxref("GPUBindGroup")}}.

## Cú pháp

```js-nolint
createBindGroupLayout(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả layout cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUBindGroupLayout")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
