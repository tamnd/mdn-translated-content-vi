---
title: "HTMLMetaElement: thuộc tính scheme"
short-title: scheme
slug: Web/API/HTMLMetaElement/scheme
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLMetaElement.scheme
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}

Thuộc tính **`HTMLMetaElement.scheme`** định nghĩa lược đồ của giá trị trong thuộc tính {{domxref("HTMLMetaElement.content")}}.
Thuộc tính `scheme` được tạo ra để cho phép cung cấp thông tin bổ sung được sử dụng để diễn giải giá trị của thuộc tính `content`. Thuộc tính `scheme` nhận giá trị là định dạng lược đồ (ví dụ: `YYYY-MM-DD`) hoặc tên định dạng lược đồ (ví dụ: `ISBN`), hoặc một URI cung cấp thêm thông tin về định dạng lược đồ. Lược đồ định nghĩa định dạng của giá trị của thuộc tính `content`.
Nội dung `scheme` được hiểu là phần mở rộng của {{domxref("HTMLMetaElement.name")}} của phần tử nếu trình duyệt hoặc user agent nhận ra lược đồ.

Thuộc tính này đã lỗi thời và không nên sử dụng trên các trang web mới.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau truy vấn một phần tử `<meta>` chứa thuộc tính `name` với giá trị `identifier`.
Giá trị `scheme` được ghi vào bảng điều khiển để hiển thị lược đồ của nội dung siêu dữ liệu:

```js
// given <meta name="identifier" content="1580081754" scheme="ISBN">
const meta = document.querySelector("meta[name='identifier']");
console.log(meta.scheme);
// "ISBN"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("meta")}}
