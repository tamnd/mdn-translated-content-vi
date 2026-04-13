---
title: HTMLMetaElement
slug: Web/API/HTMLMetaElement
page-type: web-api-interface
browser-compat: api.HTMLMetaElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLMetaElement`** chứa siêu dữ liệu mô tả về một tài liệu được cung cấp trong HTML dưới dạng các phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta).
Giao diện này kế thừa tất cả các thuộc tính và phương thức được mô tả trong giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{HTMLElement("meta#charset")}}
  - : Mã hóa ký tự cho một tài liệu HTML.
- {{domxref("HTMLMetaElement.content")}}
  - : Phần 'giá trị' của các cặp tên-giá trị của siêu dữ liệu tài liệu.
- {{domxref("HTMLMetaElement.httpEquiv")}}
  - : Tên của pragma directive, tiêu đề phản hồi HTTP, cho một tài liệu.
- {{domxref("HTMLMetaElement.media")}}
  - : Ngữ cảnh media cho thuộc tính siêu dữ liệu `theme-color`.
- {{domxref("HTMLMetaElement.name")}}
  - : Phần 'tên' của các cặp tên-giá trị định nghĩa siêu dữ liệu được đặt tên của một tài liệu.
- {{domxref("HTMLMetaElement.scheme")}} {{deprecated_inline}}
  - : Định nghĩa lược đồ của giá trị trong thuộc tính {{domxref("HTMLMetaElement.content")}}.
    Đây đã lỗi thời và không nên sử dụng trên các trang web mới.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Ví dụ

Hai ví dụ sau đây thể hiện cách tiếp cận chung khi sử dụng giao diện `HTMLMetaElement`.
Các ví dụ cụ thể, xem các trang cho từng thuộc tính được mô tả trong phần [Thuộc tính phiên bản](#thuộc_tính_phiên_bản) ở trên.

### Đặt siêu dữ liệu mô tả trang

Ví dụ sau tạo một phần tử `<meta>` mới với thuộc tính `name` được đặt thành [`description`](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification).
Thuộc tính `content` đặt mô tả của tài liệu và được thêm vào `<head>` của tài liệu:

```js
const meta = document.createElement("meta");
meta.name = "description";
meta.content =
  "The <meta> element can be used to provide document metadata in terms of name-value pairs, with the name attribute giving the metadata name, and the content attribute giving the value.";
document.head.appendChild(meta);
```

### Đặt siêu dữ liệu viewport

Ví dụ sau đây cho thấy cách tạo một phần tử `<meta>` mới với thuộc tính `name` được đặt thành [`viewport`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport).
Thuộc tính `content` đặt kích thước viewport và được thêm vào `<head>` của tài liệu:

```js
const meta = document.createElement("meta");
meta.name = "viewport";
meta.content = "width=device-width, initial-scale=1";
document.head.appendChild(meta);
```

Để biết thêm thông tin về cách đặt viewport, xem [`<meta name="viewport">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("meta")}}
