---
title: GPUQuerySet
slug: Web/API/GPUQuerySet
page-type: web-api-interface
browser-compat: api.GPUQuerySet
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUQuerySet`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} được sử dụng để ghi lại kết quả các truy vấn trong các lượt xử lý, chẳng hạn như truy vấn che khuất hoặc truy vấn dấu thời gian.

- Truy vấn che khuất có sẵn trong các lượt kết xuất để truy vấn xem có mẫu phân mảnh nào vượt qua tất cả các bài kiểm tra theo phân mảnh cho một tập hợp các lệnh vẽ hay không. Để chạy truy vấn che khuất, cần cung cấp `GPUQuerySet` thích hợp làm giá trị của thuộc tính mô tả `occlusionQuerySet` khi gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} để chạy lượt kết xuất.

- Truy vấn dấu thời gian cho phép ứng dụng ghi dấu thời gian vào `GPUQuerySet`. Để chạy truy vấn dấu thời gian, cần cung cấp các `GPUQuerySet` thích hợp bên trong giá trị của thuộc tính mô tả `timestampWrites` khi gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} để chạy lượt kết xuất, hoặc {{domxref("GPUCommandEncoder.beginComputePass()")}} để chạy lượt tính toán.

> [!NOTE]
> Tính năng `timestamp-query` cần được bật để sử dụng truy vấn dấu thời gian.

Đối tượng `GPUQuerySet` được tạo bằng phương thức {{domxref("GPUDevice.createQuerySet()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUQuerySet.count", "count")}} {{ReadOnlyInline}}
  - : Một số chỉ định số lượng truy vấn được quản lý bởi `GPUQuerySet`.
- {{domxref("GPUQuerySet.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.
- {{domxref("GPUQuerySet.type", "type")}} {{ReadOnlyInline}}
  - : Một giá trị liệt kê chỉ định loại truy vấn được quản lý bởi `GPUQuerySet`.

## Phương thức phiên bản

- {{domxref("GPUQuerySet.destroy", "destroy()")}}
  - : Hủy `GPUQuerySet`.

## Ví dụ

Đoạn mã sau tạo một `GPUQuerySet` chứa 32 kết quả truy vấn che khuất, rồi trả về `type` và `count`:

```js
const querySet = device.createQuerySet({
  type: "occlusion",
  count: 32,
});

console.log(querySet.count); // 32
console.log(querySet.type); // "occlusion"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
