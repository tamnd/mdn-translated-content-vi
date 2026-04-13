---
title: PublicKeyCredentialCreationOptions
slug: Web/API/PublicKeyCredentialCreationOptions
page-type: web-api-interface
browser-compat: api.CredentialsContainer.create.publicKey_option
spec-urls: https://w3c.github.io/webauthn/#dictionary-makecredentialoptions
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Từ điển **`PublicKeyCredentialCreationOptions`** đại diện cho đối tượng được truyền vào {{domxref("CredentialsContainer.create()")}} làm giá trị của tùy chọn `publicKey`, tức là khi dùng `create()` để tạo thông tin xác thực khóa công khai bằng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API).

## Thuộc tính phiên bản

- `attestation` {{optional_inline}}
  - : Một chuỗi chỉ định sở thích của relying party về cách truyền đạt câu lệnh chứng thực (attestation statement) trong quá trình tạo thông tin xác thực. Giá trị có thể là một trong những giá trị sau:
    - `"none"`
      - : Chỉ định rằng relying party không quan tâm đến chứng thực của authenticator. Nếu chọn `"none"` làm giá trị `attestation` và authenticator báo hiệu rằng nó sử dụng CA để tạo câu lệnh chứng thực, ứng dụng client sẽ thay thế nó bằng câu lệnh chứng thực "None".

    - `"direct"`
      - : Chỉ định rằng relying party muốn nhận câu lệnh chứng thực do authenticator tạo ra.

    - `"enterprise"`
      - : Chỉ định rằng Relying Party muốn nhận câu lệnh chứng thực có thể bao gồm thông tin nhận dạng duy nhất. Điều này dành cho các triển khai được kiểm soát trong doanh nghiệp nơi tổ chức muốn liên kết đăng ký với authenticator cụ thể.

    - `"indirect"`
      - : Chỉ định rằng relying party muốn nhận câu lệnh chứng thực có thể xác minh, nhưng sẽ cho phép client quyết định cách nhận. Ví dụ, client có thể chọn thay thế câu lệnh xác nhận của authenticator bằng câu lệnh do Anonymization CA tạo ra để bảo vệ quyền riêng tư người dùng.

    Nếu bỏ qua `attestation`, nó mặc định là `"none"`.

