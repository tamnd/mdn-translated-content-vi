---
title: Cookie Store API
slug: Web/API/Cookie_Store_API
page-type: web-api-overview
browser-compat:
  - api.CookieStore
  - api.CookieStoreManager
spec-urls: https://cookiestore.spec.whatwg.org/
---

{{securecontext_header}}{{DefaultAPISidebar("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

**Cookie Store API** là một API bất đồng bộ để quản lý cookie, khả dụng trong cửa sổ và cả [service worker](/en-US/docs/Web/API/Service_Worker_API).

## Khái niệm và cách dùng

Phương pháp gốc để lấy và đặt cookie là làm việc với {{domxref("document.cookie")}} để lấy và đặt thông tin cookie dưới dạng một chuỗi các cặp khóa/giá trị.
Ngoài việc cách này cồng kềnh và dễ gây lỗi, nó còn có hàng loạt vấn đề trong bối cảnh phát triển web hiện đại.

Giao diện `document.cookie` là {{Glossary("synchronous")}}, đơn luồng và chặn. Khi ghi một cookie, bạn phải chờ trình duyệt cập nhật chuỗi chứa toàn bộ cookie. Ngoài ra, việc phụ thuộc vào {{domxref("document")}} đồng nghĩa cookie không thể được truy cập bởi service worker, vì chúng không thể truy cập đối tượng `document`.

_Cookie Store API_ cung cấp một phương thức cập nhật hơn để quản lý cookie. Nó {{Glossary("asynchronous")}} và dựa trên promise, vì vậy không chặn vòng lặp sự kiện. Nó không phụ thuộc vào {{domxref("Document")}}, nên khả dụng với service worker. Các phương thức để lấy và đặt cookie cũng cung cấp phản hồi tốt hơn thông qua các thông báo lỗi. Điều này có nghĩa là nhà phát triển web không phải đặt cookie rồi lập tức đọc lại để kiểm tra xem thao tác đặt có thành công hay không.

## Giao diện

- {{domxref("CookieStore")}} {{Experimental_Inline}}
  - : Giao diện `CookieStore` cho phép lấy và đặt cookie.
- {{domxref("CookieStoreManager")}} {{Experimental_Inline}}
  - : Giao diện `CookieStoreManager` cung cấp một đăng ký service worker để cho phép service worker đăng ký nhận các sự kiện thay đổi cookie.
- {{domxref("CookieChangeEvent")}} {{Experimental_Inline}}
  - : Một `CookieChangeEvent` có tên `change` được phát tới các đối tượng `CookieStore` trong ngữ cảnh {{domxref("Window")}} khi có bất kỳ thay đổi nào đối với cookie mà script nhìn thấy được.
- {{domxref("ExtendableCookieChangeEvent")}}
  - : Một `ExtendableCookieChangeEvent` có tên `cookiechange` được phát trong các ngữ cảnh {{domxref("ServiceWorkerGlobalScope")}} khi có bất kỳ thay đổi nào đối với cookie mà script nhìn thấy được và khớp với danh sách đăng ký thay đổi cookie của service worker.

### Mở rộng cho các giao diện khác

- {{domxref("ServiceWorkerGlobalScope.cookieStore")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("CookieStore")}} gắn với service worker.
- {{domxref("ServiceWorkerRegistration.cookies")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("CookieStoreManager")}}, cho phép ứng dụng web đăng ký và hủy đăng ký nhận các sự kiện thay đổi cookie.
- {{domxref("Window.cookieStore")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("CookieStore")}} cho ngữ cảnh tài liệu hiện tại.
- {{domxref("ServiceWorkerGlobalScope/cookiechange_event", "cookiechange")}} event {{Experimental_Inline}}
  - : Được kích hoạt khi có bất kỳ thay đổi cookie nào xảy ra và khớp với danh sách đăng ký thay đổi cookie của service worker.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
