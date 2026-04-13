---
title: "HTMLLinkElement: thuộc tính as"
short-title: as
slug: Web/API/HTMLLinkElement/as
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.as
---

{{APIRef("HTML DOM")}}

Thuộc tính **`as`** của giao diện {{domxref("HTMLLinkElement")}} trả về một chuỗi đại diện cho loại nội dung cần được preload bởi phần tử liên kết.

Thuộc tính `as` phải có giá trị cho các phần tử liên kết khi [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload), nếu không tài nguyên sẽ không được tải.
Nó cũng có thể được áp dụng cho các phần tử liên kết khi [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload), nhưng nếu bỏ qua, sẽ mặc định là `script`.
Thuộc tính này không nên được đặt cho các loại phần tử liên kết khác, chẳng hạn như `rel="prefetch"`.

Thuộc tính này phản ánh giá trị của [thuộc tính `as`](/en-US/docs/Web/HTML/Reference/Elements/link#as) của phần tử HTML [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link).

## Giá trị

Một chuỗi với các giá trị được phép sau: `"audio"`, `"document"`, `"embed"`, `"fetch"`, `"font"`, `"image"`, `"object"`, `"script"`, `"style"`, `"track"`, `"video"`, `"worker"`.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
