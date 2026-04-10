---
title: "Document: thuộc tính location"
short-title: location
slug: Web/API/Document/location
page-type: web-api-instance-property
browser-compat: api.Document.location
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`location`** của giao diện {{domxref("Document")}} trả về một đối tượng {{domxref("Location")}}, chứa thông tin về URL của tài liệu và cung cấp các phương thức để thay đổi URL đó và tải URL khác.

Để chỉ lấy URL dưới dạng chuỗi, thuộc tính chỉ đọc {{domxref("document.URL")}} cũng có thể được sử dụng.

## Giá trị

Một đối tượng {{domxref("Location")}}. Nếu tài liệu hiện tại không nằm trong browsing context, giá trị trả về là `null`.

Mặc dù thuộc tính `location` tự nó là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `Location`, bạn vẫn có thể gán trực tiếp cho thuộc tính `location`, tương đương với việc gán cho thuộc tính {{domxref("Location/href", "href")}} của nó. Bạn cũng có thể sửa đổi đối tượng `Location` bằng các phương thức {{domxref("Location/assign", "assign()")}} và {{domxref("Location/replace", "replace()")}}.

## Ví dụ

```js
console.log(document.location);
// In ra một đối tượng Location ra console
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện của giá trị trả về, {{domxref("Location")}}
- Thông tin tương tự, nhưng đính kèm với {{Glossary("browsing context")}},
  {{domxref("Window.location")}}
