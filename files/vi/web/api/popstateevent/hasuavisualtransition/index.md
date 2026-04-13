---
title: "PopStateEvent: hasUAVisualTransition property"
short-title: hasUAVisualTransition
slug: Web/API/PopStateEvent/hasUAVisualTransition
page-type: web-api-instance-property
browser-compat: api.PopStateEvent.hasUAVisualTransition
---

{{APIRef("History API")}}

Thuộc tính chỉ đọc **`hasUAVisualTransition`** của giao diện {{domxref("PopStateEvent")}} trả về `true` nếu user agent đã thực hiện chuyển đổi trực quan cho điều hướng này trước khi gửi sự kiện này, hoặc `false` trong trường hợp ngược lại.

Các user agent có thể cung cấp chuyển đổi trực quan tích hợp khi thực hiện điều hướng trang. Nếu tác giả trang cũng thêm chuyển đổi trực quan, chuyển đổi của user agent và tác giả có thể xung đột và gây nhầm lẫn cho người dùng. Thuộc tính này cho phép bạn phát hiện xem có chuyển đổi UA được cung cấp không để bạn có thể bỏ qua chuyển đổi của tác giả nhằm mang lại trải nghiệm người dùng tốt hơn.

## Giá trị

Giá trị boolean.

## Ví dụ

```js
window.addEventListener("popstate", async (event) => {
  // Fetch the new content
  const newContent = await fetchNewContent(location.href);

  // The UA does not support View Transitions, or the UA
  // already provided a Visual Transition by itself (e.g. swipe back).
  // In either case, update the DOM directly
  if (!document.startViewTransition || event.hasUAVisualTransition) {
    doSinglePageAppNav(newContent);
    return;
  }

  // Update the content using a View Transition
  document.startViewTransition(() => {
    doSinglePageAppNav(newContent);
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- [Same-document view transitions for single-page applications](https://developer.chrome.com/docs/web-platform/view-transitions/same-document)
