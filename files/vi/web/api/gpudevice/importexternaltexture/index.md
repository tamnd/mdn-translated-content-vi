---
title: "GPUDevice: phương thức importExternalTexture()"
short-title: importExternalTexture()
slug: Web/API/GPUDevice/importExternalTexture
page-type: web-api-instance-method
browser-compat: api.GPUDevice.importExternalTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`importExternalTexture()`** của giao diện {{domxref("GPUDevice")}} lấy một {{domxref("HTMLVideoElement")}} làm đầu vào và trả về một đối tượng bao bọc {{domxref("GPUExternalTexture")}} chứa ảnh chụp của video có thể dùng trong các thao tác dựng hình GPU.

## Cú pháp

```js-nolint
importExternalTexture(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả video nguồn và tùy chọn nhập texture.

### Giá trị trả về

Một thể hiện {{domxref("GPUExternalTexture")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
