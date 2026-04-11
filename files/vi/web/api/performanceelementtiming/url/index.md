---
title: "PerformanceElementTiming: url property"
short-title: url
slug: Web/API/PerformanceElementTiming/url
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.url
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("PerformanceElementTiming")}} trả về URL ban đầu của yêu cầu tài nguyên khi phần tử là một hình ảnh.

## Giá trị

Một chuỗi là URL ban đầu của yêu cầu tài nguyên cho hình ảnh hoặc `0` cho văn bản.

## Ví dụ

### Ghi lại `url`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Gọi `entry.url` trả về `https://example.com/image.jpg`.

```html
<img
  src="https://example.com/image.jpg"
  alt="a nice image"
  elementtiming="big-image"
  id="myImage" />
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.identifier === "big-image") {
      console.log(entry.url);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
