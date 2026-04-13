---
title: "GPUQueue: onSubmittedWorkDone() method"
short-title: onSubmittedWorkDone()
slug: Web/API/GPUQueue/onSubmittedWorkDone
page-type: web-api-instance-method
browser-compat: api.GPUQueue.onSubmittedWorkDone
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`onSubmittedWorkDone()`** của giao diện {{domxref("GPUQueue")}} trả về một {{jsxref("Promise")}} phân giải khi tất cả công việc được gửi lên GPU thông qua `GPUQueue` này tại thời điểm phương thức được gọi đã được xử lý xong.

Điều này bao gồm việc hoàn thành mọi lệnh gọi {{domxref("GPUBuffer.mapAsync", "mapAsync()")}} thực hiện trên các `GPUBuffer` được dùng trong các lệnh gửi lên hàng đợi, trước khi `onSubmittedWorkDone()` được gọi.

Lưu ý: Trong hầu hết các trường hợp, bạn _không_ cần gọi `onSubmittedWorkDone()`. Bạn **không** cần gọi nó để ánh xạ một buffer. `mapAsync` đảm bảo rằng công việc gửi lên hàng đợi trước khi gọi `mapAsync` sẽ hoàn tất trước khi `mapAsync` trả về.

Hai trường hợp sử dụng `onSubmittedWorkDone`:

1. Chờ ánh xạ nhiều buffer (chậm)

   ```js
   // good
   await Promise.all([
     buffer1.mapAsync(),
     buffer2.mapAsync(),
     buffer3.mapAsync(),
   ]);
   data1 = buffer1.getMappedRange();
   data2 = buffer2.getMappedRange();
   data3 = buffer3.getMappedRange();
   ```

   ```js
   // works but slow
   buffer1.mapAsync();
   buffer2.mapAsync();
   buffer3.mapAsync();
   await device.queue.onSubmittedWorkDone();
   data1 = buffer1.getMappedRange();
   data2 = buffer2.getMappedRange();
   data3 = buffer3.getMappedRange();
   ```

   Lý do phương pháp thứ hai chậm là triển khai có thể ánh xạ các buffer trước khi tất cả công việc đã gửi hoàn tất. Ví dụ, nếu tất cả các buffer đã dùng xong nhưng vẫn còn công việc khác (không liên quan đến buffer) đã được gửi, bạn sẽ chờ lâu hơn khi dùng phương pháp thứ hai so với phương pháp đầu.

2. Giảm tốc độ công việc

   Nếu bạn đang thực hiện tính toán nặng và gửi quá nhiều công việc cùng lúc, trình duyệt có thể hủy công việc của bạn. Bạn có thể giảm tốc độ bằng cách chỉ gửi thêm công việc khi công việc đã gửi hoàn tất.

## Cú pháp

```js-nolint
onSubmittedWorkDone()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{jsxref("Undefined")}}.

## Ví dụ

```js
device.queue.submit([commandEncoder.finish()]);
device.queue.onSubmittedWorkDone().then(() => {
  console.log("All submitted commands processed.");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
