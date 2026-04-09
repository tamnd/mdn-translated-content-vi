---
title: "Phương thức CredentialsContainer: create()"
short-title: create()
slug: Web/API/CredentialsContainer/create
page-type: web-api-instance-method
browser-compat: api.CredentialsContainer.create
---

{{APIRef("Credential Management API")}}{{SecureContext_Header}}

Phương thức **`create()`** của giao diện {{domxref("CredentialsContainer")}} tạo một {{glossary("credential", "thông tin xác thực")}} mới, sau đó có thể được lưu trữ và truy xuất về sau bằng phương thức {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}}. Thông tin xác thực được truy xuất sau đó có thể được một trang web dùng để xác thực người dùng.

Phương thức này hỗ trợ ba loại thông tin xác thực khác nhau:

- Thông tin xác thực mật khẩu, cho phép người dùng đăng nhập bằng mật khẩu.
- Thông tin xác thực liên kết, cho phép người dùng đăng nhập bằng nhà cung cấp danh tính liên kết.
- Thông tin xác thực khóa công khai, cho phép người dùng đăng nhập bằng một authenticator như đầu đọc sinh trắc học tích hợp trong nền tảng hoặc token phần cứng có thể tháo rời.

Lưu ý rằng [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API) thay thế loại thông tin xác thực liên kết.

## Cú pháp

```js-nolint
create()
create(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho đối tượng `Credentials` mới được yêu cầu. Đối tượng này có thể chứa các thuộc tính sau:
    - `signal` {{optional_inline}}
      - : Một thể hiện đối tượng {{domxref("AbortSignal")}} cho phép hủy thao tác `create()` đang diễn ra. Một thao tác bị hủy có thể vẫn hoàn tất bình thường (thường là khi yêu cầu hủy đến sau khi thao tác đã xong) hoặc bị từ chối với một {{domxref("DOMException")}} `AbortError`.

    Mỗi thuộc tính sau đây biểu thị một _loại thông tin xác thực_ đang được tạo. Phải chỉ định đúng một và chỉ một trong số chúng:
    - `federated` {{optional_inline}}
      - : Một đối tượng {{domxref("FederatedCredentialInit")}} chứa các yêu cầu để tạo thông tin xác thực cho nhà cung cấp danh tính liên kết.
    - `password` {{optional_inline}}
      - : Một đối tượng {{domxref("PasswordCredentialInit")}} chứa các yêu cầu để tạo thông tin xác thực mật khẩu.
    - `publicKey` {{optional_inline}}
      - : Một đối tượng {{domxref("PublicKeyCredentialCreationOptions")}} chứa các yêu cầu để tạo thông tin xác thực khóa công khai. Việc này khiến lệnh gọi `create()` yêu cầu user agent tạo thông tin xác thực mới thông qua một authenticator, hoặc để đăng ký tài khoản mới hoặc để liên kết một cặp khóa bất đối xứng mới với tài khoản hiện có.

        > [!NOTE]
        > Việc dùng `create()` với tham số `publicKey` có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}} được đặt trên máy chủ của bạn.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một trong các giá trị sau:

- Một {{domxref("FederatedCredential")}}, nếu loại thông tin xác thực là `federated`.
- Một {{domxref("PasswordCredential")}}, nếu loại thông tin xác thực là `password`.
- Một {{domxref("PublicKeyCredential")}}, nếu loại thông tin xác thực là `publicKey`.

Nếu không thể tạo đối tượng thông tin xác thực nào, promise sẽ được giải quyết với `null`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Trong trường hợp yêu cầu tạo {{domxref("PasswordCredential")}}, `id`, `origin` hoặc `password` không được cung cấp (trống).
- `NotAllowedError` {{domxref("DOMException")}}
  - : Các nguyên nhân có thể bao gồm:
    - Việc sử dụng bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}}.
    - Hàm được gọi theo kiểu cross-origin nhưng thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) của iframe không đặt chính sách {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}} phù hợp.
    - Hàm được gọi theo kiểu cross-origin và `<iframe>` không có {{glossary("transient activation")}}.
    - Hàm đã cố tạo một [discoverable credential](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials) ([`residentKey`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#residentkey) được đặt là `required` trong tùy chọn {{domxref("PublicKeyCredentialCreationOptions")}} của lệnh gọi `create()`), nhưng người dùng không có authenticator hỗ trợ loại thông tin xác thực discoverable.
- `AbortError` {{domxref("DOMException")}}
  - : Thao tác đã bị hủy.

## Ví dụ

### Tạo thông tin xác thực mật khẩu

Ví dụ này tạo một thông tin xác thực mật khẩu từ đối tượng {{domxref("PasswordCredentialInit")}}.

```js
const credInit = {
  id: "serpent1234", // "username" trong một cặp tên người dùng/mật khẩu điển hình
  name: "Serpentina", // tên hiển thị cho thông tin xác thực
  origin: "https://example.org",
  password: "the last visible dog",
};

