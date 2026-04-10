---
title: Push API
slug: Web/API/Push_API
page-type: web-api-overview
browser-compat:
  - api.PushEvent
  - api.PushMessageData
---

{{DefaultAPISidebar("Push API")}}{{AvailableInWorkers}}

**Push API** cho phép ứng dụng web nhận các thông điệp được đẩy từ máy chủ, bất kể ứng dụng có đang ở tiền cảnh, hoặc thậm chí có đang được tải hay không, trong user agent. Điều này cho phép nhà phát triển gửi thông báo bất đồng bộ và các bản cập nhật tới người dùng đã chọn tham gia, từ đó cải thiện mức độ tương tác bằng nội dung mới kịp thời.

## Khái niệm và cách dùng Push

> [!WARNING]
> Khi triển khai các đăng ký `PushManager`, điều cực kỳ quan trọng là bạn phải bảo vệ ứng dụng khỏi các vấn đề CSRF/XSRF. Xem các bài viết sau để biết thêm:
>
> - [Cross-Site Request Forgery (CSRF) Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html)
> - [Preventing CSRF and XSRF Attacks](https://blog.codinghorror.com/preventing-csrf-and-xsrf-attacks/)

Để một ứng dụng nhận được thông điệp push, ứng dụng đó phải có một [service worker](/en-US/docs/Web/API/Service_Worker_API) đang hoạt động. Khi service worker hoạt động, nó có thể đăng ký nhận thông báo push bằng {{domxref("PushManager.subscribe()")}}.

{{domxref("PushSubscription")}} thu được bao gồm toàn bộ thông tin mà ứng dụng cần để gửi một thông điệp push: một endpoint và khóa mã hóa cần để gửi dữ liệu.

Service worker sẽ được khởi động khi cần để xử lý các thông điệp push đến, và các thông điệp này sẽ được chuyển tới trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.push_event", "onpush")}}. Điều này cho phép ứng dụng phản ứng khi nhận được thông điệp push, chẳng hạn bằng cách hiển thị thông báo (sử dụng {{domxref("ServiceWorkerRegistration.showNotification()")}}).

Mỗi đăng ký là duy nhất đối với một service worker. Endpoint của đăng ký là một [URL khả năng](https://w3ctag.github.io/capability-urls/) duy nhất. Chỉ cần biết endpoint là đủ để gửi thông điệp tới ứng dụng của bạn. Vì vậy, URL endpoint cần được giữ bí mật, nếu không ứng dụng khác có thể gửi thông điệp push vào ứng dụng của bạn.

Việc kích hoạt service worker để gửi một thông điệp push có thể làm tăng mức sử dụng tài nguyên, đặc biệt là pin. Các trình duyệt khác nhau có cơ chế xử lý khác nhau, và hiện vẫn chưa có cơ chế chuẩn. Firefox cho phép một số lượng giới hạn (hạn ngạch) thông điệp push được gửi tới một ứng dụng, mặc dù các thông điệp push tạo ra thông báo thì được miễn giới hạn này. Giới hạn được làm mới mỗi khi trang web được truy cập. Trong Chrome thì không có giới hạn.

## Giao diện

- {{domxref("PushEvent")}}
  - : Đại diện cho một hành động push, được gửi tới [global scope](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của một {{domxref("ServiceWorker")}}. Nó chứa thông tin được gửi từ ứng dụng tới {{domxref("PushSubscription")}}.
- {{domxref("PushManager")}}
  - : Cung cấp một cách để nhận thông báo từ các máy chủ bên thứ ba, cũng như yêu cầu URL cho các thông báo push.
- {{domxref("PushMessageData")}}
  - : Cung cấp quyền truy cập vào dữ liệu push do máy chủ gửi, cùng các phương thức để thao tác dữ liệu nhận được.
- {{domxref("PushSubscription")}}
  - : Cung cấp endpoint URL của một đăng ký, và cho phép hủy đăng ký khỏi dịch vụ push.
- {{domxref("PushSubscriptionOptions")}}
  - : Đại diện cho các tùy chọn gắn với đăng ký push.

## Các bổ sung cho service worker

Những bổ sung sau cho [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) đã được định nghĩa trong đặc tả Push API để cung cấp một điểm vào cho việc sử dụng thông điệp Push. Chúng cũng theo dõi và phản hồi các sự kiện push và thay đổi đăng ký.

- {{domxref("ServiceWorkerRegistration.pushManager")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu tới giao diện {{domxref("PushManager")}} để quản lý các đăng ký push, bao gồm đăng ký, lấy đăng ký đang hoạt động và truy cập trạng thái quyền push. Đây là điểm vào để sử dụng push messaging.
- {{domxref("ServiceWorkerGlobalScope.push_event", "onpush")}}
  - : Trình xử lý sự kiện được kích hoạt bất cứ khi nào xảy ra sự kiện {{domxref("ServiceWorkerGlobalScope/push_event", "push")}}; tức là khi một thông điệp push từ máy chủ được nhận.
- {{domxref("ServiceWorkerGlobalScope.pushsubscriptionchange_event", "onpushsubscriptionchange")}}
  - : Trình xử lý sự kiện được kích hoạt bất cứ khi nào xảy ra sự kiện {{domxref("ServiceWorkerGlobalScope/pushsubscriptionchange_event", "pushsubscriptionchange")}}; ví dụ khi một đăng ký push đã bị vô hiệu hóa, hoặc sắp bị vô hiệu hóa, chẳng hạn khi dịch vụ push đặt thời gian hết hạn.

## Ví dụ

Kho [ServiceWorker Cookbook](https://github.com/mdn/serviceworker-cookbook) của Mozilla chứa nhiều ví dụ Push hữu ích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sending VAPID identified WebPush Notifications via Mozilla's Push Service](https://blog.mozilla.org/services/2016/08/23/sending-vapid-identified-webpush-notifications-via-mozillas-push-service/)
- [Push notifications overview](https://web.dev/articles/push-notifications-overview)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
