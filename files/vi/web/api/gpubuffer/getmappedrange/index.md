---
title: "GPUBuffer: getMappedRange() method"
short-title: getMappedRange()
slug: Web/API/GPUBuffer/getMappedRange
page-type: web-api-instance-method
browser-compat: api.GPUBuffer.getMappedRange
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getMappedRange()`** của giao diện {{domxref("GPUBuffer")}} trả về {{jsxref("ArrayBuffer")}} chứa nội dung được ánh xạ của `GPUBuffer` trong phạm vi được chỉ định.

Điều này chỉ có thể xảy ra sau khi `GPUBuffer` được ánh xạ thành công bằng {{domxref("GPUBuffer.mapAsync()")}} (có thể kiểm tra qua {{domxref("GPUBuffer.mapState")}}). Khi `GPUBuffer` đang được ánh xạ, nó không thể được sử dụng trong bất kỳ lệnh GPU nào.

Khi bạn hoàn thành việc làm với các giá trị `GPUBuffer`, hãy gọi {{domxref("GPUBuffer.unmap()")}} để hủy ánh xạ nó, làm cho nó có thể truy cập bởi GPU lại. `TypeError` được ném ra nếu có cố gắng tách {{jsxref("ArrayBuffer")}} theo bất kỳ cách nào khác ngoài qua {{domxref("GPUBuffer.unmap()")}}, chẳng hạn như bằng cách gọi {{jsxref("ArrayBuffer/transfer", "transfer()")}}.

## Cú pháp

```js-nolint
getMappedRange()
getMappedRange(offset)
getMappedRange(offset, size)
```

### Tham số

- `offset` {{optional_inline}}
  - : Số đại diện cho độ lệch, tính bằng byte, từ đầu phạm vi được ánh xạ của `GPUBuffer` đến đầu phạm vi sẽ được trả về trong {{jsxref("ArrayBuffer")}}. Nếu `offset` bị bỏ qua, mặc định là 0.
- `size` {{optional_inline}}
  - : Số đại diện cho kích thước, tính bằng byte, của {{jsxref("ArrayBuffer")}} cần trả về. Nếu `size` bị bỏ qua, phạm vi mở rộng đến cuối phạm vi được ánh xạ của `GPUBuffer`.

### Giá trị trả về

{{jsxref("ArrayBuffer")}}.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`getMappedRange()`**, nếu không `OperationError` {{domxref("DOMException")}} sẽ được ném ra:

- `offset` là bội số của 8.
- Tổng phạm vi cần ánh xạ (`size` nếu được chỉ định, hoặc độ dài phạm vi được ánh xạ - `offset` nếu không) là bội số của 4.
- Tổng phạm vi nằm trong phạm vi được ánh xạ và không chồng chéo với các phạm vi {{jsxref("ArrayBuffer")}} được chỉ định bởi bất kỳ lệnh gọi `getMappedRange()` đang hoạt động nào khác.

## Ví dụ

Xem [trang `GPUBuffer` chính](/en-US/docs/Web/API/GPUBuffer#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
