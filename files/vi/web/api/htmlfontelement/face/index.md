---
title: "HTMLFontElement: thuộc tính face"
short-title: face
slug: Web/API/HTMLFontElement/face
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLFontElement.face
---

{{deprecated_header}}{{ APIRef("HTML DOM") }}

Thuộc tính đã lỗi thời **`HTMLFontElement.face`** là một chuỗi phản ánh thuộc tính HTML [`face`](/en-US/docs/Web/HTML/Reference/Elements/font#face), chứa danh sách được phân tách bằng dấu phẩy gồm một hoặc nhiều tên font chữ.

Văn bản tài liệu, theo kiểu mặc định, được hiển thị bằng font chữ đầu tiên mà trình duyệt của người dùng hỗ trợ. Nếu không có font nào trong danh sách được cài đặt trên hệ thống cục bộ, trình duyệt thường mặc định dùng font proportional hoặc fixed-width của hệ thống đó.

Định dạng của chuỗi phải tuân theo một trong các microsyntax HTML sau:

| Microsyntax                                  | Mô tả                                                         | Ví dụ             |
| -------------------------------------------- | ------------------------------------------------------------- | ----------------- |
| Danh sách một hoặc nhiều tên font chữ hợp lệ | _Danh sách các tên font chữ phải có mặt trên hệ thống cục bộ_ | `courier,verdana` |

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử có phần tử <font id="f"> trong HTML

const f = document.getElementById("f");
f.face = "arial";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLFontElement")}} mà thuộc tính này thuộc về.
