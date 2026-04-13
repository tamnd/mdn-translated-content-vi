---
title: "Profiler: stop() method"
short-title: stop()
slug: Web/API/Profiler/stop
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Profiler.stop
---

{{APIRef("JS Self-Profiling API")}}{{SeeCompatTable}}

Phương thức **`stop()`** của giao diện {{domxref("Profiler")}} dừng profiler và trả về một {{jsxref("Promise")}} phân giải thành dữ liệu profile.

## Cú pháp

```js-nolint
stop()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành đối tượng chứa dữ liệu profile. Định dạng và cách giải thích đối tượng này được mô tả trong [Cấu trúc và định dạng Profile](/en-US/docs/Web/API/JS_Self-Profiling_API/Profile_content_and_format).

## Ví dụ

### Ghi lại một profile

Code sau đây tạo profile cho thao tác `doWork()` và ghi log kết quả.

```js
const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 10000 });

doWork();

const profile = await profiler.stop();
console.log(JSON.stringify(profile));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
