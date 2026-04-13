---
title: "Navigator: thuộc tính mimeTypes"
short-title: mimeTypes
slug: Web/API/Navigator/mimeTypes
page-type: web-api-instance-property
browser-compat: api.Navigator.mimeTypes
---

{{ ApiRef("HTML DOM") }}

Trả về một đối tượng {{domxref("MimeTypeArray")}}, chứa danh sách các đối tượng {{domxref("MimeType")}} đại diện cho các loại MIME được trình duyệt nhận dạng và hỗ trợ.
Mảng có thể được truy vấn để biết thông tin về plugin đã bật được sử dụng để xử lý tệp thuộc loại được chỉ định.
Các thuộc tính được đặt tên của đối tượng được trả về không thể đếm được (ngoại trừ trong các phiên bản trình duyệt rất cũ).

Các phiên bản gần đây của thông số kỹ thuật mã hóa cứng tập hợp các loại MIME được trả về.
Nếu tệp PDF có thể được hiển thị nội tuyến thì `application/pdf` và `text/pdf` sẽ được liệt kê.
Nếu không, một danh sách trống sẽ được trả về.

> [!LƯU Ý]
> Sử dụng {{domxref("Navigator.pdfViewerEnabled")}} để xác định xem có hỗ trợ xem nội tuyến tệp PDF hay không. Đừng suy luận nó từ tài sản này.

Các phiên bản trình duyệt cũ không mã hóa cứng danh sách được thuộc tính trả về và có thể trả về các loại MIME khác.

## Giá trị

Đối tượng `MimeTypeArray` có thuộc tính `length` cũng như các phương thức `item(index)` và `namedItem(name)`.

Nếu tính năng xem nội tuyến PDF được hỗ trợ thì tính năng này có các mục dành cho loại MIME `application/pdf` và `text/pdf`.
Nếu không thì `MimeTypeArray` trống sẽ được trả về.
Phần mô tả và hậu tố tệp được hỗ trợ bởi plugin đã bật được mã hóa cứng tương ứng thành `'pdf'` và `'Portable Document Format'`.

## Ví dụ

Mã bên dưới kiểm tra xem tệp PDF có thể được xem nội tuyến hay không, sau đó in mô tả về plugin và hậu tố tệp mà nó hỗ trợ.

```js
if ("application/pdf" in navigator.mimeTypes) {
  // browser supports inline viewing of PDF files.

  const { description, suffixes } = navigator.mimeTypes["application/pdf"];
  console.log(`Description: ${description}, Suffix: ${suffixes}`);
  // expected output: Description: Portable Document Format, Suffix: pdf
}
```

Lưu ý rằng trong khi mã ở trên kiểm tra `application/pdf`, bạn cũng có thể kiểm tra `text/pdf`. (Cả hai hoặc cả hai loại MIME đều không đúng.)
Ngoài ra, trên các trình duyệt hiện tại, bạn thực sự không cần lấy mô tả và hậu tố plugin vì thông tin này cũng được mã hóa cứng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
