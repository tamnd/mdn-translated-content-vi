---
title: "HTMLMediaElement: thuộc tính ended"
short-title: ended
slug: Web/API/HTMLMediaElement/ended
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.ended
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.ended`** cho biết liệu phương tiện có
phần tử đã kết thúc phát lại.

## Giá trị

Một giá trị boolean là `true` nếu phương tiện chứa trong
phần tử đã chơi xong.

Nếu nguồn của phương tiện là {{domxref("MediaStream")}}, giá trị này là
`true` nếu giá trị thuộc tính {{domxref("MediaStream.active", "active")}} của luồng là `false`.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.ended); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.ended`
- {{domxref("MediaStream")}}
- {{domxref("MediaStream.active")}}
