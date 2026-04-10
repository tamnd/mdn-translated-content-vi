---
title: "HTMLAnchorElement: thuộc tính attributionSourceId"
short-title: attributionSourceId
slug: Web/API/HTMLAnchorElement/attributionSourceId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLAnchorElement.attributionSourceId
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Thuộc tính **`attributionSourceId`** của giao diện {{domxref("HTMLAnchorElement")}} lấy và đặt thuộc tính HTML `attributionsourceid` trên một phần tử {{htmlelement("a")}}.

`attributionSourceId` được sử dụng như một phần của đặc tả kỹ thuật [Private Click Measurement](https://privacycg.github.io/private-click-measurement/) để xác định nội dung đã được nhấp khi theo dõi liên kết đến một trang web khác.

## Giá trị

Một số. Các giá trị hợp lệ cho phép đo nhấp chuột riêng tư nằm trong khoảng từ `0` đến `255`. Giá trị mặc định là `0`. Các giá trị ngoài phạm vi này sẽ không gây lỗi khi đặt thuộc tính, nhưng sẽ bị trình duyệt bỏ qua cho mục đích quy kết.

## Ví dụ

### Đặt định danh nguồn quy kết trên một liên kết

```html
<a
  id="ad-link"
  href="https://example.com"
  attributiondestination="https://example.com">
  Nhấp để ghé thăm cửa hàng của chúng tôi
</a>
```

```js
const adLink = document.getElementById("ad-link");
adLink.attributionSourceId = 17;

console.log(adLink.attributionSourceId); // 17
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLAnchorElement")}}
- Phần tử HTML {{htmlelement("a")}}
- Đặc tả kỹ thuật [Private Click Measurement](https://privacycg.github.io/private-click-measurement/)