const makeCredential = document.querySelector("#make-credential");

makeCredential.addEventListener("click", async () => {
  const cred = await navigator.credentials.create({
    password: credInit,
  });
  console.log(cred.name);
  // Serpentina
  console.log(cred.id);
  // serpent1234
  console.log(cred.password);
  // the last visible dog
});
```

### Tạo thông tin xác thực liên kết

Ví dụ này tạo một thông tin xác thực liên kết từ đối tượng {{domxref("FederatedCredentialInit")}}.

```js
const credInit = {
  id: "1234",
  name: "Serpentina",
  origin: "https://example.org",
  protocol: "openidconnect",
  provider: "https://provider.example.org",
};

const makeCredential = document.querySelector("#make-credential");

makeCredential.addEventListener("click", async () => {
  const cred = await navigator.credentials.create({
    federated: credInit,
  });
  console.log(cred.name);
  console.log(cred.provider);
});
```

### Tạo thông tin xác thực khóa công khai

Ví dụ này tạo một thông tin xác thực khóa công khai từ đối tượng {{domxref("PublicKeyCredentialCreationOptions")}}.

```js
const publicKey = {
  challenge: challengeFromServer,
  rp: { id: "acme.com", name: "ACME Corporation" },
  user: {
    id: new Uint8Array([79, 252, 83, 72, 214, 7, 89, 26]),
    name: "jamiedoe",
    displayName: "Jamie Doe",
  },
  pubKeyCredParams: [{ type: "public-key", alg: -7 }],
};

const publicKeyCredential = await navigator.credentials.create({ publicKey });
```

Nếu lệnh gọi `create()` thành công, nó trả về một promise được giải quyết với một thể hiện đối tượng {{domxref("PublicKeyCredential")}}, biểu diễn một thông tin xác thực khóa công khai mà sau này có thể dùng để xác thực người dùng thông qua lệnh gọi WebAuthn {{domxref("CredentialsContainer.get()", "get()")}}. Thuộc tính {{domxref("PublicKeyCredential.response")}} của nó chứa một đối tượng {{domxref("AuthenticatorAttestationResponse")}} cho phép truy cập vào một số thông tin hữu ích, bao gồm dữ liệu authenticator, khóa công khai, cơ chế truyền tải, v.v.

```js
navigator.credentials.create({ publicKey }).then((publicKeyCredential) => {
  const response = publicKeyCredential.response;

  // Truy cập ArrayBuffer attestationObject
  const attestationObj = response.attestationObject;

  // Truy cập client JSON
  const clientJSON = response.clientDataJSON;

  // Trả về ArrayBuffer dữ liệu authenticator
  const authenticatorData = response.getAuthenticatorData();

  // Trả về ArrayBuffer khóa công khai
  const pk = response.getPublicKey();

  // Trả về mã định danh thuật toán khóa công khai
  const pkAlgo = response.getPublicKeyAlgorithm();

  // Trả về mảng các phương thức truyền tải được phép
  const transports = response.getTransports();
});
```

Một phần dữ liệu này sẽ cần được lưu trữ trên máy chủ cho các thao tác xác thực trong tương lai đối với thông tin xác thực này, ví dụ như khóa công khai, thuật toán được sử dụng và các phương thức truyền tải được phép.

> [!NOTE]
> Xem [Tạo một cặp khóa và đăng ký người dùng](/en-US/docs/Web/API/Web_Authentication_API#creating_a_key_pair_and_registering_a_user) để biết thêm thông tin về cách hoạt động của toàn bộ luồng.

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
