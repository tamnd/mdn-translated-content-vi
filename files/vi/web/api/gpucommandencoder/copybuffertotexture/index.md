---
title: "GPUCommandEncoder: copyBufferToTexture() method"
short-title: copyBufferToTexture()
slug: Web/API/GPUCommandEncoder/copyBufferToTexture
page-type: web-api-instance-method
browser-compat: api.GPUCommandEncoder.copyBufferToTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}

Phương thức **`copyBufferToTexture()`** của giao diện {{domxref("GPUCommandEncoder")}} mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUBuffer")}} sang một {{domxref("GPUTexture")}}.

## Cú pháp

```js-nolint
copyBufferToTexture(source, destination, copySize)
```

### Tham số

- `source`
  - : Đối tượng mô tả buffer nguồn và bố cục dữ liệu của nó.
- `destination`
  - : Đối tượng mô tả texture đích.
- `copySize`
  - : Kích thước vùng được sao chép.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
