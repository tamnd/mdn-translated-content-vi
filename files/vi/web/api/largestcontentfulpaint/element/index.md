---
title: "LargestContentfulPaint: thuộc tính element"
short-title: element
slug: Web/API/LargestContentfulPaint/element
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.element
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`element`** của giao diện {{domxref("LargestContentfulPaint")}} trả về một đối tượng đại diện cho {{domxref("Element")}} là lần vẽ nội dung lớn nhất.

## Giá trị

Một {{domxref("Element")}}.

## Ví dụ

### Ghi nhật ký phần tử vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.element);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
