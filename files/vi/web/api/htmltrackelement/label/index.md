---
title: "HTMLTrackElement: thuộc tính label"
short-title: label
slug: Web/API/HTMLTrackElement/label
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.label
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`label`** của giao diện {{domxref("HTMLTrackElement")}} đại diện cho tiêu đề mà người dùng có thể đọc được, hiển thị khi liệt kê phụ đề, chú thích và mô tả âm thanh cho một track. Nó phản ánh thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/track#label) của phần tử {{htmlelement("track")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.log(`Nhãn của track: ${trackElement.label}`);
trackElement.label = "Updated label";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement.track")}}
- {{domxref("HTMLTrackElement.kind")}}
