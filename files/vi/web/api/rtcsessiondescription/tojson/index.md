---
title: "RTCSessionDescription: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/RTCSessionDescription/toJSON
page-type: web-api-instance-method
browser-compat: api.RTCSessionDescription.toJSON
---

{{APIRef("WebRTC")}}

Phương thức **`RTCSessionDescription.toJSON()`** tạo ra một mô tả {{Glossary("JSON")}} của đối tượng. Cả hai thuộc tính, {{domxref("RTCSessionDescription.type", "type")}} và {{domxref("RTCSessionDescription.sdp", "sdp")}}, đều được chứa trong JSON được tạo.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} chứa các thuộc tính sau:

- `type`
  - : Một trong các giá trị sau: `"offer"`, `"answer"`, `"pranswer"` hoặc `null`.
- `sdp`
  - : Hoặc `null` hoặc chuỗi thông báo {{Glossary("SDP")}} tương ứng với thuộc tính {{domxref("RTCSessionDescription.sdp")}}.

## Ví dụ

```js
// sd là một RTCSessionDescriptor

alert(JSON.stringify(sd)); // Lệnh này gọi phương thức toJSON() đằng sau hậu trường.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
