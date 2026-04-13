---
title: "GPUBuffer: mapAsync() method"
short-title: mapAsync()
slug: Web/API/GPUBuffer/mapAsync
page-type: web-api-instance-method
browser-compat: api.GPUBuffer.mapAsync
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`mapAsync()`** của giao diện {{domxref("GPUBuffer")}} ánh xạ phạm vi được chỉ định của `GPUBuffer`. Nó trả về {{jsxref("Promise")}} được giải quyết khi nội dung của `GPUBuffer` sẵn sàng để truy cập. Khi `GPUBuffer` đang được ánh xạ, nó không thể được sử dụng trong bất kỳ lệnh GPU nào.

Khi buffer được ánh xạ thành công (có thể kiểm tra qua {{domxref("GPUBuffer.mapState")}}), các lệnh gọi đến {{domxref("GPUBuffer.getMappedRange()")}} sẽ trả về {{jsxref("ArrayBuffer")}} chứa các giá trị hiện tại của `GPUBuffer`, để đọc và cập nhật bởi JavaScript theo yêu cầu.

Khi bạn hoàn thành việc làm với các giá trị `GPUBuffer`, hãy gọi {{domxref("GPUBuffer.unmap()")}} để hủy ánh xạ nó, làm cho nó có thể truy cập bởi GPU lại.

## Cú pháp

```js-nolint
mapAsync(mode)
mapAsync(mode, offset, size)
```

### Tham số

- `mode`
  - : {{glossary("bitwise flags", "Cờ bitwise")}} xác định xem `GPUBuffer` được ánh xạ để đọc hay ghi. Các giá trị có thể là:
    - `GPUMapMode.READ`
      - : `GPUBuffer` được ánh xạ để đọc. Các giá trị có thể được đọc, nhưng bất kỳ thay đổi nào được thực hiện đối với {{jsxref("ArrayBuffer")}} được trả về bởi {{domxref("GPUBuffer.getMappedRange()")}} sẽ bị loại bỏ khi {{domxref("GPUBuffer.unmap()")}} được gọi.

        Ánh xạ chế độ đọc chỉ có thể được sử dụng trên các `GPUBuffer` có cách sử dụng `GPUBufferUsage.MAP_READ` được đặt trên chúng (tức là khi được tạo bằng {{domxref("GPUDevice.createBuffer()")}}).

    - `GPUMapMode.WRITE`
      - : `GPUBuffer` được ánh xạ để ghi. Các giá trị có thể được đọc và cập nhật, bất kỳ thay đổi nào được thực hiện đối với {{jsxref("ArrayBuffer")}} được trả về bởi {{domxref("GPUBuffer.getMappedRange()")}} sẽ được lưu vào `GPUBuffer` khi {{domxref("GPUBuffer.unmap()")}} được gọi.

        Ánh xạ chế độ ghi chỉ có thể được sử dụng trên các `GPUBuffer` có cách sử dụng `GPUBufferUsage.MAP_WRITE` được đặt trên chúng (tức là khi được tạo bằng {{domxref("GPUDevice.createBuffer()")}}).

- `offset` {{optional_inline}}
  - : Số đại diện cho độ lệch, tính bằng byte, từ đầu buffer đến đầu phạm vi cần ánh xạ. Nếu `offset` bị bỏ qua, mặc định là 0.
- `size` {{optional_inline}}
  - : Số đại diện cho kích thước, tính bằng byte, của phạm vi cần ánh xạ. Nếu `size` bị bỏ qua, phạm vi được ánh xạ mở rộng đến cuối `GPUBuffer`.

### Giá trị trả về

{{jsxref("Promise")}} được giải quyết với {{jsxref("Undefined")}} khi nội dung của `GPUBuffer` sẵn sàng để truy cập.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`mapAsync()`**, nếu không `OperationError` {{domxref("DOMException")}} sẽ được ném ra, promise bị từ chối và {{domxref("GPUValidationError")}} được tạo ra:

- `offset` là bội số của 8.
- Tổng phạm vi cần ánh xạ (`size` nếu được chỉ định, hoặc {{domxref("GPUBuffer.size")}} - `offset` nếu không) là bội số của 4.
- Tổng phạm vi cần ánh xạ nằm trong giới hạn của `GPUBuffer`.
- Nếu chế độ là `GPUMapMode.READ`, `GPUBuffer` có cách sử dụng `GPUBufferUsage.MAP_READ`.
- Nếu chế độ là `GPUMapMode.WRITE`, `GPUBuffer` có cách sử dụng `GPUBufferUsage.MAP_WRITE`.

## Ví dụ

Xem [trang `GPUBuffer` chính](/en-US/docs/Web/API/GPUBuffer#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
