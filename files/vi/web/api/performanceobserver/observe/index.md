---
title: "PerformanceObserver: phương thức observe()"
short-title: observe()
slug: Web/API/PerformanceObserver/observe
page-type: web-api-instance-method
browser-compat: api.PerformanceObserver.observe
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`observe()`** của giao diện **{{domxref("PerformanceObserver")}}** được dùng để chỉ định tập hợp các kiểu performance entry cần quan sát.

Xem {{domxref("PerformanceEntry.entryType")}} để biết danh sách các kiểu entry và {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}} để biết danh sách các kiểu entry mà user agent hỗ trợ.

Khi một performance entry phù hợp được ghi nhận, hàm callback của performance observer—được thiết lập khi tạo {{domxref("PerformanceObserver")}}—sẽ được gọi.

## Cú pháp

```js-nolint
observe(options)
```

### Tham số

- `options`
  - : Một đối tượng với các thành viên có thể có sau:
    - `buffered`
      - : Một cờ boolean cho biết các entry đã lưu đệm có nên được xếp vào bộ đệm của observer hay không. Chỉ được dùng cùng với tùy chọn `type`.
    - `durationThreshold`
      - : Một {{domxref("DOMHighResTimeStamp")}} xác định ngưỡng cho các entry {{domxref("PerformanceEventTiming")}}. Mặc định là 104ms và được làm tròn đến bội số gần nhất của 8ms. Ngưỡng thấp nhất có thể là 16ms. Không được dùng cùng với tùy chọn `entryTypes`.
    - `entryTypes`
      - : Một mảng các chuỗi, mỗi chuỗi chỉ định một kiểu performance entry cần quan sát. Không được dùng cùng với các tùy chọn `type`, `buffered`, hoặc `durationThreshold`.

        Xem {{domxref("PerformanceEntry.entryType")}} để biết danh sách tên kiểu performance entry hợp lệ. Các kiểu không được nhận dạng sẽ bị bỏ qua, mặc dù trình duyệt có thể xuất ra một thông báo cảnh báo đến console để giúp nhà phát triển gỡ lỗi code. Nếu không tìm thấy kiểu hợp lệ nào, `observe()` sẽ không có hiệu lực.

    - `type`
      - : Một chuỗi duy nhất chỉ định chính xác một kiểu performance entry cần quan sát. Không được dùng cùng với tùy chọn `entryTypes`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Theo dõi nhiều kiểu performance entry

Ví dụ này tạo một `PerformanceObserver` và theo dõi các kiểu entry `"mark"` và `"measure"` như được chỉ định bởi tùy chọn `entryTypes` trong phương thức `observe()`.

```js
const observer = new PerformanceObserver((list, obj) => {
  list.getEntries().forEach((entry) => {
    // Xử lý các sự kiện "mark" và "measure"
  });
});
observer.observe({ entryTypes: ["mark", "measure"] });
```

### Theo dõi một kiểu performance entry duy nhất

Ví dụ sau truy xuất các sự kiện đã lưu đệm và đăng ký các sự kiện mới cho các sự kiện resource timing ({{domxref("PerformanceResourceTiming")}}) bằng cách dùng các tùy chọn cấu hình `buffered` và `type`. Bất cứ khi nào bạn cần cấu hình observer để dùng tùy chọn `buffered` hoặc `durationThreshold`, hãy dùng `type` thay vì `entryType`. Việc thu thập nhiều kiểu performance entry sẽ không hoạt động nếu không làm như vậy.

```js
const observer = new PerformanceObserver((list, obj) => {
  list.getEntries().forEach((entry) => {
    // Xử lý các sự kiện "resource"
  });
});
observer.observe({ type: "resource", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
