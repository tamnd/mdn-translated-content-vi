---
title: "HTMLImageElement: src property"
short-title: src
slug: Web/API/HTMLImageElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`src`** của giao diện {{domxref("HTMLImageElement")}} chỉ định hình ảnh sẽ hiển thị trong phần tử {{HTMLElement("img")}}. Nó phản ánh thuộc tính nội dung [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) của phần tử `<img>`.

## Giá trị

Một sợi dây. Để biết thêm thông tin về cú pháp của thuộc tính `src`, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#src).

## Ví dụ

### Đặt thuộc tính src

```js
const img = new Image();
img.src = "example.png";
img.alt = "An example picture";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.currentSrc")}}
- {{domxref("HTMLImageElement.srcset")}}
- {{domxref("HTMLImageElement.sizes")}}
