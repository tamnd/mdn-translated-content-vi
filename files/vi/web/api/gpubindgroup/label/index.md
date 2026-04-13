---
title: "GPUBindGroup: label property"
short-title: label
slug: Web/API/GPUBindGroup/label
page-type: web-api-instance-property
browser-compat: api.GPUBindGroup.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUBindGroup")}} cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUDevice.createBindGroup()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUBindGroup`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUBindGroup.label`:

```js
// …

const bindGroup = device.createBindGroup({
  layout: bindGroupLayout,
  entries: [
    {
      binding: 0,
      resource: {
        buffer: output,
      },
    },
  ],
});

bindGroup.label = "my_bind_group";

console.log(bindGroup.label); // "my_bind_group"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.createBindGroup()")}} nguồn gốc, sau đó lấy qua `GPUBindGroup.label`:

```js
// …

const bindGroup = device.createBindGroup({
  layout: bindGroupLayout,
  entries: [
    {
      binding: 0,
      resource: {
        buffer: output,
      },
    },
  ],
  label: "my_bind_group",
});

console.log(bindGroup.label); // "my_bind_group"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
