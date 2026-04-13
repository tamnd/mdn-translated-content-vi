---
title: "StyleSheet: media property"
short-title: media
slug: Web/API/StyleSheet/media
page-type: web-api-instance-property
browser-compat: api.StyleSheet.media
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`media`** của giao diện {{domxref("StyleSheet")}} chứa một đối tượng {{domxref("MediaList")}} đại diện cho phương tiện đích dự kiến cho thông tin định kiểu.

## Giá trị

Một đối tượng {{domxref("MediaList")}}. Giá trị của nó được đặt bởi thuộc tính [`media`](/en-US/docs/Web/HTML/Reference/Elements/link#media) trên phần tử `<link>` hoặc `<style>` tương ứng. Nếu thuộc tính `media` không được đặt hoặc rỗng, nó trả về một `MediaList` rỗng, tức là `MediaList` có thuộc tính `length` bằng `0`.

Mặc dù bản thân thuộc tính `media` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `MediaList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `media`, tương đương với việc gán cho thuộc tính {{domxref("MediaList/mediaText", "mediaText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `MediaList` bằng các phương thức {{domxref("MediaList/appendMedium", "appendMedium()")}} và {{domxref("MediaList/deleteMedium", "deleteMedium()")}}.

## Ví dụ

Giả sử phần `<head>` chứa như sau:

```html
<link rel="stylesheet" href="document.css" media="screen" />
<style rel="stylesheet" media="screen, print">
  body {
    background-color: snow;
  }
</style>
```

Thì:

```js
for (let i = 0; i < document.styleSheets.length; i++) {
  console.log(
    `document.styleSheets[${i}].media: ${JSON.stringify(
      document.styleSheets[i].media,
    )}`,
  );
  if (i === 0) document.styleSheets[i].media.appendMedium("handheld");
  if (i === 1) document.styleSheets[i].media.deleteMedium("print");
  console.log(
    `document.styleSheets[${i}].media: ${JSON.stringify(
      document.styleSheets[i].media,
    )}`,
  );
}
// This will log:
// document.styleSheets[0].media: {"0":"screen"}
// document.styleSheets[0].media: {"0":"screen","1":"handheld"}
// document.styleSheets[1].media: {"0":"screen","1":"print"}
// document.styleSheets[1].media: {"0":"screen"}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
