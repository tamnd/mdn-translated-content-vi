---
title: "Navigator: thuộc tính appVersion"
short-title: appVersion
slug: Web/API/Navigator/appVersion
page-type: web-api-instance-property
browser-compat: api.Navigator.appVersion
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`Navigator.appVersion`** của giao diện {{domxref("Navigator")}} trả về một chuỗi biểu thị thông tin phiên bản của trình duyệt.

## Giá trị

Một sợi dây.

## Sự miêu tả

Thuộc tính `appVersion` trả về thông tin cho biết phiên bản trình duyệt.

Lưu ý rằng thông tin trả về thay đổi đáng kể tùy theo trình duyệt. Trong một số trình duyệt, chẳng hạn như Chrome, giá trị này gần giống với giá trị được {{domxref("Navigator.userAgent")}} trả về, với tiền tố `Mozilla/` đã bị xóa. Ví dụ:

```plain
5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36
```

Trong các trình duyệt khác, chẳng hạn như Firefox, phần này được cắt thành một chuỗi ngắn gợi ý về nền tảng/HĐH. Ví dụ:

```plain
5.0 (Macintosh)
```

Về mặt lý thuyết, thông tin này hữu ích cho việc phát hiện trình duyệt và cung cấp mã để khắc phục các lỗi dành riêng cho trình duyệt hoặc thiếu hỗ trợ tính năng. Tuy nhiên, điều này **không đáng tin cậy** và **không được khuyến khích** vì những lý do được đưa ra trong [User-Agent reduction](/en-US/docs/Web/HTTP/Guides/User-agent_reduction) và [Browser detection using the user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent).

[Feature detection](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) là một chiến lược đáng tin cậy hơn nhiều.

## Ví dụ

```js
console.log(navigator.appVersion);
// On Chrome, logs something like "5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36" (reduced UA string)

// On Firefox, logs something like "5.0 (Macintosh)"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator.userAgent")}}
- Tiêu đề HTTP {{HTTPHeader("User-agent")}}
