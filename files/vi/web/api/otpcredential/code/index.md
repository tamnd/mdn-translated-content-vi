---
title: "OTPCredential: thuộc tính code"
short-title: code
slug: Web/API/OTPCredential/code
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.OTPCredential.code
---

{{SecureContext_Header}}{{APIRef("WebOTP API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`code`** của giao diện {{domxref("OTPCredential")}} chứa mật khẩu dùng một lần (OTP).

## Giá trị

Một chuỗi chứa OTP.

## Ví dụ

Đoạn code dưới đây kích hoạt luồng quyền của trình duyệt khi tin nhắn SMS đến. Nếu quyền được cấp, promise phân giải với đối tượng `OTPCredential`. Giá trị `code` được chứa sau đó được đặt làm giá trị của phần tử biểu mẫu {{htmlelement("input")}}, sau đó biểu mẫu được gửi.

```js
navigator.credentials
  .get({
    otp: { transport: ["sms"] },
    signal: ac.signal,
  })
  .then((otp) => {
    input.value = otp.code;
    if (form) form.submit();
  })
  .catch((err) => {
    console.error(err);
  });
```

> [!NOTE]
> Để giải thích đầy đủ về code, xem trang {{domxref('WebOTP API','','',' ')}}. Bạn cũng có thể [xem code này như một phần của bản demo hoạt động đầy đủ](https://chrome.dev/web-otp-demo/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
