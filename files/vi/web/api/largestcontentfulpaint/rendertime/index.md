---
title: "LargestContentfulPaint: thuộc tính renderTime"
short-title: renderTime
slug: Web/API/LargestContentfulPaint/renderTime
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.renderTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`renderTime`** của giao diện {{domxref("LargestContentfulPaint")}} đại diện cho thời điểm phần tử được hiển thị trên màn hình.

## Giá trị

Thuộc tính `renderTime` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp","dấu thời gian")}} đại diện cho thời gian tính bằng mili giây khi phần tử được hiển thị trên màn hình.
- `0` hoặc một {{domxref("DOMHighResTimeStamp","dấu thời gian")}} được làm thô nếu tài nguyên là yêu cầu nguồn gốc chéo và không sử dụng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

### Thời gian hiển thị hình ảnh nguồn gốc chéo

Vì lý do bảo mật, giá trị của thuộc tính `renderTime` ban đầu là `0` nếu tài nguyên là yêu cầu nguồn gốc chéo.

Các trình duyệt [hiện có thể hiển thị thời gian hiển thị được làm thô một chút](https://github.com/w3c/paint-timing/issues/104) trong các tình huống này. Kiểm tra [hỗ trợ trình duyệt](#tương_thích_trình_duyệt).

Để hiển thị thông tin thời gian hiển thị nguồn gốc chéo chính xác hơn, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ: để cho phép `https://developer.mozilla.org` xem `renderTime` chính xác, tài nguyên nguồn gốc chéo nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

### Dùng `startTime` thay vì `renderTime`

Bất kể độ chính xác của `renderTime`, các nhà phát triển nên dùng {{domxref("PerformanceEntry.startTime", "startTime")}} thay vì `renderTime` làm thời gian LCP. Điều này trả về giá trị của `renderTime` của mục nếu nó không phải `0`, và ngược lại trả về giá trị {{domxref("LargestContentfulPaint.loadTime", "loadTime")}} của mục này, do đó loại bỏ nhu cầu kiểm tra giá trị 0 cho các trình duyệt không hỗ trợ.

## Ví dụ

### Ghi nhật ký renderTime của lần vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.renderTime);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
