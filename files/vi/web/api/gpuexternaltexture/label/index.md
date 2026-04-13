---
title: "GPUExternalTexture: label property"
short-title: label
slug: Web/API/GPUExternalTexture/label
page-type: web-api-instance-property
browser-compat: api.GPUExternalTexture.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUExternalTexture")}} cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUDevice.importExternalTexture()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUExternalTexture`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUExternalTexture.label`:

```js
// …

const externalTexture = device.importExternalTexture({
  source: video,
});

externalTexture.label = "my_ext_texture";

console.log(externalTexture.label); // "my_ext_texture"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.importExternalTexture()")}} nguồn gốc, sau đó lấy qua `GPUExternalTexture.label`:

```js
// …

const externalTexture = device.importExternalTexture({
  source: video,
  label: "my_ext_texture",
});

console.log(externalTexture.label); //  "my_ext_texture"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
