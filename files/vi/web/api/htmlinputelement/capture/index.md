---
title: "HTMLInputElement: thuộc tính capture"
short-title: capture
slug: Web/API/HTMLInputElement/capture
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.capture
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`capture`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`capture`](/en-US/docs/Web/HTML/Reference/Attributes/capture) của phần tử {{HTMLElement("input")}}. Chỉ liên quan đến [`<input>` loại `file`](/en-US/docs/Web/HTML/Reference/Elements/input/file), thuộc tính và thuộc tính chỉ định liệu một tệp mới có nên được thu từ camera hướng về người dùng (`user`) hoặc hướng ra ngoài (`environment`) hoặc micro. Loại tệp được định nghĩa bởi thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Attributes/accept). Nếu thuộc tính không được đặt rõ ràng, thuộc tính `capture` là một chuỗi rỗng.

## Giá trị

Một chuỗi; thường là `user` hoặc `environment`, hoặc chuỗi rỗng (`""`).

## Ví dụ

```js
const inputElement = document.querySelector("avatar");
console.log(inputElement.capture); // giá trị hiện tại của thuộc tính capture
inputElement.capture = "user"; // thiết lập giá trị capture
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.type")}}
- {{domxref("HTMLInputElement.multiple")}}
- {{domxref("HTMLInputElement.accept")}}
- {{domxref("HTMLInputElement.files")}}
- [Bộ định danh loại tệp](/en-US/docs/Web/HTML/Reference/Elements/input/file#unique_file_type_specifiers)
- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [File API](/en-US/docs/Web/API/File_API)
