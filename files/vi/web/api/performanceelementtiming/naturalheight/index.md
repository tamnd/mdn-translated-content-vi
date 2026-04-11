---
title: "PerformanceElementTiming: naturalHeight property"
short-title: naturalHeight
slug: Web/API/PerformanceElementTiming/naturalHeight
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.naturalHeight
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`naturalHeight`** của giao diện {{domxref("PerformanceElementTiming")}} trả về chiều cao nội tại của phần tử hình ảnh.

## Giá trị

Một số nguyên không dấu 32-bit (unsigned long) là chiều cao nội tại của hình ảnh nếu áp dụng cho hình ảnh, `0` cho văn bản.

## Ví dụ

### Ghi lại `naturalHeight`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Tệp hình ảnh có chiều rộng 1000px và chiều cao 750px. Gọi `entry.naturalHeight` trả về `750`, đó là chiều cao nội tại tính bằng pixel.

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
      console.log(entry.naturalHeight);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
