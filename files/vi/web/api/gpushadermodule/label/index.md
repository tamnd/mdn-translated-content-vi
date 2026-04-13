---
title: "GPUShaderModule: label property"
short-title: label
slug: Web/API/GPUShaderModule/label
page-type: web-api-instance-property
browser-compat: api.GPUShaderModule.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUShaderModule")}} cung cấp một nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lời gọi {{domxref("GPUDevice.createShaderModule()")}} gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUShaderModule`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn qua `GPUShaderModule.label`:

```js
// …

const shaderModule = device.createShaderModule({
  code: shaders,
});

shaderModule.label = "my_shader";

console.log(shaderModule.label); // "my_shader"
```

Đặt nhãn qua lời gọi {{domxref("GPUDevice.createShaderModule()")}} gốc, sau đó lấy qua `GPUShaderModule.label`:

```js
// …

const shaderModule = device.createShaderModule({
  code: shaders,
  label: "my_shader",
});

console.log(shaderModule.label); // "my_shader"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
