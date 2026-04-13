---
title: "PushSubscription: getKey() method"
short-title: getKey()
slug: Web/API/PushSubscription/getKey
page-type: web-api-instance-method
browser-compat: api.PushSubscription.getKey
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức `getKey()` của giao diện {{domxref("PushSubscription")}}
trả về một {{jsxref("ArrayBuffer")}} biểu diễn khóa công khai của máy khách, sau đó
có thể được gửi đến máy chủ và dùng để mã hóa dữ liệu thông điệp đẩy.

## Cú pháp

```js-nolint
getKey(name)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho phương thức mã hóa được dùng để tạo khóa máy khách. Giá trị có thể là:
    - `p256dh`
      - : Một khóa công khai [Elliptic curve Diffie–Hellman](https://en.wikipedia.org/wiki/Elliptic_curve_Diffie%E2%80%93Hellman) trên đường cong P-256 (tức đường cong elliptic secp256r1 của NIST). Khóa thu được là một điểm không nén theo định dạng ANSI X9.62.
    - `auth`
      - : Một bí mật xác thực, như được mô tả trong [Message Encryption for Web Push](https://datatracker.ietf.org/doc/html/draft-ietf-webpush-encryption-08).

### Giá trị trả về

Một {{jsxref("ArrayBuffer")}} hoặc `null` nếu không tìm thấy khóa công khai nào.

## Ví dụ

```js
reg.pushManager.getSubscription().then((subscription) => {
  // Bật bất kỳ giao diện người dùng nào cho phép đăng ký/hủy đăng ký
  // nhận thông điệp đẩy.

  subBtn.disabled = false;

  if (!subscription) {
    console.log("Chưa đăng ký Push");
    // Chúng ta chưa đăng ký push, vì vậy thiết lập giao diện
    // để cho phép người dùng bật push
    return;
  }

  // Thiết lập giao diện để cho thấy họ đã đăng ký
  // nhận thông điệp đẩy
  subBtn.textContent = "Hủy đăng ký Push Messaging";
  isPushEnabled = true;

  // khởi tạo trạng thái, bao gồm thiết lập các phần tử giao diện cho trạng thái đã đăng ký
  // và cập nhật danh sách Subscribers qua push
  const endpoint = subscription.endpoint;
  const key = subscription.getKey("p256dh");
  const auth = subscription.getKey("auth");

  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
