---
title: "SVGImageElement: crossOrigin property"
short-title: crossOrigin
slug: Web/API/SVGImageElement/crossOrigin
page-type: web-api-instance-property
browser-compat: api.SVGImageElement.crossOrigin
---

{{APIRef("SVG")}}

Thuộc tính **`crossOrigin`** của giao diện {{domxref("SVGImageElement")}} là một chuỗi chỉ định cài đặt Chia sẻ tài nguyên có nguồn gốc chéo ({{Glossary("CORS")}}) để sử dụng khi truy xuất hình ảnh. Nó phản ánh thuộc tính nội dung {{SVGAttr("crossorigin")}} của phần tử {{SVGElement("image")}} đã cho.

## Giá trị

Một chuỗi chỉ định chế độ CORS được sử dụng khi tải tài nguyên hình ảnh. Các giá trị hợp lệ là `"anonymous"` hoặc `"use-credentials"`. Nếu thuộc tính `crossOrigin` được đặt thành bất kỳ giá trị nào khác, nó sẽ giống như việc chỉ định `"anonymous"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.crossOrigin")}}
- {{domxref("HTMLMediaElement.crossOrigin")}}
