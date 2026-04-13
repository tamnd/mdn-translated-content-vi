---
title: "GPUTextureView: label property"
short-title: label
slug: Web/API/GPUTextureView/label
page-type: web-api-instance-property
browser-compat: api.GPUTextureView.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUTextureView")}} cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUTexture.createView()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUTextureView`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUTextureView.label`:

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

const view = depthTexture.createView();

view.label = "my_view";

console.log(view.label); // "my_view"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUTexture.createView()")}} nguồn gốc, sau đó lấy qua `GPUTextureView.label`:

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

const view = depthTexture.createView({
  label: "my_view",
});

console.log(view.label); // "my_view"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
