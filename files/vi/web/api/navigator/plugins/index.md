---
title: "Navigator: thuộc tính plugins"
short-title: plugins
slug: Web/API/Navigator/plugins
page-type: web-api-instance-property
browser-compat: api.Navigator.plugins
---

{{APIRef("HTML DOM")}}

Trả về đối tượng {{DOMxRef("PluginArray")}}, liệt kê các đối tượng {{DOMxRef("Plugin")}} mô tả các plugin được cài đặt trong ứng dụng.
Các thuộc tính được đặt tên của đối tượng được trả về không thể đếm được (ngoại trừ trong các phiên bản trình duyệt rất cũ).

Các phiên bản gần đây của thông số kỹ thuật mã hóa cứng danh sách trả về.
Nếu hỗ trợ xem nội tuyến các tệp PDF, thuộc tính sẽ liệt kê năm plugin tiêu chuẩn.
Nếu việc xem PDF nội tuyến không được hỗ trợ thì một danh sách trống sẽ được trả về.

> [!LƯU Ý]
> Sử dụng {{domxref("Navigator.pdfViewerEnabled")}} để xác định xem có hỗ trợ xem nội tuyến tệp PDF hay không. Đừng suy luận nó từ tài sản này.
>
> "Năm plugin tiêu chuẩn" là những plugin mà các nhà phát triển thường sử dụng nhất để phát hiện tính năng xem PDF nội tuyến.
> Việc trả lại những thông tin này đảm bảo rằng mã kế thừa có thể xác định một cách đáng tin cậy hơn liệu chế độ xem nội tuyến có được hỗ trợ hay không.
> Tuy nhiên, cách tiếp cận này không được khuyến nghị cho mã mới vì thuộc tính này cuối cùng có thể bị xóa.

Các phiên bản trình duyệt cũ cũng liệt kê các plugin cho tiện ích mở rộng trình xem Adobe Flash và PDF.

## Giá trị

`plugins` là đối tượng {{DOMxRef("PluginArray")}} được sử dụng để truy cập đối tượng {{DOMxRef("Plugin")}} theo tên hoặc dưới dạng danh sách các mục.

Giá trị được trả về không phải là một mảng JavaScript nhưng có thuộc tính `length` và hỗ trợ truy cập các mục riêng lẻ bằng ký hiệu ngoặc (`plugins[2]`), cũng như thông qua các phương thức `item(index)` và `namedItem("name")`.

Nếu tính năng xem nội tuyến PDF được hỗ trợ, phần này sẽ chứa các mục dành cho các plugin sau:

- "Trình xem PDF"
- "Trình xem PDF của Chrome"
- "Trình xem PDF Chrome"
- "Trình xem PDF của Microsoft Edge"
- "PDF tích hợp WebKit"

Nếu việc xem nội tuyến các tệp PDF không được hỗ trợ thì một đối tượng trống sẽ được trả về.

## Ví dụ

Mã này cho biết cách kiểm tra xem tệp PDF có thể được hiển thị nội tuyến hay không:

```js
if ("PDF Viewer" in navigator.plugins) {
  // browser supports inline viewing of PDF files.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
