---
title: MediaList
slug: Web/API/MediaList
page-type: web-api-interface
browser-compat: api.MediaList
---

{{APIRef("CSSOM")}}

Giao diện **`MediaList`** đại diện cho các media query của một stylesheet, ví dụ như những thứ được đặt bằng thuộc tính `media` của một phần tử {{htmlelement("link")}}.

> [!NOTE]
> `MediaList` là một danh sách trực tiếp; việc cập nhật danh sách bằng các thuộc tính hoặc phương thức được liệt kê dưới đây sẽ ngay lập tức cập nhật hành vi của tài liệu.

## Thuộc tính phiên bản

- {{domxref("MediaList.mediaText")}}
  - : Một {{Glossary("stringifier")}} trả về một chuỗi đại diện cho `MediaList` dưới dạng văn bản, và cũng cho phép bạn đặt một `MediaList` mới.
- {{domxref("MediaList.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng media query trong `MediaList`.

## Phương thức phiên bản

- {{domxref("MediaList.appendMedium()")}}
  - : Thêm một media query vào `MediaList`.
- {{domxref("MediaList.deleteMedium()")}}
  - : Xóa một media query khỏi `MediaList`.
- {{domxref("MediaList.item()")}}
  - : Một getter trả về một chuỗi đại diện cho một media query dưới dạng văn bản, cho giá trị chỉ mục của media query bên trong `MediaList`. Phương thức này cũng có thể được gọi bằng cú pháp dấu ngoặc (`[]`).
- {{domxref("MediaList.toString()")}}
  - : Trả về biểu diễn chuỗi của media list này theo cùng định dạng như thuộc tính {{domxref("MediaList.mediaText")}} của đối tượng.

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
