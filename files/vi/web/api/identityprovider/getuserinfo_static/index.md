---
title: "IdentityProvider: getUserInfo() static method"
short-title: getUserInfo()
slug: Web/API/IdentityProvider/getUserInfo_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.IdentityProvider.getUserInfo_static
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức tĩnh **`getUserInfo()`** của giao diện {{domxref("IdentityProvider")}} trả về thông tin về một người dùng đã đăng nhập, có thể được dùng để hiển thị thông điệp chào mừng và nút đăng nhập được cá nhân hóa. Phương thức này phải được gọi từ trong một {{htmlelement("iframe")}} có origin của {{glossary("Identity provider", "IdP")}} để các script của {{glossary("Relying party", "relying party")}} (RP) không thể truy cập dữ liệu. Điều này phải xảy ra sau khi người dùng đã đăng nhập vào một trang RP.

Mẫu này đã phổ biến trên các trang sử dụng liên kết danh tính để đăng nhập, nhưng `getUserInfo()` cung cấp cách thực hiện mà không cần dựa vào [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies).

## Cú pháp

```js-nolint
IdentityProvider.getUserInfo(config)
```

### Tham số

- `config`
  - : Một đối tượng cấu hình, có thể chứa các thuộc tính sau:
    - `configURL`
      - : URL của [tệp cấu hình](/en-US/docs/Web/API/FedCM_API/IDP_integration#provide_a_config_file_and_endpoints) cho nhà cung cấp danh tính mà bạn muốn lấy thông tin người dùng.
    - `clientId`
      - : Mã định danh client của RP do IdP cấp.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một mảng các đối tượng, mỗi đối tượng chứa thông tin đại diện cho một tài khoản người dùng riêng. Mỗi đối tượng chứa các thuộc tính sau:

- `email`
  - : Một chuỗi đại diện cho địa chỉ email của người dùng.
- `name`
  - : Một chuỗi đại diện cho tên đầy đủ của người dùng.
- `givenName`
  - : Một chuỗi đại diện cho tên riêng (tên gọi hoặc tên viết tắt) của người dùng.
- `picture`
  - : Một chuỗi đại diện cho URL ảnh đại diện của người dùng.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu `configURL` được cung cấp không hợp lệ hoặc nếu origin của tài liệu nhúng không khớp với `configURL`.
- `NetworkError` {{domxref("DOMException")}}
  - : Ném ra nếu trình duyệt không thể kết nối với IdP hoặc nếu `getUserInfo()` được gọi từ tài liệu cấp cao nhất.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu `<iframe>` nhúng không có [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}} cho phép sử dụng `getUserInfo()` hoặc nếu FedCM API bị vô hiệu hóa toàn cục bởi chính sách được đặt trên tài liệu cấp cao nhất.

## Mô tả

Khi `getUserInfo()` được gọi, trình duyệt sẽ gửi yêu cầu đến [điểm cuối danh sách tài khoản](/en-US/docs/Web/API/FedCM_API/IDP_integration#the_accounts_list_endpoint) của IdP được chỉ định để lấy thông tin người dùng chỉ khi cả hai điều kiện sau đều đúng:

- Người dùng đã đăng nhập vào RP với IdP qua FedCM trên cùng phiên trình duyệt, và dữ liệu chưa bị xóa.
- Người dùng đã đăng nhập vào IdP trên cùng phiên trình duyệt.

`getUserInfo()` phải được gọi từ trong một `<iframe>` nhúng, và origin của trang nhúng phải khớp với `configURL` của IdP. Ngoài ra, HTML nhúng phải cho phép sử dụng nó một cách rõ ràng qua [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}}:

```html
<iframe
  src="https://idp.example/signin"
  allow="identity-credentials-get"></iframe>
```

## Ví dụ

### Cách sử dụng cơ bản của `IdentityProvider.getUserInfo()`

Ví dụ sau đây minh họa cách phương thức `IdentityProvider.getUserInfo()` có thể được sử dụng để trả về thông tin về người dùng đã đăng nhập trước đó từ một IdP cụ thể.

```js
// Iframe displaying a page from the https://idp.example origin
const userInfo = await IdentityProvider.getUserInfo({
  configURL: "https://idp.example/fedcm.json",
  clientId: "client1234",
});

// IdentityProvider.getUserInfo() returns an array of user information.
if (userInfo.length > 0) {
  // Returning accounts should be first, so the first account received
  // is guaranteed to be a returning account
  const name = userInfo[0].name;
  const givenName = userInfo[0].given_name;
  const displayName = givenName || name;
  const picture = userInfo[0].picture;
  const email = userInfo[0].email;

  // …

  // Render the personalized sign-in button using the information above
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview) on developer.chrome.com (2023)
