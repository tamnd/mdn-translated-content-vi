---
title: OTPCredential
slug: Web/API/OTPCredential
page-type: web-api-interface
status:
  - experimental
browser-compat: api.OTPCredential
---

{{APIRef("WebOTP API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`OTPCredential`** của {{domxref('WebOTP API','','',' ')}} được trả về khi lệnh gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} của WebOTP (tức là được gọi với tùy chọn `otp`) được thực hiện. Nó bao gồm thuộc tính `code` chứa mật khẩu dùng một lần (OTP) đã được truy xuất.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Credential")}}._

- {{domxref("OTPCredential.code")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Mật khẩu dùng một lần (OTP).

## Phương thức phiên bản

Không có.

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
