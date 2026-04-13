---
title: "IntersectionObserver: unobserve() method"
short-title: unobserve()
slug: Web/API/IntersectionObserver/unobserve
page-type: web-api-instance-method
browser-compat: api.IntersectionObserver.unobserve
---

{{APIRef("Intersection Observer API")}}

Phương thức **`unobserve()`** của giao diện {{domxref("IntersectionObserver")}} yêu cầu `IntersectionObserver` dừng quan sát phần tử đích được chỉ định.

## Cú pháp

```js-nolint
unobserve(target)
```

### Tham số

- `target`
  - : {{domxref("Element")}} cần dừng quan sát. Nếu phần tử được chỉ định không đang được quan sát, phương thức này không làm gì và không có ngoại lệ nào được ném ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã này minh họa việc tạo một trình quan sát, quan sát một phần tử, rồi dừng quan sát phần tử đó.

```js
const observer = new IntersectionObserver(callback);
observer.observe(document.getElementById("elementToObserve"));

// …

observer.unobserve(document.getElementById("elementToObserve"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API)
- {{domxref("IntersectionObserver.observe()")}}
