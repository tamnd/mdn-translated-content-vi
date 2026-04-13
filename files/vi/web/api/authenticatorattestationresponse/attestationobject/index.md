---
title: "AuthenticatorAttestationResponse: thuộc tính attestationObject"
short-title: attestationObject
slug: Web/API/AuthenticatorAttestationResponse/attestationObject
page-type: web-api-instance-property
browser-compat: api.AuthenticatorAttestationResponse.attestationObject
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính **`attestationObject`** của giao diện {{domxref("AuthenticatorAttestationResponse")}} trả về một {{jsxref("ArrayBuffer")}} chứa khóa công khai mới, cùng với chữ ký trên toàn bộ `attestationObject` bằng một khóa riêng tư được lưu trong authenticator khi nó được sản xuất.

Là một phần của lệnh gọi {{domxref("CredentialsContainer.create()")}}, một authenticator sẽ tạo một cặp khóa mới cùng với một `attestationObject` cho cặp khóa đó. Khóa công khai tương ứng với khóa riêng tư đã tạo chữ ký attestation là thông tin đã được biết đến rộng rãi; tuy nhiên, có nhiều chuỗi khóa công khai attestation đã biết cho các hệ sinh thái khác nhau (ví dụ: attestation Android hoặc TPM).

## Giá trị

Sau khi giải mã `ArrayBuffer` được mã hóa bằng [CBOR](https://datatracker.ietf.org/doc/html/rfc8949), đối tượng JavaScript thu được sẽ chứa các thuộc tính sau:

- `authData`
  - : [Dữ liệu authenticator](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data) cho thao tác. Lưu ý rằng trong {{domxref("AuthenticatorAssertionResponse")}}, `authenticatorData` được lộ ra dưới dạng một thuộc tính trong đối tượng JavaScript (xem {{domxref("AuthenticatorAssertionResponse.authenticatorData")}}), trong khi trong {{domxref("AuthenticatorAttestationResponse")}}, `authenticatorData` là một thuộc tính trong một ánh xạ [CBOR](https://datatracker.ietf.org/doc/html/rfc8949).

    Trường {{domxref("AuthenticatorAssertionResponse.authenticatorData")}} giống nhau được dùng bởi cả `AuthenticatorAttestationResponse` lẫn `AuthenticatorAssertionResponse`. Khi được dùng trong attestation, nó chứa một trường tùy chọn là `attestedCredentialData`. Trường này không được bao gồm khi dùng trong `AuthenticatorAssertionResponse`. Trường `attestedCredentialData` chứa `credentialId` và `credentialPublicKey`.

- `fmt`
  - : Một chuỗi văn bản cho biết định dạng của `attStmt`. [Đặc tả WebAuthn định nghĩa một số định dạng](https://w3c.github.io/webauthn/#sctn-defined-attestation-formats); tuy nhiên, các định dạng cũng có thể được định nghĩa trong các đặc tả khác và đăng ký trong [sổ đăng ký IANA](https://w3c.github.io/webauthn/#sctn-att-fmt-reg). Các định dạng do WebAuthn định nghĩa là:
    - `"packed"`
    - `"tpm"`
    - `"android-key"`
    - `"android-safetynet"`
    - `"fido-u2f"`
    - `"none"`

- `attStmt`
  - : Một attestation statement có định dạng được xác định bởi `"fmt"`. Hiện tại, [hãy xem đặc tả WebAuthn để biết chi tiết về từng định dạng](https://w3c.github.io/webauthn/#sctn-defined-attestation-formats).

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CredentialsContainer.create()")}}: phương thức dùng để tạo một statement với `challenge` mật mã mà chữ ký của authenticator được chứa trong `attStmt`, với tùy chọn truyền tải `attestation` được chỉ định.
