---
title: MediaKeySession
slug: Web/API/MediaKeySession
page-type: web-api-interface
browser-compat: api.MediaKeySession
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaKeySession`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) đại diện cho một ngữ cảnh trao đổi thông điệp với một module giải mã nội dung (CDM).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("MediaKeySession.closed")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} báo hiệu khi một `MediaKeySession` đóng. Promise này chỉ có thể được thực hiện và không bao giờ bị từ chối. Đóng một phiên có nghĩa là các giấy phép và khóa liên kết với nó không còn hợp lệ để giải mã dữ liệu phương tiện.
- {{domxref("MediaKeySession.expiration")}} {{ReadOnlyInline}}
  - : Thời gian sau đó các khóa trong phiên hiện tại không còn có thể được sử dụng để giải mã dữ liệu phương tiện, hoặc `NaN` nếu không có thời gian như vậy. Giá trị này được xác định bởi CDM và được đo bằng mili giây kể từ ngày 1 tháng 1 năm 1970, UTC. Giá trị này có thể thay đổi trong suốt thời gian phiên, chẳng hạn như khi một hành động kích hoạt sự bắt đầu của một cửa sổ.
- {{domxref("MediaKeySession.keyStatuses")}} {{ReadOnlyInline}}
  - : Chứa một tham chiếu đến một {{domxref("MediaKeyStatusMap")}} chỉ đọc của các khóa của phiên hiện tại và trạng thái của chúng.
- {{domxref("MediaKeySession.sessionId")}} {{ReadOnlyInline}}
  - : Chứa một chuỗi duy nhất được tạo bởi CDM cho đối tượng phương tiện hiện tại và các khóa hoặc giấy phép liên kết với nó.

### Sự kiện

- {{domxref("MediaKeySession.keystatuseschange_event", "keystatuseschange")}}
  - : Kích hoạt khi có thay đổi trong các khóa của một phiên hoặc trạng thái của chúng.
- {{domxref("MediaKeySession.message_event", "message")}}
  - : Kích hoạt khi module giải mã nội dung đã tạo ra một thông điệp cho phiên.

## Phương thức phiên bản

- {{domxref("MediaKeySession.close()")}}
  - : Trả về một {{jsxref("Promise")}} sau khi thông báo rằng phiên phương tiện hiện tại không còn cần thiết và CDM nên giải phóng mọi tài nguyên liên quan đến đối tượng này và đóng nó.
- {{domxref("MediaKeySession.generateRequest()")}}
  - : Trả về một {{jsxref("Promise")}} sau khi tạo yêu cầu giấy phép dựa trên dữ liệu khởi tạo.
- {{domxref("MediaKeySession.load()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành giá trị boolean sau khi tải dữ liệu cho một đối tượng phiên được chỉ định.
- {{domxref("MediaKeySession.remove()")}}
  - : Trả về một {{jsxref("Promise")}} sau khi xóa mọi dữ liệu phiên liên quan đến đối tượng hiện tại.
- {{domxref("MediaKeySession.update()")}}
  - : Trả về một {{jsxref("Promise")}} sau khi tải thông điệp và giấy phép vào CDM.

## Ví dụ

```js
// TBD
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
