---
title: "PerformanceElementTiming: loadTime property"
short-title: loadTime
slug: Web/API/PerformanceElementTiming/loadTime
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.loadTime
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`loadTime`** của giao diện {{domxref("PerformanceElementTiming")}} luôn trả về `0` cho văn bản. Đối với hình ảnh, nó trả về thời gian là thời điểm muộn nhất giữa thời điểm tài nguyên hình ảnh được tải và thời điểm nó được gắn vào phần tử.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} với `loadTime` của phần tử. Luôn là `0` cho văn bản.

## Ví dụ

### Ghi lại `loadTime`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"`. Cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Gọi `entry.loadTime` trả về loadTime của phần tử hình ảnh.

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
      console.log(entry.loadTime);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
