---
title: "GPUDevice: phương thức createQuerySet()"
short-title: createQuerySet()
slug: Web/API/GPUDevice/createQuerySet
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createQuerySet
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createQuerySet()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUQuerySet")}} có thể dùng để ghi lại kết quả của các truy vấn trên các pass, chẳng hạn truy vấn occlusion hoặc timestamp.

## Cú pháp

```js-nolint
createQuerySet(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả query set cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUQuerySet")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
