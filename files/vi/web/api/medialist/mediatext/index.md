---
title: "MediaList: thuộc tính mediaText"
short-title: mediaText
slug: Web/API/MediaList/mediaText
page-type: web-api-instance-property
browser-compat: api.MediaList.mediaText
---

{{APIRef("CSSOM")}}

Thuộc tính **`mediaText`** của giao diện {{domxref("MediaList")}} là một {{Glossary("stringifier")}} trả về một chuỗi đại diện cho `MediaList` dưới dạng văn bản, và cũng cho phép bạn đặt một `MediaList` mới.

## Giá trị

Một chuỗi đại diện cho các media query của một stylesheet. Mỗi cái được phân tách bằng dấu phẩy, ví dụ `screen and (width >= 480px), print`.

Nếu bạn muốn đặt các media query mới trên tài liệu, giá trị chuỗi phải có các query khác nhau được phân tách bằng dấu phẩy, ví dụ `screen, print`. Lưu ý rằng `MediaList` là một danh sách trực tiếp; việc cập nhật danh sách qua `mediaText` sẽ ngay lập tức cập nhật hành vi của tài liệu.

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `ml.mediaText = null` tương đương với `ml.mediaText = ""`.

## Ví dụ

Ví dụ sau sẽ ghi vào console biểu diễn văn bản của `MediaList` của stylesheet đầu tiên được áp dụng cho tài liệu hiện tại.

```js
const stylesheets = document.styleSheets;
let stylesheet = stylesheets[0];
console.log(stylesheet.media.mediaText);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
