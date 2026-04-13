---
title: DOMHighResTimeStamp
slug: Web/API/DOMHighResTimeStamp
page-type: web-api-interface
spec-urls: https://w3c.github.io/hr-time/#dom-domhighrestimestamp
---

{{APIRef("Performance API")}}

Kiểu **`DOMHighResTimeStamp`** là `double` và được dùng để lưu trữ giá trị thời gian tính bằng mili giây.

Kiểu này có thể dùng để mô tả một điểm rời rạc trong thời gian hoặc khoảng thời gian (sự chênh lệch thời gian giữa hai điểm rời rạc trong thời gian). Thời điểm bắt đầu có thể là thời gian cụ thể do script xác định cho trang web hoặc ứng dụng, hoặc [thời điểm gốc](/en-US/docs/Web/API/Performance/timeOrigin).

Thời gian tính bằng mili giây phải chính xác đến 5 µs (microsecond), với phần thập phân của số cho biết phần nhỏ hơn mili giây. Tuy nhiên, nếu trình duyệt không thể cung cấp giá trị thời gian chính xác đến 5 µs, trình duyệt có thể biểu diễn giá trị là thời gian tính bằng mili giây chính xác đến mili giây.

## Yêu cầu bảo mật

Để bảo vệ chống lại các cuộc tấn công timing và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), các kiểu `DOMHighResTimeStamp` được làm thô dựa trên trạng thái cô lập site.

- Độ phân giải trong các ngữ cảnh cô lập: 5 microseconds
- Độ phân giải trong các ngữ cảnh không cô lập: 100 microseconds

Cô lập cross-origin site của bạn bằng cách sử dụng các header {{HTTPHeader("Cross-Origin-Opener-Policy")}} và {{HTTPHeader("Cross-Origin-Embedder-Policy")}}:

```http
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

Các header này đảm bảo tài liệu cấp cao nhất không chia sẻ nhóm ngữ cảnh duyệt web với các tài liệu cross-origin.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`performance.now()`](/en-US/docs/Web/API/Performance/now)
- [`performance.timeOrigin`](/en-US/docs/Web/API/Performance/timeOrigin)
