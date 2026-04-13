---
title: "Navigator: thuộc tính userAgent"
short-title: userAgent
slug: Web/API/Navigator/userAgent
page-type: web-api-instance-property
browser-compat: api.Navigator.userAgent
---

{{ApiRef("HTML DOM")}}

Thuộc tính chỉ đọc **`Navigator.userAgent`** của giao diện {{domxref("Navigator")}} trả về chuỗi `User-Agent` (UA) cho trình duyệt hiện tại.

## Giá trị

Một sợi dây.

## Sự miêu tả

Thuộc tính `userAgent` cung cấp chuỗi UA của trình duyệt hiện tại. Chuỗi UA được xây dựng trên cấu trúc chính thức, có thể phân tách thành nhiều phần thông tin.

Trình duyệt cũng cung cấp chuỗi UA thông qua tiêu đề HTTP {{HTTPHeader("User-Agent")}}. Các phần của thông tin này cũng có sẵn trong các tiêu đề {{Glossary("HTTP")}} như [User-Agent client hints](/en-US/docs/Web/HTTP/Guides/Client_hints) và các tính năng API liên quan khác như {{domxref("Navigator.appVersion")}} và {{domxref("Navigator.platform")}}.

Về mặt lý thuyết, thông tin này hữu ích cho việc phát hiện trình duyệt và cung cấp mã để khắc phục các lỗi dành riêng cho trình duyệt hoặc thiếu hỗ trợ tính năng. Tuy nhiên, điều này **không đáng tin cậy** và **không được khuyến khích** vì những lý do được đưa ra trong [User-Agent reduction](/en-US/docs/Web/HTTP/Guides/User-agent_reduction) và [Browser detection using the user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent).

[Feature detection](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) là một chiến lược đáng tin cậy hơn nhiều.

## Ví dụ

```js
console.log(navigator.userAgent);
// On Chrome on macOS, logs something like "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36" (reduced UA string)

// On Firefox on Windows, logs something like "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề HTTP {{httpheader("User-Agent")}}
