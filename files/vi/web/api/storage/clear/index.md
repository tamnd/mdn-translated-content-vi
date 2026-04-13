---
title: "Storage: phương thức clear()"
short-title: clear()
slug: Web/API/Storage/clear
page-type: web-api-instance-method
browser-compat: api.Storage.clear
---

{{APIRef("Web Storage API")}}

Phương thức **`clear()`** của giao diện {{domxref("Storage")}} xóa tất cả các khóa được lưu trong một đối tượng `Storage` nhất định.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Hàm sau tạo ba mục dữ liệu trong local storage, rồi xóa chúng bằng `clear()`.

```js
function populateStorage() {
  localStorage.setItem("bgcolor", "red");
  localStorage.setItem("font", "Helvetica");
  localStorage.setItem("image", "miGato.png");

  localStorage.clear();
}
```

> [!NOTE]
> Để xem ví dụ thực tế, hãy xem [Web Storage Demo](https://mdn.github.io/dom-examples/web-storage/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
