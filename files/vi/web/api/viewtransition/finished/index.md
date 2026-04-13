---
title: "ViewTransition: finished property"
short-title: finished
slug: Web/API/ViewTransition/finished
page-type: web-api-instance-property
browser-compat: api.ViewTransition.finished
---

{{APIRef("View Transition API")}}

Thuộc tính chỉ đọc **`finished`** của giao diện {{domxref("ViewTransition")}} là một {{jsxref("Promise")}} được hoàn thành khi hoạt ảnh transition kết thúc và chế độ xem trang mới hiển thị và có thể tương tác với người dùng.

`finished` chỉ bị từ chối trong trường hợp transition cùng tài liệu (SPA), nếu callback được truyền cho {{domxref("Document.startViewTransition()", "document.startViewTransition()")}} ném lỗi hoặc trả về một promise bị từ chối. Điều này sẽ chỉ ra rằng trạng thái mới của trang chưa được tạo ra.

Nếu hoạt ảnh transition không thể bắt đầu hoặc bị bỏ qua trong quá trình transition bằng {{domxref("ViewTransition.skipTransition()")}}, trạng thái cuối vẫn được đạt đến, vì vậy `finished` vẫn sẽ được hoàn thành.

## Giá trị

Một Promise.

## Ví dụ

### Các transition khác nhau cho các điều hướng khác nhau

Đôi khi các điều hướng nhất định sẽ yêu cầu các transition được điều chỉnh riêng, ví dụ, điều hướng "quay lại" có thể muốn một transition khác so với điều hướng "tiến". Cách tốt nhất để xử lý các trường hợp như vậy là đặt tên class trên phần tử `<html>`, xử lý transition, áp dụng hoạt ảnh đúng bằng bộ chọn phù hợp, sau đó xóa tên class khi transition kết thúc.

```js
async function handleTransition() {
  if (isBackNavigation) {
    document.documentElement.classList.add("back-transition");
  }

  const transition = document.startViewTransition(() =>
    updateTheDOMSomehow(data),
  );

  try {
    await transition.finished;
  } finally {
    document.documentElement.classList.remove("back-transition");
  }
}
```

> [!NOTE]
> `isBackNavigation` không phải là tính năng tích hợp sẵn; đây là một hàm giả thuyết có thể được thực hiện bằng [Navigation API](/en-US/docs/Web/API/Navigation_API) hoặc tương tự.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
