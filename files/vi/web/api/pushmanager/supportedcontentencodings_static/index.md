---
title: "PushManager: thuộc tính tĩnh supportedContentEncodings"
short-title: supportedContentEncodings
slug: Web/API/PushManager/supportedContentEncodings_static
page-type: web-api-static-property
browser-compat: api.PushManager.supportedContentEncodings_static
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính tĩnh chỉ đọc **`supportedContentEncodings`** của giao diện {{domxref("PushManager")}} trả về một mảng các content coding được hỗ trợ có thể dùng để mã hóa payload của một thông điệp đẩy.

Các user agent phải hỗ trợ content coding `aes128gcm` được định nghĩa trong {{rfc("8291")}}, và cũng có thể hỗ trợ các content coding được định nghĩa từ các phiên bản trước của đặc tả.
Mảng được trả về là bất biến và người nhận không thể sửa đổi nó.

Máy chủ ứng dụng cần coding này để mã hóa thông điệp đẩy trước khi gửi tới push server.
Coding được dùng để mã hóa cũng được máy chủ ứng dụng đưa vào trường tiêu đề HTTP {{httpheader("Content-Encoding")}} của mỗi thông điệp đẩy.

Đặc tả không định nghĩa cách mã client nên gửi các coding được hỗ trợ về cho máy chủ ứng dụng, hoặc thông tin trong {{domxref("PushSubscription")}} mà nó cũng cần để mã hóa và gửi thông điệp đẩy.
Một cách tiếp cận được minh họa trong phần ví dụ bên dưới.

## Giá trị

Một mảng các chuỗi.
Thông thường mảng này chỉ chứa một giá trị: `"aes128gcm"`.

## Ngoại lệ

- `TypeError`
  - : Được ném ra khi cố đặt một giá trị trong mảng được trả về.

## Ví dụ

### Gửi thông tin coding lên máy chủ

Thông điệp đẩy được mã hóa trên máy chủ ứng dụng để gửi tới push server, và được trình duyệt giải mã trước khi chuyển cho service worker của ứng dụng.
Các public và private key được dùng do trình duyệt tạo ra, và chỉ public key cùng một bí mật liên quan mới được chia sẻ với web app, rồi từ đó tới máy chủ ứng dụng.
Điều này bảo đảm thông điệp đẩy vẫn riêng tư khi đi qua hạ tầng push server.

Public key [`p256dh`](/en-US/docs/Web/API/PushSubscription/getKey#p256dh) và bí mật [`auth`](/en-US/docs/Web/API/PushSubscription/getKey#auth) dùng để mã hóa thông điệp được cung cấp cho service worker qua subscription đẩy của nó, bằng phương thức {{domxref("PushSubscription.getKey()")}}, cùng với endpoint đích để gửi thông điệp đẩy trong {{domxref("PushSubscription.endpoint")}}.
Coding nên được dùng để mã hóa được cung cấp bởi `supportedContentEncodings`.

Thông tin này có thể được gửi tới máy chủ ứng dụng bằng bất kỳ cơ chế nào.
Một cách là đưa thông tin cần thiết từ {{domxref("PushSubscription")}} và `supportedContentEncodings` vào một object JSON, tuần tự hóa nó bằng [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) và post kết quả tới máy chủ ứng dụng.

```js
// Lấy một đối tượng PushSubscription
const pushSubscription =
  await serviceWorkerRegistration.pushManager.subscribe();

// Tạo một object chứa thông tin cần cho máy chủ ứng dụng
const subscriptionObject = {
  endpoint: pushSubscription.endpoint,
  keys: {
    p256dh: pushSubscription.getKeys("p256dh"),
    auth: pushSubscription.getKeys("auth"),
  },
  encoding: PushManager.supportedContentEncodings,
  /* dữ liệu riêng của ứng dụng, chẳng hạn danh tính người dùng */
};

// Chuyển object thành chuỗi và post lên máy chủ ứng dụng
fetch("https://example.com/push/", {
  method: "POST",
  body: JSON.stringify(pushSubscription),
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
