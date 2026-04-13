---
title: "HTMLTrackElement: thuộc tính kind"
short-title: kind
slug: Web/API/HTMLTrackElement/kind
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.kind
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`kind`** của giao diện {{domxref("HTMLTrackElement")}} đại diện cho loại track, hoặc cách text track được sử dụng. Nó phản ánh thuộc tính liệt kê [`kind`](/en-US/docs/Web/HTML/Reference/Elements/track#kind) của phần tử {{htmlelement("track")}}.

Nếu không có `kind` nào được đặt, `subtitles` sẽ được sử dụng. Nếu thuộc tính không được đặt thành một trong các giá trị liệt kê hợp lệ, nó không hợp lệ và `metadata` sẽ được sử dụng. Các giá trị hợp lệ khác bao gồm `captions`, `descriptions` và `chapters`.

## Giá trị

Một chuỗi chữ thường: `captions`, `descriptions`, `chapters`, `subtitles` hoặc `metadata`.

## Ví dụ

Cho HTML sau:

```html
<track src="track.vtt" id="exampleTrack" />
```

Chúng ta nhận được các kết quả sau:

```js
const trackElement = document.getElementById("exampleTrack");
// giá trị thiếu
console.log(trackElement.kind); // "subtitles"
trackElement.kind = "INVALID";
// giá trị không hợp lệ
console.log(trackElement.kind); // "metadata"
trackElement.kind = "CAPTIONS";
// giá trị hợp lệ
console.log(trackElement.kind); // "captions"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement.track")}}
- {{domxref("HTMLTrackElement.label")}}
