---
title: "HTMLInputElement: thuộc tính multiple"
short-title: multiple
slug: Web/API/HTMLInputElement/multiple
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.multiple
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`HTMLInputElement.multiple`** cho biết liệu một đầu vào có thể có nhiều hơn một giá trị hay không. Firefox hiện chỉ hỗ trợ `multiple` cho `<input type="file">`.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<input id="my-file-input" type="file" multiple />
```

```js
let fileInput = document.getElementById("my-file-input");

if (fileInput.multiple) {
  // Lặp qua fileInput.files
  for (const file of fileInput.files) {
    // Thực hiện hành động trên một tệp
  }
  // Chỉ có một tệp khả dụng
} else {
  let [file] = fileInput.files;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [FileList](/en-US/docs/Web/API/FileList)
- [Bug 523771](https://bugzil.la/523771) - Hỗ trợ \<input type=file multiple>
