---
title: "ContentIndex: phương thức delete()"
short-title: delete()
slug: Web/API/ContentIndex/delete
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ContentIndex.delete
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("ContentIndex")}} hủy đăng ký một mục khỏi nội dung hiện đang được lập chỉ mục.

> [!NOTE]
> Việc gọi `delete()` chỉ ảnh hưởng đến chỉ mục. Nó không xóa bất cứ thứ gì khỏi {{domxref('Cache')}}.

## Cú pháp

```js-nolint
delete(id)
```

### Tham số

- `id`
  - : Mã định danh duy nhất của nội dung đã lập chỉ mục mà bạn muốn đối tượng {{domxref("ContentIndex")}} xóa.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

Không có ngoại lệ nào được ném ra.

## Ví dụ

Bên dưới là một hàm bất đồng bộ xóa một mục khỏi [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API). Chúng ta nhận tham chiếu tới {{domxref('ServiceWorkerRegistration')}} hiện tại, cho phép truy cập thuộc tính {{domxref('ServiceWorkerRegistration.index','index')}} và từ đó truy cập phương thức `delete`.

```js
async function unregisterContent(article) {
  // tham chiếu registration
  const registration = await navigator.serviceWorker.ready;

  // phát hiện Content Index
  if (!registration.index) return;

  // hủy đăng ký nội dung khỏi chỉ mục
  await registration.index.delete(article.id);
}
```

Phương thức `delete` cũng có thể được dùng trong phạm vi [service worker](/en-US/docs/Web/API/ServiceWorker).

```js
self.registration.index.delete("my-id");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết nhập môn về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
