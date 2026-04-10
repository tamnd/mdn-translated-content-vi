---
title: PushSubscription
slug: Web/API/PushSubscription
page-type: web-api-interface
browser-compat: api.PushSubscription
---

{{ApiRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `PushSubscription` của [Push API](/en-US/docs/Web/API/Push_API) cung cấp điểm cuối URL của một đăng ký, cùng với khóa công khai và các bí mật nên được dùng để mã hóa các thông điệp đẩy gửi đến đăng ký này.
Thông tin này phải được chuyển cho máy chủ ứng dụng bằng bất kỳ phương thức nào phù hợp với ứng dụng.

Giao diện này cũng cung cấp thông tin về thời điểm đăng ký sẽ hết hạn, và một phương thức để hủy đăng ký.

## Thuộc tính thể hiện

- {{domxref("PushSubscription.endpoint")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa điểm cuối được liên kết với đăng ký đẩy.
- {{domxref("PushSubscription.expirationTime")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} của thời điểm hết hạn đăng ký được liên kết với đăng ký đẩy, nếu có, hoặc `null` trong trường hợp ngược lại.
- {{domxref("PushSubscription.options")}} {{ReadOnlyInline}}
  - : Một đối tượng chứa các tùy chọn đã dùng để tạo đăng ký.
- {{domxref("PushSubscription.subscriptionId")}} {{deprecated_inline}} {{ReadOnlyInline}} {{non-standard_inline}}
  - : Một chuỗi chứa mã định danh của đăng ký được liên kết với đăng ký đẩy.

## Phương thức thể hiện

- {{domxref("PushSubscription.getKey()")}}
  - : Trả về một {{jsxref("ArrayBuffer")}} chứa khóa công khai của máy khách, sau đó có thể được gửi đến máy chủ và dùng để mã hóa dữ liệu thông điệp đẩy.
- {{domxref("PushSubscription.toJSON()")}}
  - : Bộ tuần tự hóa chuẩn — trả về biểu diễn JSON của các thuộc tính đăng ký.
- {{domxref("PushSubscription.unsubscribe()")}}
  - : Bắt đầu quá trình bất đồng bộ để hủy đăng ký khỏi dịch vụ đẩy, trả về một {{jsxref("Promise")}} sẽ phân giải thành một giá trị boolean khi đăng ký hiện tại được hủy đăng ký thành công.

## Mô tả

Mỗi trình duyệt sử dụng một dịch vụ đẩy cụ thể.
Một service worker có thể dùng {{domxref("PushManager.subscribe()")}} để đăng ký vào dịch vụ được hỗ trợ, rồi dùng `PushSubscription` được trả về để tìm ra điểm cuối nơi các thông điệp đẩy sẽ được gửi đến.

`PushSubscription` cũng được dùng để lấy khóa công khai và bí mật mà máy chủ ứng dụng phải dùng để mã hóa các thông điệp mà nó gửi đến dịch vụ đẩy.
Lưu ý rằng các khóa riêng dùng để giải mã thông điệp đẩy không được trình duyệt chia sẻ, và được dùng để giải mã thông điệp trước khi chúng được chuyển cho service worker.
Điều này bảo đảm rằng các thông điệp đẩy vẫn riêng tư khi đi qua hạ tầng máy chủ đẩy.

Service worker không cần biết gì về các điểm cuối hay cơ chế mã hóa, ngoài việc chuyển thông tin liên quan cho máy chủ ứng dụng.
Bất kỳ cơ chế nào cũng có thể được dùng để chia sẻ thông tin với máy chủ ứng dụng.

## Ví dụ

### Gửi thông tin mã hóa đến máy chủ

Khóa công khai [`p256dh`](/en-US/docs/Web/API/PushSubscription/getKey#p256dh) và bí mật [`auth`](/en-US/docs/Web/API/PushSubscription/getKey#auth) dùng để mã hóa thông điệp được cung cấp cho service worker thông qua đăng ký đẩy của nó, bằng phương thức {{domxref("PushSubscription.getKey()")}}, cùng với điểm cuối đích để gửi các thông điệp đẩy trong {{domxref("PushSubscription.endpoint")}}.
Kiểu mã hóa nên được dùng cho việc mã hóa được cung cấp bởi thuộc tính tĩnh {{domxref("PushManager.supportedContentEncodings")}}.

Ví dụ này cho thấy cách bạn có thể đưa thông tin cần thiết từ `PushSubscription` và `supportedContentEncodings` vào một đối tượng JSON, tuần tự hóa nó bằng [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify), rồi gửi kết quả đến máy chủ ứng dụng.

```js
// Lấy một đối tượng PushSubscription
const pushSubscription =
  await serviceWorkerRegistration.pushManager.subscribe();

// Tạo một đối tượng chứa thông tin mà máy chủ ứng dụng cần
const subscriptionObject = {
  endpoint: pushSubscription.endpoint,
  keys: {
    p256dh: pushSubscription.getKey("p256dh"),
    auth: pushSubscription.getKey("auth"),
  },
  encoding: PushManager.supportedContentEncodings,
  /* dữ liệu khác dành riêng cho ứng dụng, chẳng hạn danh tính người dùng */
};

// Chuyển đối tượng thành chuỗi và gửi đến máy chủ ứng dụng
fetch("https://example.com/push/", {
  method: "post",
  body: JSON.stringify(subscriptionObject),
});
```

### Hủy đăng ký khỏi push manager

```js
navigator.serviceWorker.ready
  .then((reg) => reg.pushManager.getSubscription())
  .then((subscription) => subscription.unsubscribe())
  .then((successful) => {
    // Bạn đã hủy đăng ký thành công
  })
  .catch((e) => {
    // Hủy đăng ký thất bại
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Push API](/en-US/docs/Web/API/Push_API)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
