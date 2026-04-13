---
title: "SVGStyleElement: thuộc tính type"
short-title: type
slug: Web/API/SVGStyleElement/type
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.SVGStyleElement.type
---

{{APIRef("SVG")}} {{Deprecated_Header}}

Thuộc tính **`SVGStyleElement.type`** trả về loại của style hiện tại.
Giá trị phản ánh thuộc tính [`type`](/en-US/docs/Web/SVG/Reference/Element/style#type) của phần tử SVG `<style>` liên kết.

Các tác giả không nên sử dụng thuộc tính này hoặc dựa vào giá trị.

## Giá trị

Các giá trị được phép là một chuỗi rỗng hoặc một kết quả khớp không phân biệt chữ hoa chữ thường cho "text/css".

## Ngoại lệ

SVG 1.1 định nghĩa rằng một {{domxref("DOMException")}} được ném ra với mã `NO_MODIFICATION_ALLOWED_ERR` khi cố gắng thay đổi giá trị của thuộc tính chỉ đọc.
Hạn chế này đã được loại bỏ trong SVG 2.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLStyleElement.type")}}
