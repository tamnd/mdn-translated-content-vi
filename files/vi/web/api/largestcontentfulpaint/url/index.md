---
title: "LargestContentfulPaint: thuộc tính url"
short-title: url
slug: Web/API/LargestContentfulPaint/url
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.url
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("LargestContentfulPaint")}} trả về URL yêu cầu của phần tử, nếu phần tử đó là hình ảnh.

## Giá trị

Một chuỗi chứa URL.

## Ví dụ

### Ghi nhật ký url của lần vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.url);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
