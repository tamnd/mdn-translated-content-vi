---
title: "HTMLMediaElement: phương thức canPlayType()"
short-title: canPlayType()
slug: Web/API/HTMLMediaElement/canPlayType
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.canPlayType
---

{{APIRef("HTML DOM")}}

Phương thức {{domxref("HTMLMediaElement")}} **`canPlayType()`** báo cáo khả năng trình duyệt hiện tại có thể phát phương tiện của [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) nhất định.

## Cú pháp

```js-nolint
canPlayType(type)
```

### Tham số

- `type`
- : Một chuỗi chỉ định [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) của phương tiện và (tùy chọn) [`codecs` parameter](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) chứa danh sách các codec được hỗ trợ được phân tách bằng dấu phẩy.

### Giá trị trả về

Một chuỗi cho biết khả năng có thể phát phương tiện đó.
Chuỗi sẽ là một trong các giá trị sau:

- `""` (chuỗi trống)
- : Không thể phát phương tiện trên thiết bị hiện tại.
- `probably`
- : Phương tiện có thể phát được trên thiết bị này.
- `maybe`
- : Không có đủ thông tin để xác định xem phương tiện có thể phát hay không (cho đến khi thực sự thử phát lại).

## Ví dụ

```js
let obj = document.createElement("video");
console.log(obj.canPlayType("video/mp4")); // "maybe"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa phương thức `HTMLMediaElement.canPlayType()`
- {{domxref("MediaCapabilities")}}
- [Handling media support issues in web content](/en-US/docs/Web/Media/Guides/Formats/Support_issues)
- [Media type and format guide](/en-US/docs/Web/Media/Guides/Formats)
- [Codecs in common media types](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter)
