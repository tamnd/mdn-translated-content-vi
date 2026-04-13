---
title: Encrypted Media Extensions API
slug: Web/API/Encrypted_Media_Extensions_API
page-type: web-api-overview
browser-compat: api.Navigator.requestMediaKeySystemAccess
---

{{DefaultAPISidebar("Encrypted Media Extensions")}} {{securecontext_header}}

**Encrypted Media Extensions API** cung cấp các giao diện để kiểm soát phát lại nội dung chịu sự quản lý hạn chế kỹ thuật số.

Quyền truy cập vào API này được cung cấp thông qua {{domxref("Navigator.requestMediaKeySystemAccess()")}}.

## Giao diện

- {{domxref("MediaEncryptedEvent")}}
  - : Đại diện cho sự kiện {{domxref("HTMLMediaElement/encrypted_event", "encrypted")}} cụ thể được ném khi {{domxref('HTMLMediaElement')}} gặp một số dữ liệu khởi tạo.
- {{domxref("MediaKeyMessageEvent")}}
  - : Chứa nội dung và dữ liệu liên quan khi module giải mã nội dung (CDM) tạo thông điệp cho phiên.
- {{domxref("MediaKeys")}}
  - : Đại diện cho tập hợp các khóa mà {{domxref('HTMLMediaElement')}} liên kết có thể sử dụng để giải mã dữ liệu media trong khi phát.
- {{domxref("MediaKeySession")}}
  - : Đại diện cho ngữ cảnh để trao đổi thông điệp với module giải mã nội dung (CDM).
- {{domxref("MediaKeyStatusMap")}}
  - : Map chỉ đọc của các trạng thái khóa media theo ID khóa.
- {{domxref("MediaKeySystemAccess")}}
  - : Cung cấp quyền truy cập vào hệ thống khóa để giải mã và/hoặc nhà cung cấp bảo vệ nội dung.

### Mở rộng cho các giao diện khác

Encrypted Media Extensions API mở rộng các API sau.

#### HTMLMediaElement

- {{domxref("HTMLMediaElement.mediaKeys")}} {{readonlyinline}}
  - : Cung cấp đối tượng {{domxref("MediaKeys")}} đại diện cho tập hợp khóa mà phần tử có thể sử dụng để giải mã dữ liệu media trong khi phát.
- {{domxref("HTMLMediaElement.setMediaKeys()")}}
  - : Đặt {{domxref("MediaKeys")}} sẽ được sử dụng để giải mã media trong khi phát.
- [Sự kiện `encrypted`](/en-US/docs/Web/API/HTMLMediaElement/encrypted_event)
  - : Sự kiện được kích hoạt trên {{domxref("HTMLMediaElement")}} khi dữ liệu khởi tạo được tìm thấy trong media, cho biết nó được mã hóa.

#### Navigator

- {{domxref("Navigator.requestMediaKeySystemAccess()")}}
  - : Trả về {{jsxref('Promise')}} giải quyết thành đối tượng {{domxref('MediaKeySystemAccess')}} có thể được sử dụng để truy cập một hệ thống khóa media cụ thể.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
