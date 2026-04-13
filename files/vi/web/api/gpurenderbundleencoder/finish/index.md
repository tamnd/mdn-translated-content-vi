---
title: "GPURenderBundleEncoder: phương thức finish()"
short-title: finish()
slug: Web/API/GPURenderBundleEncoder/finish
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.finish
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`finish()`** của giao diện {{domxref("GPURenderBundleEncoder")}} hoàn thành việc ghi lại chuỗi lệnh gói kết xuất hiện tại, trả về một đối tượng {{domxref("GPURenderBundle")}} có thể được truyền vào lệnh gọi {{domxref("GPURenderPassEncoder.executeBundles()")}} để thực thi các lệnh đó trong một lần thực thi kết xuất cụ thể.

## Cú pháp

```js-nolint
finish(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `label` {{optional_inline}}
      - : Một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

### Giá trị trả về

Một đối tượng {{domxref("GPURenderBundle")}}.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`finish()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderBundleEncoder")}} sẽ không hợp lệ:

- {{domxref("GPURenderBundleEncoder")}} đang mở (tức là chưa kết thúc bằng lệnh gọi `finish()`).
- Ngăn xếp gỡ lỗi cho lần thực thi kết xuất hiện tại trống (tức là không có nhóm gỡ lỗi lần thực thi kết xuất nào đang mở, như được mở bởi {{domxref("GPURenderBundleEncoder.pushDebugGroup", "pushDebugGroup()")}}).

## Ví dụ

```js
const renderBundleEncoder = device.createRenderBundleEncoder({
  colorFormats: [presentationFormat],
});
recordRenderPass(renderBundleEncoder);
const renderBundle = renderBundleEncoder.finish();
```

Đoạn mã trên được lấy từ ví dụ WebGPU Samples [Animometer example](https://webgpu.github.io/webgpu-samples/samples/animometer/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
