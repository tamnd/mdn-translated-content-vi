---
title: "HTMLTrackElement: thuộc tính srclang"
short-title: srclang
slug: Web/API/HTMLTrackElement/srclang
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.srclang
---

{{APIRef("HTML DOM")}}

Thuộc tính **`srclang`** của giao diện {{domxref("HTMLTrackElement")}} phản ánh giá trị của thuộc tính [`srclang`](/en-US/docs/Web/HTML/Reference/Elements/track#srclang) của phần tử {{HTMLElement("track")}} hoặc chuỗi rỗng nếu không được định nghĩa.

Thuộc tính `srclang` là một {{glossary("BCP 47 language tag")}} cho biết ngôn ngữ của dữ liệu text track.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.log(`Ngôn ngữ của Track: ${trackElement.srclang}`);
trackElement.srclang = "en-US";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement")}}
- {{HTMLElement("track")}}
