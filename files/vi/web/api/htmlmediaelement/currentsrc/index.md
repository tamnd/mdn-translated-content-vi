---
title: "HTMLMediaElement: thuộc tính currentSrc"
short-title: currentSrc
slug: Web/API/HTMLMediaElement/currentSrc
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.currentSrc
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.currentSrc`** chứa
URL tuyệt đối của tài nguyên phương tiện đã chọn. Điều này có thể xảy ra, ví dụ, nếu trang web
máy chủ chọn tệp phương tiện dựa trên độ phân giải màn hình của người dùng. giá trị
là một chuỗi trống nếu thuộc tính `networkState` là `EMPTY`.

## Giá trị

Một chuỗi chứa URL tuyệt đối của phương tiện đã chọn
nguồn; đây có thể là một chuỗi trống nếu `networkState` là `EMPTY`;
nếu không, nó sẽ là một trong những tài nguyên được liệt kê bởi
{{domxref("HTMLSourceElement")}} contained within the media element, or the value of {{domxref("HTMLMediaElement.src", "src")}}
nếu không có phần tử {{HTMLElement("source")}} nào được cung cấp.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.currentSrc); // ""
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.currentSrc`
