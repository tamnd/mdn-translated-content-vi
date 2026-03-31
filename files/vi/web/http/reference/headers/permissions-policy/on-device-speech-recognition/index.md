---
title: "Permissions-Policy: chỉ thị on-device-speech-recognition"
short-title: on-device-speech-recognition
slug: Web/HTTP/Reference/Headers/Permissions-Policy/on-device-speech-recognition
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.on-device-speech-recognition
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `on-device-speech-recognition` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát quyền truy cập vào chức năng [nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng, mọi nỗ lực gọi các phương thức {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}} hoặc {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}} của API sẽ thất bại.

## Cú pháp

```http
Permissions-Policy: on-device-speech-recognition=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `on-device-speech-recognition` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
