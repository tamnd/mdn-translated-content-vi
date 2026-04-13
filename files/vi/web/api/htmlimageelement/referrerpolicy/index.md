---
title: "HTMLImageElement: referrerPolicy property"
short-title: referrerPolicy
slug: Web/API/HTMLImageElement/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.referrerPolicy
---

{{APIRef("HTML DOM")}}

Thuộc tính **`referrerPolicy`** của giao diện {{domxref("HTMLImageElement")}} xác định liên kết giới thiệu nào được gửi khi tìm nạp tài nguyên. Nó phản ánh thuộc tính nội dung [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/img#referrerpolicy) của phần tử `<img>`.

## Giá trị

Một chuỗi có giá trị là một trong `no-referrer`, `no-referrer-when-downgrade`, `origin`, `origin-when-cross-origin`, `same-origin`, `strict-origin`, `strict-origin-when-cross-origin` hoặc `unsafe-url`. Để biết ý nghĩa của chúng, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#referrerpolicy).

## Ví dụ

```js
const img = new Image();
img.src = "img/logo.png";
img.referrerPolicy = "origin";

const div = document.getElementById("divAround");
div.appendChild(img); // Fetch the image using the origin as the referrer
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAnchorElement.referrerPolicy")}}
- {{domxref("HTMLAreaElement.referrerPolicy")}}
- {{domxref("HTMLIFrameElement.referrerPolicy")}}
