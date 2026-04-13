---
title: "ViewTransition: updateCallbackDone property"
short-title: updateCallbackDone
slug: Web/API/ViewTransition/updateCallbackDone
page-type: web-api-instance-property
browser-compat: api.ViewTransition.updateCallbackDone
---

{{APIRef("View Transition API")}}

Thuộc tính chỉ đọc **`updateCallbackDone`** của giao diện {{domxref("ViewTransition")}} là một {{jsxref("Promise")}} được hoàn thành khi promise được trả về bởi callback của phương thức {{domxref("Document.startViewTransition()", "document.startViewTransition()")}} được hoàn thành, hoặc bị từ chối khi nó bị từ chối.

`updateCallbackDone` hữu ích khi bạn không quan tâm đến sự thành công/thất bại của hoạt ảnh view transition cùng tài liệu (SPA), mà chỉ muốn biết liệu và khi nào DOM được cập nhật.

> [!NOTE]
> Trong trường hợp view transition liên tài liệu (MPA), promise `updateCallbackDone` của `ViewTransition` liên quan sẽ tự động được hoàn thành.

## Giá trị

Một Promise.

## Ví dụ

```js
// start new SPA view transition
const transition = document.startViewTransition(() => displayNewImage());

transition.updateCallbackDone.then(() => {
  // Respond to the DOM being updated successfully
});
```

Xem [Transitions as an enhancement](https://developer.chrome.com/docs/web-platform/view-transitions/#transitions-as-an-enhancement) để có ví dụ hữu ích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
