---
title: "MediaList: phương thức toString()"
short-title: toString()
slug: Web/API/MediaList/toString
page-type: web-api-instance-method
browser-compat: api.MediaList.toString
---

{{APIRef("CSSOM")}}

Phương thức {{Glossary("stringifier")}} **`toString()`** của giao diện {{domxref("MediaList")}} trả về một chuỗi đại diện cho các giá trị của đối tượng. Giá trị là một danh sách các giá trị media được phân tách bằng dấu phẩy theo cùng định dạng như thuộc tính {{domxref("MediaList.mediaText")}}.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi.

## Ví dụ

```js
const firstStyleSheet = document.styleSheets[0]; // the document's first stylesheet
const mediaList = firstStyleSheet.media; // the mediaList of the stylesheet

// set the `media` text to a media query value
mediaList.mediaText = "SCREEN AND (140PX <= WIDTH <= 380PX)";

// add a second media value
mediaList.appendMedium("SCREEN AND (ORIENTATION: LANDSCAPE))");

// erroneously, add the same media query again
mediaList.appendMedium("SCREEN AND (ORIENTATION: LANDSCAPE))");

console.log(mediaList.toString());
// "screen and (140px <= width <= 380px), screen and (orientation: landscape)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaList.mediaText")}}
- {{domxref("MediaList.appendMedium()")}}
- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
