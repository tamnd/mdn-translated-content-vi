---
title: "GPUSampler: label property"
short-title: label
slug: Web/API/GPUSampler/label
page-type: web-api-instance-property
browser-compat: api.GPUSampler.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUSampler")}} cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUDevice.createSampler()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUSampler`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUSampler.label`:

```js
// …

const sampler = device.createSampler({
  compare: "less",
});

sampler.label = "my_sampler";

console.log(sampler.label); // "my_sampler"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.createSampler()")}} nguồn gốc, sau đó lấy qua `GPUSampler.label`:

```js
// …

const sampler = device.createSampler({
  compare: "less",
  label: "my_sampler",
});

console.log(sampler.label); // "my_sampler"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
