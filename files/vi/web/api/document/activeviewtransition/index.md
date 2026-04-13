---
title: "Document: thuộc tính activeViewTransition"
short-title: activeViewTransition
slug: Web/API/Document/activeViewTransition
page-type: web-api-instance-property
browser-compat: api.Document.activeViewTransition
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`activeViewTransition`** của giao diện {{domxref("Document")}} trả về một instance {{domxref("ViewTransition")}} đại diện cho [view transition](/en-US/docs/Web/API/View_Transition_API) hiện đang hoạt động trên tài liệu.

{{domxref("ViewTransition")}} hiện tại có thể được truy cập theo các cách khác:

- Giá trị trả về của {{domxref("Document.startViewTransition()")}} trong trường hợp view transition cùng tài liệu.
- Thuộc tính `viewTransition` của các đối tượng sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}} và {{domxref("Window.pageswap_event", "pageswap")}} trong trường hợp view transition xuyên tài liệu.

Tuy nhiên, thuộc tính `activeViewTransition` cung cấp một cách nhất quán để truy cập view transition đang hoạt động trong bất kỳ ngữ cảnh nào, mà không cần phải lo lắng về việc lưu nó để truy cập dễ dàng sau này.

## Giá trị

Một {{domxref("ViewTransition")}} hoặc `null` nếu không có view transition nào đang hoạt động.

## Ví dụ

```js
// Start a view transition
document.startViewTransition(() => {
  // Update the UI to reflect the new state
  updateUI();
});

// Check if a view transition is currently active
if (document.activeViewTransition) {
  console.log("A view transition is currently active");
}

// Respond to view transition finishing
document.activeViewTransition.finished.then(() => {
  console.log("View transition finished");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.startViewTransition()")}}
- Sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}}
- Sự kiện {{domxref("Window.pageswap_event", "pageswap")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- {{domxref("ViewTransition")}}
