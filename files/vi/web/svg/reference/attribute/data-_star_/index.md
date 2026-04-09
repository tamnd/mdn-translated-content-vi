---
title: data-*
slug: Web/SVG/Reference/Attribute/data-*
page-type: svg-attribute
browser-compat: svg.global_attributes.data
sidebar: svgref
---

Các thuộc tính SVG **`data-*`** được gọi là thuộc tính dữ liệu tùy chỉnh. Chúng cho phép markup SVG và DOM kết quả của nó chia sẻ thông tin mà các thuộc tính chuẩn không thể, thường là cho mục đích scripting. Dữ liệu tùy chỉnh của chúng có thể truy cập thông qua giao diện {{domxref("SVGElement")}} của phần tử mà các thuộc tính đó thuộc về, với thuộc tính {{domxref("SVGElement.dataset")}}.

Ký tự `*` có thể được thay thế bằng bất kỳ ký tự nào được phép trong [quy tắc đặt tên của XML](https://www.w3.org/TR/xml/#NT-Name), với các hạn chế sau:

- Không được bắt đầu bằng `xml`.
- Không có dấu chấm phẩy (`;`, `U+003A`).
- Không có chữ cái viết hoa từ `A` đến `Z`.

> [!NOTE]
> Thuộc tính {{domxref("SVGElement.dataset")}} là một {{domxref("DOMStringMap")}} cung cấp thuộc tính `data-test-value` thông qua `SVGElement.dataset.testValue`. Các ký tự gạch nối (`-`, `U+002D`) bị xóa và chữ cái kế tiếp được viết hoa, tạo ra định dạng {{Glossary("camel_case", "camel case")}}.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement")}}
- Thuộc tính {{domxref("SVGElement.dataset")}} được dùng để truy cập các thuộc tính này từ script.
- [Sử dụng data attributes](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
