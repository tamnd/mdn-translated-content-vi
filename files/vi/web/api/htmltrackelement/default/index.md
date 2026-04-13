---
title: "HTMLTrackElement: thuộc tính default"
short-title: default
slug: Web/API/HTMLTrackElement/default
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.default
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`default`** của giao diện {{domxref("HTMLTrackElement")}} đại diện cho việc track có được bật hay không nếu tùy chọn của người dùng không chỉ ra rằng một track khác sẽ phù hợp hơn. Nó phản ánh thuộc tính boolean [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default) của phần tử {{htmlelement("track")}}, trả về `true` nếu có và `false` ngược lại.

## Giá trị

Một Boolean.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.log(trackElement.default);
trackElement.default = true;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement.kind")}}
- {{domxref("HTMLTrackElement.label")}}
