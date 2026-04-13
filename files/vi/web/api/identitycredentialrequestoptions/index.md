---
title: IdentityCredentialRequestOptions
slug: Web/API/IdentityCredentialRequestOptions
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CredentialsContainer.get.identity_option
spec-urls: https://w3c-fedid.github.io/FedCM/#dictdef-identitycredentialrequestoptions
---

{{APIRef("FedCM API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Dictionary **`IdentityCredentialRequestOptions`** đại diện cho đối tượng được truyền vào {{domxref("CredentialsContainer.get()")}} như giá trị của tùy chọn `identity`.

Khi tùy chọn `identity` được cung cấp trong lệnh gọi `get()` được thực hiện trên trang web {{glossary("Relying party", "relying party")}} (RP), người dùng được cung cấp danh sách các {{glossary("identity provider", "nhà cung cấp danh tính liên kết")}} (IdP) như các tùy chọn đăng nhập. Khi người dùng đăng nhập thành công bằng một trong các tùy chọn này, promise được trả về bởi lệnh gọi `get()` trả về đối tượng {{domxref("IdentityCredential")}}.

## Thuộc tính phiên bản

- `context` {{optional_inline}}
  - : Một chuỗi chỉ định ngữ cảnh trong đó người dùng đang xác thực với FedCM. Giá trị mặc định là `"signin"`.
- `mode` {{optional_inline}}
  - : Một chuỗi chỉ định chế độ UI để sử dụng cho luồng đăng nhập. Các giá trị có thể là:
    - `active`: Luồng đăng nhập phải được khởi tạo thông qua hành động của người dùng như nhấp vào nút.
    - `passive`: Luồng đăng nhập có thể được khởi tạo mà không cần tương tác trực tiếp của người dùng. Đây là giá trị mặc định.
- `providers`
  - : Một mảng các đối tượng chỉ định chi tiết của các IdP mà người dùng nên được trình bày như các tùy chọn để đăng nhập. Các đối tượng này có thể chứa các thuộc tính sau:
    - `configURL`
      - : Một chuỗi chỉ định URL của tệp cấu hình IdP.
    - `clientId`
      - : Một chuỗi chỉ định định danh client RP.
    - `domainHint` {{optional_inline}}
      - : Một chuỗi gợi ý về tên miền của các tài khoản mà RP quan tâm.
    - `fields` {{optional_inline}}
      - : Một mảng chuỗi chỉ định thông tin người dùng mà RP muốn lấy từ IdP.
    - `loginHint` {{optional_inline}}
      - : Một chuỗi cung cấp gợi ý về tùy chọn tài khoản mà trình duyệt nên cung cấp cho người dùng để đăng nhập.
    - `nonce` {{optional_inline}}
      - : Một chuỗi ngẫu nhiên có thể được bao gồm để đảm bảo phản hồi được cấp cụ thể cho yêu cầu này.
    - `params` {{optional_inline}}
      - : Bất kỳ tham số bổ sung nào mà RP cần truyền cho IdP.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
