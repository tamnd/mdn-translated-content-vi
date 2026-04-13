---
title: "CSSImportRule: thuộc tính media"
short-title: media
slug: Web/API/CSSImportRule/media
page-type: web-api-instance-property
browser-compat: api.CSSImportRule.media
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`media`** của giao diện {{domxref("CSSImportRule")}} trả về một đối tượng {{domxref("MediaList")}} đại diện cho danh sách truy vấn phương tiện của quy tắc {{cssxref("@import")}}.

## Giá trị

Một đối tượng {{domxref("MediaList")}}.

Mặc dù thuộc tính `media` itself là chỉ đọc theo nghĩa là bạn không thể thay thế đối tượng `MediaList`, bạn vẫn có thể gán giá trị cho thuộc tính `media` trực tiếp, tương đương với việc gán cho thuộc tính {{domxref("MediaList/mediaText", "mediaText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `MediaList` bằng cách sử dụng các phương thức {{domxref("MediaList/appendMedium", "appendMedium()")}} và {{domxref("MediaList/deleteMedium", "deleteMedium()")}}.

## Ví dụ

### Lấy thuộc tính media

Bảng kiểu sau đây bao gồm một quy tắc {{cssxref("@import")}} duy nhất. Do đó, mục đầu tiên trong danh sách các quy tắc CSS sẽ là một `CSSImportRule`. Thuộc tính `media` trả về một đối tượng {{domxref("MediaList")}}. Điều này bao gồm thuộc tính `mediaText` với giá trị là `screen`.

```css
@import "style.css" screen;
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].media); // Một MediaList
```

### Thiết lập thuộc tính media

Để thay đổi thuộc tính `media` của bảng kiểu liên kết, hãy đặt giá trị của `media` thành một chuỗi chứa giá trị mới.

```js
const myRules = document.styleSheets[0].cssRules;
myRules[0].media = "print";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
