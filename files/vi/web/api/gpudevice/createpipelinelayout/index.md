---
title: "GPUDevice: phương thức createPipelineLayout()"
short-title: createPipelineLayout()
slug: Web/API/GPUDevice/createPipelineLayout
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createPipelineLayout
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createPipelineLayout()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUPipelineLayout")}} xác định các {{domxref("GPUBindGroupLayout")}} mà một pipeline sử dụng. Các {{domxref("GPUBindGroup")}} dùng cùng pipeline trong quá trình mã hóa lệnh phải có {{domxref("GPUBindGroupLayout")}} tương thích.

## Cú pháp

```js-nolint
createPipelineLayout(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả layout pipeline cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUPipelineLayout")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
