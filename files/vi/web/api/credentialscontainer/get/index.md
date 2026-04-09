---
title: "Phương thức CredentialsContainer: get()"
short-title: get()
slug: Web/API/CredentialsContainer/get
page-type: web-api-instance-method
browser-compat: api.CredentialsContainer.get
---

{{APIRef("Credential Management API")}}{{SecureContext_Header}}

Phương thức **`get()`** của giao diện {{domxref("CredentialsContainer")}} trả về một {{jsxref("Promise")}} được hoàn thành với một {{glossary("credential", "thông tin xác thực")}} duy nhất, sau đó có thể dùng để xác thực người dùng với một trang web.

Phương thức này chấp nhận một đối số `options` tùy chọn, có thể bao gồm:

- Một thuộc tính `mediation` cho biết người dùng sẽ được yêu cầu tham gia vào thao tác như thế nào và ở mức nào.
  Thuộc tính này kiểm soát, ví dụ, việc trang web có thể lặng lẽ đăng nhập người dùng bằng thông tin xác thực đã lưu hay không.
- Một thuộc tính `signal` cho phép hủy thao tác bằng {{domxref("AbortController")}}.
- Một hoặc nhiều thuộc tính `password`, `federated`, `identity`, `otp`, `publicKey`, cho biết [các loại thông tin xác thực](/en-US/docs/Web/API/Credential_Management_API/Credential_types) đang được yêu cầu. Nếu được đặt, giá trị của các thuộc tính này sẽ bao gồm mọi tham số mà trình duyệt cần để tìm một thông tin xác thực phù hợp thuộc loại được yêu cầu.

API luôn được hoàn thành với một thông tin xác thực duy nhất hoặc `null`. Nếu có nhiều thông tin xác thực và việc dàn xếp với người dùng được cho phép, trình duyệt sẽ yêu cầu người dùng chọn một thông tin xác thực duy nhất.

## Cú pháp

