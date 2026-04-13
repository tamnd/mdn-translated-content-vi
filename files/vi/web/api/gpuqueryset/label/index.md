---
title: "GPUQuerySet: label property"
short-title: label
slug: Web/API/GPUQuerySet/label
page-type: web-api-instance-property
browser-compat: api.GPUQuerySet.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUQuerySet")}} là một chuỗi cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Có thể đặt giá trị này bằng cách cung cấp thuộc tính `label` trong đối tượng mô tả được truyền vào lệnh gọi {{domxref("GPUDevice.createQuerySet()")}} ban đầu, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUQuerySet`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUQuerySet.label`:

```js
const querySet = device.createQuerySet({
  type: "occlusion",
  count: 32,
});

querySet.label = "my_query_set";

console.log(querySet.label); // "my_query_set"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUDevice.createQuerySet()")}} ban đầu, sau đó lấy qua `GPUQuerySet.label`:

```js
const querySet = device.createQuerySet({
  type: "occlusion",
  count: 32,
  label: "my_query_set",
});

console.log(querySet.label); // "my_query_set"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
