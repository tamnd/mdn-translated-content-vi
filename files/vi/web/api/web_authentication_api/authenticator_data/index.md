---
title: Dữ liệu thiết bị xác thực
slug: Web/API/Web_Authentication_API/Authenticator_data
page-type: guide
---

{{DefaultAPISidebar("Web Authentication API")}}{{securecontext_header}}

Khi một thiết bị xác thực (authenticator) thực hiện đăng ký hoặc xác thực, nó trả về một cấu trúc dữ liệu gọi là **dữ liệu thiết bị xác thực** (authenticator data). Trang này mô tả cấu trúc này.

## Cấu trúc dữ liệu thiết bị xác thực

Dữ liệu thiết bị xác thực là mảng byte có cấu trúc sau:

| Byte offset | Độ dài | Tên                    | Mô tả                                                                             |
| ----------- | ------ | ---------------------- | --------------------------------------------------------------------------------- |
| 0           | 32     | rpIdHash               | Hash SHA-256 của RP ID                                                            |
| 32          | 1      | flags                  | Các cờ bit                                                                        |
| 33          | 4      | signCount              | Bộ đếm chữ ký (big-endian uint32)                                                 |
| 37          | biến   | attestedCredentialData | Dữ liệu thông tin xác thực được chứng thực (chỉ hiện diện trong phản hồi đăng ký) |
| biến        | biến   | extensions             | Các phần mở rộng CBOR (tùy chọn)                                                  |

### rpIdHash

32 byte đầu là hash SHA-256 của [RP ID](https://w3c.github.io/webauthn/#relying-party-identifier). RP ID thường là tên miền của trang web.

### Cờ flags

Byte thứ 33 chứa nhiều cờ bit:

| Bit | Tên                                    | Mô tả                                    |
| --- | -------------------------------------- | ---------------------------------------- |
| 0   | UP (User Presence)                     | Người dùng hiện diện                     |
| 2   | UV (User Verification)                 | Người dùng được xác minh                 |
| 3   | BE (Backup Eligibility)                | Đủ điều kiện sao lưu                     |
| 4   | BS (Backup State)                      | Trạng thái sao lưu                       |
| 6   | AT (Attested Credential Data included) | Dữ liệu thông tin xác thực được đính kèm |
| 7   | ED (Extension Data included)           | Dữ liệu phần mở rộng được đính kèm       |

### signCount

Bộ đếm chữ ký là số nguyên 32-bit big-endian tăng dần cho mỗi thao tác xác thực. Máy chủ có thể dùng này để phát hiện các thiết bị bị sao chép.

### attestedCredentialData

Cấu trúc này chỉ có trong phản hồi đăng ký và chứa:

| Trường              | Độ dài  | Mô tả                                 |
| ------------------- | ------- | ------------------------------------- |
| aaguid              | 16 byte | GUID định danh kiểu thiết bị xác thực |
| credentialIdLength  | 2 byte  | Độ dài của ID thông tin xác thực      |
| credentialId        | biến    | ID thông tin xác thực duy nhất        |
| credentialPublicKey | biến    | Khóa công khai được mã hóa CBOR       |

## Đọc dữ liệu thiết bị xác thực

Dữ liệu thiết bị xác thực có trong phản hồi từ thiết bị:

```js
const credential = await navigator.credentials.create({ publicKey: options });

// Lấy phản hồi xác thực
const attestationResponse = credential.response;

// Dữ liệu thiết bị xác thực có sẵn tại:
const authenticatorData = attestationResponse.getAuthenticatorData();
// hoặc
const rawAuthenticatorData = attestationResponse.authenticatorData;
```

## Xác minh phía máy chủ

Sau khi nhận dữ liệu thiết bị xác thực, máy chủ cần xác minh:

1. **rpIdHash** khớp với hash SHA-256 của RP ID dự kiến.
2. Cờ **UP** (User Presence) được đặt.
3. Cờ **UV** (User Verification) được đặt (nếu yêu cầu).
4. **signCount** lớn hơn giá trị đã lưu (để phát hiện replay).

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- [WebAuthn Level 3 specification](https://w3c.github.io/webauthn/#sctn-authenticator-data)