```js-nolint
get()
get(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho yêu cầu. Đối tượng này có thể chứa các thuộc tính sau:
    - `mediation` {{optional_inline}}
      - : Một chuỗi cho biết người dùng tham gia vào việc truy xuất thông tin xác thực như thế nào. Giá trị có thể là một trong các giá trị sau:
        - `"conditional"`
          - : Các thông tin xác thực được phát hiện sẽ được trình bày cho người dùng trong một hộp thoại không theo kiểu modal cùng với chỉ báo về origin đang yêu cầu thông tin xác thực. Trên thực tế, điều này có nghĩa là tự động điền các thông tin xác thực khả dụng; xem [Autofill UI](/en-US/docs/Web/API/Web_Authentication_API#autofill_ui) để biết thêm chi tiết về cách sử dụng.

        - `"optional"`
          - : Nếu có thể trao thông tin xác thực cho một thao tác nhất định mà không cần dàn xếp với người dùng, trình duyệt sẽ làm vậy, cho phép tái xác thực tự động mà không cần người dùng can thiệp. Nếu cần có dàn xếp với người dùng, user agent sẽ yêu cầu người dùng xác thực. Giá trị này dành cho những trường hợp mà bạn có cơ sở tin rằng người dùng sẽ không ngạc nhiên hoặc bối rối khi thấy hộp thoại đăng nhập, ví dụ trên một trang web không tự động đăng nhập người dùng, khi người dùng vừa nhấp vào nút "Login/Signup".

        - `"required"`
          - : Người dùng sẽ luôn được yêu cầu xác thực. Giá trị này dành cho các trường hợp bạn muốn buộc người dùng xác thực, ví dụ nếu bạn muốn người dùng xác thực lại khi đang thực hiện một thao tác nhạy cảm (chẳng hạn xác nhận thanh toán thẻ tín dụng), hoặc khi chuyển đổi người dùng.

        - `"silent"`
          - : Người dùng sẽ không được yêu cầu xác thực. User agent sẽ tự động xác thực lại người dùng và đăng nhập cho họ nếu có thể. Nếu cần có sự đồng ý, promise sẽ được hoàn thành với `null`. Giá trị này dành cho những trường hợp bạn muốn tự động đăng nhập người dùng khi họ truy cập một ứng dụng web nếu có thể, nhưng nếu không được thì bạn không muốn hiện một hộp thoại đăng nhập gây khó hiểu. Thay vào đó, bạn sẽ chờ họ chủ động nhấp vào nút "Login/Signup".

        Giá trị mặc định là `"optional"`.

        > [!NOTE]
        > Trong trường hợp yêu cầu [xác thực liên kết (FedCM API)](/en-US/docs/Web/API/FedCM_API), giá trị `mediation` là `optional` hoặc `silent` có thể dẫn đến việc thử [tái xác thực tự động](/en-US/docs/Web/API/FedCM_API/RP_sign-in#auto-reauthentication). Việc này có xảy ra hay không sẽ được truyền đến nhà cung cấp danh tính (IdP) thông qua tham số [`is_auto_selected`](/en-US/docs/Web/API/FedCM_API/IDP_integration#is_auto_selected) được gửi đến `id_assertion_endpoint` của IdP trong quá trình xác thực, và đến bên dựa vào (RP) thông qua thuộc tính {{domxref("IdentityCredential.isAutoSelected")}}. Điều này hữu ích cho việc đánh giá hiệu năng, các yêu cầu bảo mật (IdP có thể muốn từ chối các yêu cầu tái xác thực tự động và luôn yêu cầu dàn xếp với người dùng), và UX nói chung (IdP hoặc RP có thể muốn trình bày UX khác nhau cho trải nghiệm đăng nhập tự động và không tự động).

    - `signal` {{optional_inline}}
      - : Một thể hiện đối tượng {{domxref("AbortSignal")}} cho phép hủy thao tác `get()` đang diễn ra. Một thao tác bị hủy có thể vẫn hoàn tất bình thường (thường là khi yêu cầu hủy đến sau khi thao tác đã xong) hoặc bị từ chối với lý do của tín hiệu đó (mặc định là một `AbortError` {{domxref("DOMException")}}, hoặc một giá trị tùy chỉnh nếu được cung cấp khi gọi {{domxref("AbortController.abort", "abort()")}}).

    - `password` {{optional_inline}}
      - : Tùy chọn này yêu cầu trình duyệt truy xuất một [mật khẩu](/en-US/docs/Web/API/Credential_Management_API/Credential_types#passwords) đã lưu dưới dạng đối tượng {{domxref("PasswordCredential")}}. Đây là một giá trị boolean.
    - `identity` {{optional_inline}}
      - : Tùy chọn này yêu cầu trình duyệt truy xuất một [thông tin xác thực danh tính liên kết](/en-US/docs/Web/API/Credential_Management_API/Credential_types#federated_identity_credentials) dưới dạng đối tượng {{domxref("IdentityCredential")}}, bằng cách sử dụng [Federated Credential Management API](/en-US/docs/Web/API/FedCM_API).

        Giá trị của tùy chọn này là một đối tượng {{domxref("IdentityCredentialRequestOptions")}} chứa chi tiết về các nhà cung cấp danh tính cụ thể mà trang web muốn sử dụng.

    - `federated` {{optional_inline}}
      - : Tùy chọn này yêu cầu trình duyệt truy xuất một [thông tin xác thực danh tính liên kết](/en-US/docs/Web/API/Credential_Management_API/Credential_types#federated_identity_credentials) dưới dạng đối tượng {{domxref("FederatedCredential")}}. Giao diện này hiện đã bị thay thế và nhà phát triển nên ưu tiên dùng tùy chọn `identity` nếu có sẵn.

        Giá trị của tùy chọn này là một đối tượng có các thuộc tính sau:
        - `protocols`
          - : Một mảng chuỗi biểu diễn các giao thức của các nhà cung cấp danh tính liên kết của thông tin xác thực được yêu cầu (ví dụ: `"openidconnect"`).
        - `providers`
          - : Một mảng chuỗi biểu diễn các nhà cung cấp danh tính liên kết của thông tin xác thực (ví dụ `"https://www.facebook.com"` hoặc `"https://accounts.google.com"`).

    - `otp` {{optional_inline}}
      - : Tùy chọn này yêu cầu trình duyệt truy xuất một [mật khẩu dùng một lần (OTP)](/en-US/docs/Web/API/Credential_Management_API/Credential_types#one-time_passwords) dưới dạng đối tượng {{domxref("OTPCredential")}}.

        Giá trị của tùy chọn này là một mảng chuỗi chỉ có thể chứa giá trị chuỗi `"sms"`.

    - `publicKey` {{optional_inline}}
      - : Tùy chọn này yêu cầu trình duyệt truy xuất một [assertion được ký bằng Web Authentication API](/en-US/docs/Web/API/Credential_Management_API/Credential_types#web_authentication_assertions) dưới dạng {{domxref("PublicKeyCredential")}}.

        Giá trị của tùy chọn này là một đối tượng {{domxref("PublicKeyCredentialRequestOptions")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một trong các lớp con sau của {{domxref("Credential")}}:

- {{domxref("PasswordCredential")}}
- {{domxref("IdentityCredential")}}
- {{domxref("FederatedCredential")}}
- {{domxref("OTPCredential")}}
- {{domxref("PublicKeyCredential")}}

Nếu [conditional mediation](#mediation) được chỉ định trong lệnh gọi `get()`, hộp thoại UI của trình duyệt sẽ được hiển thị và promise vẫn ở trạng thái chờ cho đến khi người dùng chọn một tài khoản để đăng nhập từ các gợi ý tự động điền hiện có:

- Nếu người dùng sau đó thực hiện một thao tác bên ngoài hộp thoại UI của trình duyệt, hộp thoại sẽ đóng mà không giải quyết hoặc từ chối promise và cũng không gây ra trạng thái lỗi hiển thị với người dùng.
- Nếu người dùng chọn một thông tin xác thực, {{domxref("PublicKeyCredential")}} tương ứng sẽ được trả về cho phía gọi.

Nếu không thể lấy được một thông tin xác thực duy nhất một cách rõ ràng, promise sẽ được giải quyết với `null`.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị hủy bởi một lệnh gọi tới phương thức {{domxref("AbortController.abort", "abort()")}} của {{domxref("AbortController")}} được liên kết với tùy chọn [`signal`](#signal) của phương thức này.
    Lưu ý rằng nếu phía gọi `abort()` cung cấp đối số `reason`, thì `get()` sẽ bị từ chối với giá trị của `reason`, thay vì một ngoại lệ `AbortController`.

- `TimeoutError` {{domxref("DOMException")}}
  - : Yêu cầu đã tự động bị hủy do vượt quá thời gian chờ được đặt bằng {{domxref("AbortSignal.timeout_static", "AbortSignal.timeout()")}}.

- {{domxref("IdentityCredentialError")}}
  - : Khi yêu cầu một {{domxref("IdentityCredential")}}, yêu cầu tới [ID assertion endpoint](/en-US/docs/Web/API/FedCM_API/IDP_integration#the_id_assertion_endpoint) không thể xác thực phiên đăng nhập và bị từ chối với phản hồi lỗi chứa thông tin về nguyên nhân.

- `NetworkError` {{domxref("DOMException")}}
  - : Khi yêu cầu một {{domxref("IdentityCredential")}}, {{glossary("identity provider", "nhà cung cấp danh tính")}} (IdP) không phản hồi trong vòng 60 giây, thông tin xác thực được cung cấp không hợp lệ/không tìm thấy, hoặc trạng thái đăng nhập của trình duyệt đối với IdP được đặt là `"logged-out"` (xem [Cập nhật trạng thái đăng nhập bằng Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) để biết thêm về trạng thái đăng nhập FedCM). Trong trường hợp sau, có thể sẽ có một độ trễ trước khi từ chối để tránh làm rò rỉ trạng thái đăng nhập IdP tới RP.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Người dùng đã hủy yêu cầu.

    - Việc sử dụng API này bị chặn bởi một trong các [permissions policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) sau:
      - {{HTTPHeader("Permissions-Policy/identity-credentials-get","identity-credentials-get")}}
      - {{HTTPHeader("Permissions-Policy/publickey-credentials-get","publickey-credentials-get")}}
      - {{HTTPHeader("Permissions-Policy/otp-credentials","otp-credentials")}}

    - Origin gọi là một [opaque origin](/en-US/docs/Web/HTTP/Reference/Headers/Origin#null).

- `SecurityError` {{domxref("DOMException")}}
  - : Miền gọi không phải là một miền hợp lệ.

## Ví dụ

### Truy xuất một thông tin xác thực danh tính liên kết

Các bên dựa vào có thể gọi `get()` với tùy chọn `identity` để gửi yêu cầu cho phép người dùng đăng nhập vào bên dựa vào thông qua nhà cung cấp danh tính (IdP), bằng cách dùng liên kết danh tính. Một yêu cầu điển hình sẽ giống như sau:

```js
async function signIn() {
  const identityCredential = await navigator.credentials.get({
    identity: {
      providers: [
        {
          configURL: "https://accounts.idp.example/config.json",
          clientId: "********",
          params: {
            /* Tham số dành riêng cho IdP */
          },
        },
      ],
    },
  });
}
```

Hãy xem [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API) để biết thêm chi tiết về cách hoạt động. Lệnh gọi này sẽ khởi động luồng đăng nhập được mô tả trong [Luồng đăng nhập FedCM](/en-US/docs/Web/API/FedCM_API/RP_sign-in#fedcm_sign-in_flow).

Một lệnh gọi tương tự nhưng có thêm các phần mở rộng `context` và `loginHint` sẽ như sau:

```js
async function signIn() {
  const identityCredential = await navigator.credentials.get({
    identity: {
      context: "signup",
      providers: [
        {
          configURL: "https://accounts.idp.example/config.json",
          clientId: "********",
          params: {
            /* Tham số dành riêng cho IdP */
          },
          loginHint: "user1@example.com",
        },
      ],
    },
  });
}
```

Nếu IdP không thể xác thực một yêu cầu tới [ID assertion endpoint](/en-US/docs/Web/API/FedCM_API/IDP_integration#the_id_assertion_endpoint), nó sẽ từ chối promise được trả về từ `CredentialsContainer.get()`:

```js
async function signIn() {
  try {
    const identityCredential = await navigator.credentials.get({
      identity: {
        providers: [
          {
            configURL: "https://accounts.idp.example/config.json",
            clientId: "********",
            params: {
              /* Tham số dành riêng cho IdP */
            },
          },
        ],
      },
    });
  } catch (e) {
    // Xử lý lỗi theo cách nào đó, ví dụ cung cấp thông tin
    // để giúp người dùng thành công trong lần đăng nhập sau
    console.error(e);
  }
}
```

### Truy xuất một thông tin xác thực khóa công khai

Đoạn mã sau cho thấy một lệnh gọi `get()` điển hình với tùy chọn `publicKey` của WebAuthn:

```js
const publicKey = {
  challenge: new Uint8Array([139, 66, 181, 87, 7, 203 /* ,… */]),
  rpId: "acme.com",
  allowCredentials: [
    {
      type: "public-key",
      id: new Uint8Array([64, 66, 25, 78, 168, 226, 174 /* ,… */]),
    },
  ],
  userVerification: "required",
};

