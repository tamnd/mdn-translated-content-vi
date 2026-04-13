---
title: "HTMLInputElement: thuộc tính accept"
short-title: accept
slug: Web/API/HTMLInputElement/accept
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.accept
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`accept`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Elements/input#accept) của phần tử {{HTMLElement("input")}}, thường là danh sách các bộ định danh loại tệp duy nhất được phân tách bằng dấu phẩy, cung cấp gợi ý về loại tệp dự kiến cho [`<input>` loại `file`](/en-US/docs/Web/HTML/Reference/Elements/input/file). Nếu thuộc tính không được đặt rõ ràng, thuộc tính `accept` là một chuỗi rỗng.

## Giá trị

Một chuỗi đại diện cho giá trị `accept` của phần tử hoặc chuỗi rỗng nếu không có `accept` nào được đặt rõ ràng.

## Ví dụ

```js
const inputElement = document.querySelector("#time");
console.log(inputElement.accept); // giá trị hiện tại của thuộc tính accept
inputElement.accept = ".doc,.docx,.xml,application/msword"; // thiết lập giá trị accept
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.type")}}
- {{domxref("HTMLInputElement.multiple")}}
- {{domxref("HTMLInputElement.capture")}}
- [Bộ định danh loại tệp](/en-US/docs/Web/HTML/Reference/Elements/input/file#unique_file_type_specifiers)
- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [File API](/en-US/docs/Web/API/File_API)
