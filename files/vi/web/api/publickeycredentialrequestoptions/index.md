---
title: PublicKeyCredentialRequestOptions
slug: Web/API/PublicKeyCredentialRequestOptions
page-type: web-api-interface
browser-compat: api.CredentialsContainer.get.publicKey_option
spec-urls: https://w3c.github.io/webauthn/#dictdef-publickeycredentialrequestoptions
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Từ điển **`PublicKeyCredentialRequestOptions`** đại diện cho đối tượng được truyền vào {{domxref("CredentialsContainer.get()")}} làm giá trị của tùy chọn `publicKey`.

Nó được dùng để yêu cầu {{domxref("PublicKeyCredential")}} được cung cấp bởi {{glossary("authenticator")}} hỗ trợ [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API).

## Thuộc tính phiên bản

- `allowCredentials` {{optional_inline}}
  - : Một mảng các đối tượng dùng để giới hạn danh sách thông tin xác thực có thể chấp nhận. Mảng rỗng cho biết bất kỳ thông tin xác thực nào đều được chấp nhận.

    Mỗi đối tượng trong mảng chứa các thuộc tính:
    - `id`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đại diện cho ID của thông tin xác thực khóa công khai cần lấy.

    - `transports` {{optional_inline}}
      - : Một mảng chuỗi cung cấp gợi ý về các phương thức client có thể sử dụng để giao tiếp với authenticator. Các phương thức vận chuyển có thể là: `"ble"`, `"hybrid"`, `"internal"`, `"nfc"` và `"usb"`.

    - `type`
      - : Một chuỗi xác định loại thông tin xác thực khóa công khai cần lấy. Hiện tại có thể nhận giá trị duy nhất là `"public-key"`.

    Giá trị này mặc định là mảng rỗng.

- `challenge`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} có nguồn gốc từ server của relying party và được sử dụng như [thách thức mật mã](https://en.wikipedia.org/wiki/Challenge%E2%80%93response_authentication). Giá trị này sẽ được ký bởi authenticator và chữ ký sẽ được gửi lại như một phần của {{domxref("AuthenticatorAssertionResponse.signature")}}.

- `extensions` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính đại diện cho giá trị đầu vào cho bất kỳ extension nào được yêu cầu. Các extension này được dùng để chỉ định xử lý bổ sung bởi client hoặc authenticator trong quá trình xác thực.

    Xem [Web Authentication extensions](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) để biết thêm thông tin.

- `hints` {{optional_inline}} {{experimental_inline}}
  - : Một mảng chuỗi cung cấp gợi ý về giao diện người dùng mà trình duyệt nên cung cấp cho người dùng để xác thực với thông tin xác thực khóa công khai hiện có.

    Các chuỗi có thể là:
    - `"security-key"`
      - : Giao diện người dùng nên khuyên yêu cầu thông tin xác thực từ khóa bảo mật vật lý riêng biệt.
    - `"client-device"`
      - : Giao diện người dùng nên khuyên yêu cầu thông tin xác thực từ authenticator có sẵn trên cùng thiết bị.
    - `"hybrid"`
      - : Giao diện người dùng nên khuyên yêu cầu thông tin xác thực từ authenticator đa năng, như ứng dụng authenticator trên điện thoại thông minh.

    Khi nhiều chuỗi được bao gồm trong mảng, thứ tự của chúng biểu thị thứ tự ưu tiên, từ cao đến thấp.

- `rpId` {{optional_inline}}
  - : Một chuỗi chỉ định mã định danh của relying party (ví dụ: `"login.example.org"`). Giá trị này mặc định là tên miền nguồn gốc hiện tại.

- `timeout` {{optional_inline}}
  - : Gợi ý số, tính bằng mili giây, cho biết thời gian relying party sẵn sàng chờ đợi để hoàn thành thao tác lấy thông tin.

- `userVerification` {{optional_inline}}
  - : Một chuỗi chỉ định yêu cầu của relying party về xác minh người dùng trong quá trình xác thực.

    Giá trị có thể là:
    - `"required"`
      - : Relying party yêu cầu xác minh người dùng, và thao tác sẽ thất bại nếu không thực hiện được.
    - `"preferred"`
      - : Relying party ưa thích xác minh người dùng nếu có thể, nhưng thao tác sẽ không thất bại nếu không thực hiện được.
    - `"discouraged"`
      - : Relying party không muốn xác minh người dùng, nhằm làm cho tương tác người dùng mượt mà nhất có thể.

    Giá trị này mặc định là `"preferred"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
