---
title: "PerformanceElementTiming: id property"
short-title: id
slug: Web/API/PerformanceElementTiming/id
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.id
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("PerformanceElementTiming")}} trả về [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử liên kết.

## Giá trị

Một chuỗi.

## Ví dụ

### Sử dụng `id`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Nó sẽ ghi `myImage` ra console, đây là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử hình ảnh.

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
      console.log(entry.id);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
