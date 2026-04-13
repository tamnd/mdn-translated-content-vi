---
title: "HTMLSourceElement: thuộc tính srcset"
short-title: srcset
slug: Web/API/HTMLSourceElement/srcset
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.srcset
---

{{APIRef("HTML DOM")}}

Thuộc tính **`srcset`** của giao diện {{domxref("HTMLSourceElement")}} là một chuỗi chứa danh sách các hình ảnh ứng cử viên được phân tách bằng dấu phẩy.

Mỗi hình ảnh ứng cử viên bao gồm URL của tài nguyên hình ảnh dùng làm nguồn cho phần tử và tùy chọn một mô tả chỉ định hoàn cảnh sử dụng hình ảnh đó. Mô tả là một số theo sau bởi `'w'` cho biết chiều rộng của phần tử, hoặc một số theo sau bởi `'x'` cho biết mật độ pixel của thiết bị.

Nó phản ánh thuộc tính `srcset` của phần tử {{HTMLElement("source")}} được lồng trong phần tử {{htmlelement("picture")}}. Nó không có ý nghĩa và bị bỏ qua khi được lồng trong phần tử {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, vốn sử dụng thuộc tính {{domxref("HTMLSourceElement.src", "src")}} thay thế.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<picture>
  <source
    id="el"
    srcset="smile.png, smile-1.5x.png 1.5x, smile-2x.png 2x"
    type="image/png" />
</picture>
```

```js
const el = document.getElementById("el");
console.log(el.srcset); // Output: "smile.png, smile-1.5x.png 1.5x, smile-large 800w"
el.srcset = "smile.png, smile-med.png 600w, smile-large.png 800w"; // Updates the srcset value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSourceElement.type")}}
- {{domxref("HTMLSourceElement.src")}}
- {{domxref("HTMLSourceElement.media")}}
- {{domxref("HTMLSourceElement.sizes")}}
- {{htmlelement("source")}}
- {{htmlelement("picture")}}
