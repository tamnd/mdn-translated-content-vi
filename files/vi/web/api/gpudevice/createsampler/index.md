---
title: "GPUDevice: phương thức createSampler()"
short-title: createSampler()
slug: Web/API/GPUDevice/createSampler
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createSampler
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createSampler()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUSampler")}}, điều khiển cách shader biến đổi và lọc dữ liệu tài nguyên texture.

## Cú pháp

```js-nolint
createSampler(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Đối tượng mô tả sampler cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUSampler")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
