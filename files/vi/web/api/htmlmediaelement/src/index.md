---
title: "HTMLMediaElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLMediaElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.src`** phản ánh giá trị của
Thuộc tính `src` của phần tử phương tiện HTML, cho biết URL của phương tiện
tài nguyên để sử dụng trong phần tử.

> [!NOTE]
> Cách tốt nhất để biết URL của tài nguyên phương tiện hiện nay
> được sử dụng tích cực trong phần tử này là xem xét giá trị của
> Thuộc tính {{domxref("HTMLMediaElement.currentSrc", "currentSrc")}}, cũng sử dụng
> tính đến việc lựa chọn tài nguyên phương tiện tốt nhất hoặc ưa thích từ danh sách được cung cấp trong
> {{domxref("HTMLSourceElement")}} (đại diện cho {{HTMLElement("source")}}
> yếu tố).

## Giá trị

Một chuỗi chứa URL của tài nguyên phương tiện để sử dụng trong
yếu tố; thuộc tính này phản ánh giá trị `src` của phần tử HTML
thuộc tính.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.src); // ""
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.src`
