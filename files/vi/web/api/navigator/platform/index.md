---
title: "Navigator: thuộc tính platform"
short-title: platform
slug: Web/API/Navigator/platform
page-type: web-api-instance-property
browser-compat: api.Navigator.platform
---

{{APIRef("HTML DOM")}}

Thuộc tính **`platform`** thuộc tính chỉ đọc của giao diện {{domxref("Navigator")}} trả về một chuỗi xác định nền tảng mà trình duyệt của người dùng đang chạy.

## Giá trị

Ví dụ: một chuỗi biểu thị một nền tảng:

- `"MacIntel"`
- `"Win32"`
- `"Linux x86_64"`

> [!LƯU Ý]
> Trên Windows, các trình duyệt hiện đại trả về `"Win32"` ngay cả khi chạy trên phiên bản Windows 64-bit.

## Sự miêu tả

Thuộc tính `platform` cho biết nền tảng/HĐH mà trình duyệt đang chạy.

Về mặt lý thuyết, thông tin này hữu ích cho việc phát hiện trình duyệt và cung cấp mã để khắc phục các lỗi dành riêng cho trình duyệt hoặc thiếu hỗ trợ tính năng. Tuy nhiên, điều này **không đáng tin cậy** và **không được khuyến khích** vì những lý do được đưa ra trong [User-Agent reduction](/en-US/docs/Web/HTTP/Guides/User-agent_reduction) và [Browser detection using the user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent).

[Feature detection](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) là một chiến lược đáng tin cậy hơn nhiều.

## Ví dụ

### Xác định khóa bổ trợ cho nền tảng của người dùng

Một trường hợp `navigator.platform` có thể hữu ích là khi bạn cần hiển thị lời khuyên cho người dùng về việc liệu phím bổ trợ cho phím tắt có phải là phím lệnh `⌘` (có trên các hệ thống của Apple) chứ không phải là phím điều khiển `Ctrl` (trên các hệ thống không phải của Apple):

```js
const modifierKeyPrefix =
  navigator.platform.startsWith("Mac") || navigator.platform === "iPhone"
    ? "⌘" // command key
    : "Ctrl"; // control key
```

Mã này kiểm tra xem `navigator.platform` có bắt đầu bằng `"Mac"` hay không hoặc có khớp chính xác với `"iPhone"` hay không, sau đó dựa trên việc một trong hai thứ đó có phải là `true` hay không, hãy đặt biến `modifierKeyPrefix` thành khóa sửa đổi thích hợp cho nền tảng của người dùng. Điều này có thể được sử dụng trong giao diện người dùng web để cho người dùng biết họ cần phím bổ trợ nào khi sử dụng phím tắt.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator.userAgent")}}
- Tiêu đề HTTP {{HTTPHeader("User-agent")}}
