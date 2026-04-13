---
title: ExtendableCookieChangeEvent
slug: Web/API/ExtendableCookieChangeEvent
page-type: web-api-interface
browser-compat: api.ExtendableCookieChangeEvent
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("service")}}

Giao diện **`ExtendableCookieChangeEvent`** của {{domxref("Cookie Store API", "", "", "nocode")}} là loại sự kiện được truyền vào sự kiện {{domxref("ServiceWorkerGlobalScope/cookiechange_event", "cookiechange")}} được kích hoạt tại {{domxref("ServiceWorkerGlobalScope")}} khi xảy ra bất kỳ thay đổi cookie nào khớp với danh sách đăng ký thay đổi cookie của service worker. Sự kiện thay đổi cookie bao gồm cookie và loại (hoặc "changed" hoặc "deleted").

Các thay đổi cookie gây ra việc gửi `ExtendableCookieChangeEvent` là:

- Cookie mới được tạo và không bị xóa ngay lập tức, hoặc cookie bị thay thế.
  Trong trường hợp này `type` là "changed".
- Cookie mới được tạo và bị xóa ngay lập tức.
  Trong trường hợp này `type` là "deleted"
- Cookie bị xóa. Trong trường hợp này `type` là "deleted".

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ExtendableCookieChangeEvent.ExtendableCookieChangeEvent", "ExtendableCookieChangeEvent()")}}
  - : Tạo một `ExtendableCookieChangeEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("ExtendableEvent")}}._

- {{domxref("ExtendableCookieChangeEvent.changed")}} {{ReadOnlyInline}}
  - : Trả về mảng chứa các cookie đã thay đổi.
- {{domxref("ExtendableCookieChangeEvent.deleted")}} {{ReadOnlyInline}}
  - : Trả về mảng chứa các cookie đã bị xóa.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("ExtendableEvent")}}._

## Ví dụ

Trong ví dụ dưới đây, chúng ta sử dụng {{domxref("CookieStoreManager.getSubscriptions()")}} để lấy danh sách các đăng ký hiện có. (Trong service worker, cần có đăng ký để lắng nghe sự kiện.) Chúng ta hủy đăng ký khỏi các đăng ký hiện có bằng {{domxref("CookieStoreManager.unsubscribe()")}}, sau đó đăng ký vào cookie có tên 'COOKIE_NAME' bằng {{domxref("CookieStoreManager.subscribe()")}}. Nếu cookie đó thay đổi, trình nghe sự kiện sẽ ghi sự kiện vào console. Đây sẽ là đối tượng `ExtendableCookieChangeEvent`, với thuộc tính {{domxref("ExtendableCookieChangeEvent.changed","changed")}} hoặc {{domxref("ExtendableCookieChangeEvent.deleted","deleted")}} chứa cookie đã được sửa đổi.

```js
self.addEventListener("activate", (event) => {
  event.waitUntil(async () => {
    const subscriptions = await self.registration.cookies.getSubscriptions();

    await self.registration.cookies.unsubscribe(subscriptions);

    await self.registration.cookies.subscribe([
      {
        name: "COOKIE_NAME",
      },
    ]);
  });
});

self.addEventListener("cookiechange", (event) => {
  console.log(event);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
