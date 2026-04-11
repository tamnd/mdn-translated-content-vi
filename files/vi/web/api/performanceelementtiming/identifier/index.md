---
title: "PerformanceElementTiming: identifier property"
short-title: identifier
slug: Web/API/PerformanceElementTiming/identifier
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.identifier
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`identifier`** của giao diện {{domxref("PerformanceElementTiming")}} trả về giá trị của thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) trên phần tử.

## Giá trị

Một chuỗi.

## Ví dụ

### Sử dụng `identifier`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Giá trị của [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) là `big-image`. Do đó, việc gọi `entry.identifier` trả về chuỗi `big-image`.

```html
<img
  src="image.jpg"
  alt="a nice image"
  elementtiming="big-image"
  id="myImage" />
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.identifier === "big-image") {
      console.log(entry.naturalWidth);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
