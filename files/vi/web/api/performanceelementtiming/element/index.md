---
title: "PerformanceElementTiming: element property"
short-title: element
slug: Web/API/PerformanceElementTiming/element
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.element
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`element`** của giao diện {{domxref("PerformanceElementTiming")}} trả về một {{domxref("Element")}} là con trỏ tới phần tử được quan sát.

## Giá trị

Một {{domxref("Element")}}, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu phần tử là một phần tử [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).

## Ví dụ

### Ghi lại phần tử được quan sát

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Phần tử DOM được quan sát được ghi ra console.

```html
<img src="image.jpg" alt="a nice image" elementtiming="big-image" />
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.identifier === "big-image") {
      console.log(entry.element);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
