---
title: "GPUPipelineLayout: label property"
short-title: label
slug: Web/API/GPUPipelineLayout/label
page-type: web-api-instance-property
browser-compat: api.GPUPipelineLayout.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUPipelineLayout")}} cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUDevice.createPipelineLayout()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUPipelineLayout`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUPipelineLayout.label`:

```js
// …

const pipelineLayout = device.createPipelineLayout({
  bindGroupLayouts: [bindGroupLayout],
});

pipelineLayout.label = "my_pipeline_layout";

console.log(pipelineLayout.label); // "my_pipeline_layout"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.createPipelineLayout()")}} nguồn gốc, sau đó lấy qua `GPUPipelineLayout.label`:

```js
// …

const pipelineLayout = device.createPipelineLayout({
  bindGroupLayouts: [bindGroupLayout],
  label: "my_pipeline_layout",
});

console.log(pipelineLayout.label); // "my_pipeline_layout"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
