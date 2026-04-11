---
title: "PerformanceElementTiming: intersectionRect property"
short-title: intersectionRect
slug: Web/API/PerformanceElementTiming/intersectionRect
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.intersectionRect
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`intersectionRect`** của giao diện {{domxref("PerformanceElementTiming")}} trả về hình chữ nhật của phần tử trong viewport.

## Giá trị

Một {{domxref("DOMRectReadOnly")}} là hình chữ nhật của phần tử trong viewport.

Đối với hình ảnh hiển thị, đây là hình chữ nhật hiển thị của hình ảnh trong viewport. Đối với văn bản, đây là hình chữ nhật hiển thị của nút trong viewport. Đây là hình chữ nhật nhỏ nhất chứa tất cả các nút văn bản thuộc phần tử.

## Ví dụ

### Ghi lại `intersectionRect`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Gọi `entry.intersectionRect` trả về một đối tượng {{domxref("DOMRectReadOnly")}} với hình chữ nhật hiển thị của hình ảnh.

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
      console.log(entry.intersectionRect);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
