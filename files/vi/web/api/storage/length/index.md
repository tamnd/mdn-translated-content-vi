---
title: "Storage: thuộc tính length"
short-title: length
slug: Web/API/Storage/length
page-type: web-api-instance-property
browser-compat: api.Storage.length
---

{{APIRef("Web Storage API")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("Storage")}} trả về số lượng mục dữ liệu được lưu trong một đối tượng `Storage` nhất định.

## Giá trị

Số lượng mục được lưu trong đối tượng `Storage`.

## Ví dụ

Hàm sau thêm ba mục dữ liệu vào local storage của miền hiện tại, rồi trả về số lượng mục trong bộ lưu trữ:

```js
function populateStorage() {
  localStorage.setItem("bgcolor", "yellow");
  localStorage.setItem("font", "Helvetica");
  localStorage.setItem("image", "cats.png");

  return localStorage.length; // Nên trả về 3
}
```

> [!NOTE]
> Để xem ví dụ thực tế, hãy xem [Web Storage Demo](https://mdn.github.io/dom-examples/web-storage/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
