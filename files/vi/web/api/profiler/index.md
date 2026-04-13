---
title: Profiler
slug: Web/API/Profiler
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Profiler
---

{{APIRef("JS Self-Profiling API")}}{{SeeCompatTable}}

Giao diện **`Profiler`** của [JS Self-Profiling API](/en-US/docs/Web/API/JS_Self-Profiling_API) cho phép bạn tạo một [profile](/en-US/docs/Web/API/JS_Self-Profiling_API/Profile_content_and_format) cho một phần thực thi ứng dụng web của bạn.

## Hàm khởi tạo

- {{domxref("Profiler.Profiler","Profiler()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Profiler` mới và bắt đầu thu thập các mẫu.

## Phương thức phiên bản

- {{domxref("Profiler.stop()")}} {{experimental_inline}}
  - : Dừng profiler, trả về một {{jsxref("Promise")}} phân giải thành [profile](/en-US/docs/Web/API/JS_Self-Profiling_API/Profile_content_and_format).

## Sự kiện

- {{domxref("Profiler.samplebufferfull_event", "samplebufferfull")}}
  - : Kích hoạt khi profile đã ghi đủ mẫu để lấp đầy bộ đệm nội bộ của nó.

## Ví dụ

### Ghi lại một profile

Code sau đây tạo profile cho thao tác `doWork()` và ghi log kết quả.

```js
const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 10000 });

doWork();

const profile = await profiler.stop();
console.log(JSON.stringify(profile));
```

### Tạo profile khi tải trang

Code sau đây tạo profile cho khoảng thời gian giữa khi script chạy lần đầu và sự kiện {{domxref("Window.load_event", "load")}} của window kích hoạt.

```js
const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 10000 });

window.addEventListener("load", async () => {
  const profile = await profiler.stop();
  console.log(JSON.stringify(profile));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
