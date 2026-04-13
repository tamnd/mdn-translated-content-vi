---
title: "LargestContentfulPaint: thuộc tính id"
short-title: id
slug: Web/API/LargestContentfulPaint/id
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.id
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("LargestContentfulPaint")}} trả về ID của phần tử là lần vẽ nội dung lớn nhất.

## Giá trị

Một chuỗi chứa ID của phần tử, hoặc chuỗi rỗng nếu không có ID như vậy.

## Ví dụ

### Ghi nhật ký ID phần tử vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.id);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
