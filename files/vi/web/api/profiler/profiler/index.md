---
title: "Profiler: Profiler() constructor"
short-title: Profiler()
slug: Web/API/Profiler/Profiler
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.Profiler.Profiler
---

{{APIRef("JS Self-Profiling API")}}{{SeeCompatTable}}

Hàm khởi tạo **`Profiler()`** tạo một đối tượng {{domxref("Profiler")}} mới.

Sau khi được tạo, profiler mới sẽ bắt đầu thu thập các mẫu.

## Cú pháp

```js-nolint
new Profiler(options)
```

### Tham số

- `options`
  - : Các tùy chọn cho profiler này. Đây là một đối tượng chứa các thuộc tính sau:
    - `maxBufferSize`
      - : Một số cho biết số lượng mẫu tối đa cần lấy. Khi đạt đến con số này, trình duyệt sẽ kích hoạt sự kiện {{domxref("Profiler.samplebufferfull_event", "samplebufferfull")}} trên profiler và không có mẫu nào được ghi thêm.
    - `sampleInterval`
      - : Khoảng thời gian giữa các mẫu, tính bằng mili giây.

### Ngoại lệ

- `RangeError` {{domxref("DOMException")}}
  - : Được ném nếu tùy chọn `sampleInterval` nhỏ hơn không.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu tài liệu không được phục vụ với [document policy](https://wicg.github.io/document-policy/) bao gồm điểm cấu hình `"js-profiling"`.

## Ví dụ

Ví dụ này tạo một profiler sẽ lấy tối đa 1000 mẫu, lấy mẫu mỗi 10 mili giây.

```js
const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 1000 });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
