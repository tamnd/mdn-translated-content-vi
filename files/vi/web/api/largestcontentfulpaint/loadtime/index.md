---
title: "LargestContentfulPaint: thuộc tính loadTime"
short-title: loadTime
slug: Web/API/LargestContentfulPaint/loadTime
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.loadTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`loadTime`** của giao diện {{domxref("LargestContentfulPaint")}} trả về thời điểm phần tử được tải.

## Giá trị

Một {{domxref("DOMHighResTimeStamp","dấu thời gian")}} đại diện cho thời gian tính bằng mili giây khi phần tử được tải.

## Ví dụ

### Ghi nhật ký loadTime của lần vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.loadTime);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
