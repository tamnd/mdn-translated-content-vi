---
title: "LargestContentfulPaint: thuộc tính size"
short-title: size
slug: Web/API/LargestContentfulPaint/size
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.size
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("LargestContentfulPaint")}} trả về kích thước nội tại của phần tử là lần vẽ nội dung lớn nhất.

`size` của phần tử là `width` nhân `height` của {{domxref("DOMRectReadOnly","hình chữ nhật")}} mà phần tử này tạo ra trên màn hình.

## Giá trị

Một số nguyên đại diện cho chiều rộng nhân chiều cao của phần tử.

## Ví dụ

### Ghi nhật ký kích thước phần tử vẽ nội dung lớn nhất

Ví dụ này sử dụng {{domxref("PerformanceObserver")}} thông báo về các mục hiệu suất `largest-contentful-paint` mới khi chúng được ghi vào dòng thời gian hiệu suất của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các mục trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log(lastEntry.size);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