- `attestationFormats` {{optional_inline}}
  - : Một mảng chuỗi chỉ định sở thích của relying party về định dạng câu lệnh chứng thực được sử dụng bởi authenticator. Các giá trị nên được sắp xếp từ ưu tiên cao nhất đến thấp nhất và nên được coi là gợi ý. Xem [WebAuthn Attestation Statement Format Identifiers](https://www.iana.org/assignments/webauthn/webauthn.xhtml#webauthn-attestation-statement-format-ids) để biết danh sách các định dạng hợp lệ.

    Nếu bỏ qua, `attestationFormats` mặc định là mảng rỗng.

- `authenticatorSelection` {{optional_inline}}
  - : Một đối tượng có các thuộc tính là tiêu chí dùng để lọc các authenticator tiềm năng cho thao tác tạo thông tin xác thực. Đối tượng này có thể chứa các thuộc tính:
    - `authenticatorAttachment` {{optional_inline}}
      - : Một chuỗi cho biết loại kết nối authenticator nào được phép cho authenticator đã chọn. Các giá trị có thể là:
        - `"platform"`
          - : Authenticator là một phần của thiết bị đang chạy WebAuthn (được gọi là **platform authenticator**). Thông tin xác thực khóa công khai gắn với platform authenticator được gọi là **platform credential**.
        - `"cross-platform"`
          - : Authenticator không phải là một phần của thiết bị đang chạy WebAuthn (được gọi là **roaming authenticator** vì nó có thể di chuyển giữa các thiết bị khác nhau). Thông tin xác thực khóa công khai gắn với roaming authenticator được gọi là **roaming credential**.

            Nếu bỏ qua, bất kỳ loại authenticator nào đều có thể được chọn.

    - `requireResidentKey` {{optional_inline}}
      - : Giá trị boolean. Nếu đặt thành `true`, nó cho biết relying party muốn tạo [discoverable credential](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials).

        Tùy chọn này chỉ được giữ lại để tương thích ngược. Nếu `residentKey` được cung cấp và được hỗ trợ, `requireResidentKey` sẽ bị bỏ qua. Nên đặt `requireResidentKey` thành `true` khi và chỉ khi `residentKey` được đặt thành `"required"`.

        Mặc định là `false`.

    - `residentKey` {{optional_inline}}
      - : Một chuỗi chỉ định mức độ relying party muốn tạo [discoverable credential](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials).
        Các giá trị có thể là:
        - `"discouraged"`
          - : Relying party ưa thích tạo server-side credential, nhưng sẽ chấp nhận client-side discoverable credential.
        - `"preferred"`
          - : Relying party ưa thích mạnh mẽ việc tạo discoverable credential, nhưng sẽ chấp nhận non-discoverable credential.
        - `"required"`
          - : Relying party yêu cầu discoverable credential. Nếu không thể tạo, sẽ ném `NotAllowedError` {{domxref("DOMException")}}.

        Nếu bỏ qua, `residentKey` mặc định là `"required"` nếu `requireResidentKey` là `true`, ngược lại giá trị mặc định là `"discouraged"`.

    - `userVerification` {{optional_inline}}
      - : Một chuỗi chỉ định yêu cầu của relying party về xác minh người dùng cho thao tác `create()`. Các giá trị có thể là:
        - `"discouraged"`
          - : Relying party ưa thích không xác minh người dùng để giảm thiểu gián đoạn trải nghiệm người dùng.
        - `"preferred"`
          - : Relying party ưa thích xác minh người dùng nhưng sẽ không thất bại nếu không thể thực hiện.
        - `"required"`
          - : Relying party yêu cầu xác minh người dùng. Nếu không thể thực hiện, sẽ có lỗi xảy ra.

        Nếu bỏ qua, `userVerification` mặc định là `"preferred"`.

- `challenge`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} được cung cấp bởi server của relying party và được sử dụng như [thách thức mật mã](https://en.wikipedia.org/wiki/Challenge%E2%80%93response_authentication). Giá trị này sẽ được ký bởi authenticator và chữ ký sẽ được gửi lại như một phần của {{domxref("AuthenticatorAttestationResponse.attestationObject")}}.

- `excludeCredentials` {{optional_inline}}
  - : Một {{jsxref("Array")}} các đối tượng mô tả các thông tin xác thực hiện có đã được ánh xạ vào tài khoản người dùng này. Điều này được cung cấp bởi relying party và được user agent kiểm tra để tránh tạo thông tin xác thực khóa công khai mới trên authenticator đã có thông tin xác thực được ánh xạ với tài khoản người dùng đã chỉ định. Mỗi mục nên có dạng:
    - `id`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đại diện cho ID thông tin xác thực hiện có.

    - `transports` {{optional_inline}}
      - : Một {{jsxref("Array")}} chuỗi đại diện cho các phương thức vận chuyển được phép. Các phương thức vận chuyển có thể là: `"ble"`, `"hybrid"`, `"internal"`, `"nfc"` và `"usb"`.

    - `type`
      - : Một chuỗi xác định loại thông tin xác thực khóa công khai cần tạo. Hiện tại có thể nhận giá trị duy nhất là `"public-key"`.

    Nếu bỏ qua `excludeCredentials`, nó mặc định là mảng rỗng.

- `extensions` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính đại diện cho giá trị đầu vào cho bất kỳ extension nào được yêu cầu. Các extension này được dùng để chỉ định xử lý bổ sung bởi client hoặc authenticator trong quá trình tạo thông tin xác thực.

    Xem [Web Authentication extensions](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) để biết thông tin về việc sử dụng extension.

- `hints` {{optional_inline}} {{experimental_inline}}
  - : Một mảng chuỗi cung cấp gợi ý về giao diện người dùng mà trình duyệt nên cung cấp cho người dùng để tạo thông tin xác thực khóa công khai.

    Các chuỗi có thể là:
    - `"security-key"`
      - : Giao diện người dùng nên khuyên dùng khóa bảo mật vật lý riêng biệt (như YubiKey).
    - `"client-device"`
      - : Giao diện người dùng nên khuyên dùng authenticator có sẵn trên cùng thiết bị.
    - `"hybrid"`
      - : Giao diện người dùng nên khuyên dùng authenticator đa năng, như ứng dụng authenticator trên điện thoại thông minh.

    Khi nhiều chuỗi được bao gồm trong mảng, thứ tự của chúng biểu thị thứ tự ưu tiên, từ cao đến thấp.

- `pubKeyCredParams`
  - : Một {{jsxref("Array")}} các đối tượng chỉ định các loại khóa và thuật toán chữ ký mà Relying Party hỗ trợ, được sắp xếp từ ưu tiên nhất đến ít ưu tiên nhất. Mỗi đối tượng chứa:
    - `alg`
      - : Một số bằng [COSE Algorithm Identifier](https://www.iana.org/assignments/cose/cose.xhtml#algorithms), đại diện cho thuật toán mật mã sử dụng cho loại thông tin xác thực này. Các relying party muốn hỗ trợ nhiều authenticator nên bao gồm ít nhất:
        - `-8`: EdDSA
        - `-7`: ES256
        - `-257`: RS256

    - `type`
      - : Một chuỗi xác định loại thông tin xác thực khóa công khai cần tạo. Hiện tại có thể nhận giá trị duy nhất là `"public-key"`.

    Nếu không thể tạo bất kỳ loại thông tin xác thực nào trong danh sách, thao tác `create()` sẽ thất bại.

- `rp`
  - : Một đối tượng mô tả relying party yêu cầu tạo thông tin xác thực. Nó có thể chứa các thuộc tính:
    - `id` {{optional_inline}}
      - : Một chuỗi đại diện cho ID của relying party. Nếu bỏ qua, `id` mặc định là nguồn gốc của tài liệu.

    - `name`
      - : Một chuỗi đại diện cho tên của relying party (ví dụ: `"Facebook"`).

- `timeout` {{optional_inline}}
  - : Gợi ý số, tính bằng mili giây, cho biết thời gian ứng dụng web sẵn sàng chờ đợi để hoàn thành thao tác tạo.

- `user`
  - : Một đối tượng mô tả tài khoản người dùng mà thông tin xác thực được tạo cho. Nó có thể chứa các thuộc tính:
    - `displayName`
      - : Một chuỗi cung cấp tên hiển thị thân thiện với con người (ví dụ: `"Maria Sanchez"`).

    - `id`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đại diện cho ID duy nhất của tài khoản người dùng.

    - `name`
      - : Một chuỗi cung cấp mã định danh thân thiện với con người cho tài khoản người dùng để phân biệt giữa các tài khoản có `displayName` tương tự. Đây có thể là địa chỉ email, số điện thoại hoặc tên người dùng.

## Ví dụ

### Tạo thông tin xác thực khóa công khai

Ví dụ này tạo `PublicKeyCredentialCreationOptions`, chỉ chỉ định các thuộc tính bắt buộc và sử dụng giá trị mặc định cho phần còn lại.

Sau đó nó truyền đối tượng vào `navigator.credentials.create()` để tạo thông tin xác thực khóa công khai mới.

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

Lệnh gọi `create()` thành công trả về promise được phân giải với đối tượng {{domxref("PublicKeyCredential")}} có thể sau đó được dùng để xác thực người dùng qua lệnh gọi {{domxref("CredentialsContainer.get()", "get()")}} WebAuthn.

```js
navigator.credentials.create({ publicKey }).then((publicKeyCredential) => {
  const response = publicKeyCredential.response;

  // Truy cập attestationObject ArrayBuffer
  const attestationObj = response.attestationObject;

  // Truy cập client JSON
  const clientJSON = response.clientDataJSON;

  // Trả về authenticator data ArrayBuffer
  const authenticatorData = response.getAuthenticatorData();

  // Trả về public key ArrayBuffer
  const pk = response.getPublicKey();

  // Trả về mã định danh thuật toán khóa công khai
  const pkAlgo = response.getPublicKeyAlgorithm();

  // Trả về mảng phương thức vận chuyển được phép
  const transports = response.getTransports();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
