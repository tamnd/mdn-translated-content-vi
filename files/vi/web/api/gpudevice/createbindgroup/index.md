---
title: "GPUDevice: phương thức createBindGroup()"
short-title: createBindGroup()
slug: Web/API/GPUDevice/createBindGroup
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createBindGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createBindGroup()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUBindGroup")}} dựa trên một {{domxref("GPUBindGroupLayout")}}, mô tả tập hợp tài nguyên được ràng buộc cùng nhau trong một nhóm và cách các tài nguyên đó được dùng trong các giai đoạn shader.

## Cú pháp

```js-nolint
createBindGroup(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả nhóm ràng buộc cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUBindGroup")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