navigator.credentials.get({ publicKey });
```

Một lệnh gọi `get()` thành công trả về một promise được giải quyết với một thể hiện đối tượng {{domxref("PublicKeyCredential")}}, biểu diễn một thông tin xác thực khóa công khai đã được tạo trước đó thông qua {{domxref("CredentialsContainer.create()", "create()")}} của WebAuthn và giờ được dùng để xác thực người dùng. Thuộc tính {{domxref("PublicKeyCredential.response")}} của nó chứa một đối tượng {{domxref("AuthenticatorAssertionResponse")}} cho phép truy cập vào một số thông tin hữu ích, bao gồm dữ liệu authenticator, chữ ký và mã xử lý người dùng.

```js
navigator.credentials.get({ publicKey }).then((publicKeyCredential) => {
  const response = publicKeyCredential.response;

  // Truy cập ArrayBuffer dữ liệu authenticator
  const authenticatorData = response.authenticatorData;

  // Truy cập client JSON
  const clientJSON = response.clientDataJSON;

  // Truy cập ArrayBuffer chữ ký
  const signature = response.signature;

  // Truy cập ArrayBuffer userHandle
  const userHandle = response.userHandle;
});
```

Một phần dữ liệu này sẽ cần được lưu trên máy chủ, ví dụ `signature` để chứng minh rằng authenticator sở hữu khóa riêng thực sự đã được dùng để tạo thông tin xác thực, và `userHandle` để liên kết người dùng với thông tin xác thực, lần đăng nhập và dữ liệu khác.

Xem [Xác thực người dùng](/en-US/docs/Web/API/Web_Authentication_API#authenticating_a_user) để biết thêm thông tin về cách hoạt động của toàn bộ luồng.

### Truy xuất mật khẩu dùng một lần

Đoạn mã dưới đây kích hoạt luồng xin cấp quyền của trình duyệt khi có tin nhắn SMS đến. Nếu quyền được cấp, promise sẽ được giải quyết với một đối tượng `OTPCredential`. Giá trị `code` chứa bên trong sau đó được đặt làm giá trị của một phần tử biểu mẫu {{htmlelement("input")}}, rồi biểu mẫu được gửi đi.

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

### Triển khai thời gian chờ

Trong ví dụ này, chúng ta dùng {{domxref("AbortSignal.timeout_static", "AbortSignal.timeout()")}} để tự động hủy yêu cầu nếu mất quá 10 giây.

```js
async function authenticateUser() {
  const publicKey = {
    challenge: new Uint8Array([139, 66, 181, 87, 7, 203 /* ,… */]),
    rpId: "acme.com",
    allowCredentials: [
      {
        type: "public-key",
        id: new Uint8Array([64, 66, 25, 78, 168, 226, 174 /* ,… */]),
      },
    ],
    userVerification: "required",
  };

  try {
    const credential = await navigator.credentials.get({
      publicKey,
      signal: AbortSignal.timeout(10000), // Hủy sau 10 giây
    });
    console.log("Authentication successful:", credential);
  } catch (err) {
    if (err.name === "TimeoutError") {
      console.error("The authentication request timed out.");
    } else if (err.name === "AbortError") {
      console.log("The request was cancelled by the user.");
    } else {
      console.error("An unexpected error occurred:", err);
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
