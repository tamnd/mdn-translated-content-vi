---
title: "HTMLMediaElement: thuộc tính defaultMuted"
short-title: defaultMuted
slug: Web/API/HTMLMediaElement/defaultMuted
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.defaultMuted
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.defaultMuted`** phản ánh thuộc tính HTML [`muted`](/en-US/docs/Web/HTML/Reference/Elements/video#muted), thuộc tính này cho biết liệu đầu ra âm thanh của thành phần đa phương tiện có nên bị tắt tiếng theo mặc định hay không. Thuộc tính này không có hiệu ứng động. Để tắt tiếng và bật tiếng đầu ra âm thanh, hãy sử dụng thuộc tính {{domxref("HTMLMediaElement.muted", "muted")}}.

## Giá trị

Một giá trị boolean. Giá trị `true` có nghĩa là đầu ra âm thanh sẽ bị tắt tiếng theo mặc định.

## Ví dụ

```js
const videoEle = document.createElement("video");
videoEle.defaultMuted = true;
console.log(videoEle.outerHTML); // <video muted=""></video>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.defaultMuted`
- {{domxref("HTMLMediaElement.muted")}}
- {{domxref("HTMLMediaElement.volume")}}
