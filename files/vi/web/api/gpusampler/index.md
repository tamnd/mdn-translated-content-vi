---
title: GPUSampler
slug: Web/API/GPUSampler
page-type: web-api-interface
browser-compat: api.GPUSampler
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUSampler`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một đối tượng có thể kiểm soát cách shader biến đổi và lọc dữ liệu tài nguyên kết cấu.

Đối tượng `GPUSampler` được tạo bằng phương thức {{domxref("GPUDevice.createSampler()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUSampler.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

Đoạn mã sau tạo một `GPUSampler` thực hiện lọc ba tuyến tính và lặp lại tọa độ kết cấu:

```js
// …
const sampler = device.createSampler({
  addressModeU: "repeat",
  addressModeV: "repeat",
  magFilter: "linear",
  minFilter: "linear",
  mipmapFilter: "linear",
});
```

Ví dụ [Shadow Mapping](https://webgpu.github.io/webgpu-samples/samples/shadowMapping/) trong WebGPU Samples sử dụng bộ lấy mẫu so sánh để lấy mẫu từ kết cấu độ sâu nhằm kết xuất bóng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
