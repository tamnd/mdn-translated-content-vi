---
title: "RTCIceCandidate: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/RTCIceCandidate/toJSON
page-type: web-api-instance-method
browser-compat: api.RTCIceCandidate.toJSON
---

{{APIRef("WebRTC")}}

Phương thức **`toJSON()`** của {{domxref("RTCIceCandidate")}} chuyển đổi `RTCIceCandidate` mà nó được gọi thành JSON.

Một phiên bản được chuỗi hóa của đối tượng có thể được lấy bằng cách gọi {{jsxref("JSON.stringify", "stringify()")}} trên đối tượng được trả về.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

<!-- RTCIceCandidateInit in spec -->

Một đối tượng JSON với các thuộc tính sau, được đặt thành các giá trị tương ứng trong đối tượng `RTCIceCandidate`:

- `candidate` {{optional_inline}}
  - : Một chuỗi mô tả thông tin kết nối mạng cho candidate.
    Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.candidate")}}.
- `sdpMid` {{optional_inline}}
  - : Một chuỗi chứa thẻ định danh của media stream mà candidate được gắn với, hoặc `null` nếu không có media stream được gắn.
    Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.sdpMid")}}.

- `sdpMLineIndex` {{optional_inline}}
  - : Một thuộc tính số chứa chỉ số bắt đầu từ 0 của m-line mà candidate được gắn với, trong [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) của media description, hoặc `null` nếu không có liên kết như vậy.
    Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.sdpMLineIndex")}}.

- `usernameFragment` {{optional_inline}}
  - : Một chuỗi chứa phân đoạn tên người dùng (thường được viết tắt là "ufrag" hoặc "ice-ufrag").
    Phân đoạn này, cùng với mật khẩu ICE ("ice-pwd"), xác định duy nhất một tương tác ICE đang diễn ra (bao gồm cả giao tiếp với máy chủ {{Glossary("STUN")}}).
    Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.usernameFragment")}}.

> [!NOTE]
> Đối tượng JSON được trả về có cùng hình dạng/thuộc tính như đối tượng `candidateInfo` có thể được truyền tùy chọn vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate()","RTCIceCandidate()")}} để cấu hình candidate.

## Ví dụ

Ví dụ đơn giản này lấy một chuỗi JSON biểu diễn một `RTCIceCandidate` được tìm thấy trong biến `candidate`.

```js
let jsonString = candidate.toJSON().stringify();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
