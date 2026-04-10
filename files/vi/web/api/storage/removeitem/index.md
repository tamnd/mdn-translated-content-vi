---
title: "Storage: phương thức removeItem()"
short-title: removeItem()
slug: Web/API/Storage/removeItem
page-type: web-api-instance-method
browser-compat: api.Storage.removeItem
---

{{APIRef("Web Storage API")}}

Phương thức **`removeItem()`** của giao diện {{domxref("Storage")}}, khi được truyền vào tên khóa, sẽ xóa khóa đó khỏi đối tượng `Storage` đã cho nếu nó tồn tại.

Giao diện **`Storage`** của [Web Storage API](/en-US/docs/Web/API/Web_Storage_API) cung cấp quyền truy cập vào session storage hoặc local storage của một miền cụ thể.

Nếu không có mục nào gắn với khóa đã cho, phương thức này sẽ không làm gì cả.

## Cú pháp

```js-nolint
removeItem(keyName)
```

### Tham số

- `keyName`
  - : Một chuỗi chứa tên của khóa mà bạn muốn xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Hàm sau tạo ba mục dữ liệu trong local storage, rồi xóa mục dữ liệu `image`.

```js
function populateStorage() {
  localStorage.setItem("bgcolor", "red");
  localStorage.setItem("font", "Helvetica");
  localStorage.setItem("image", "myCat.png");

  localStorage.removeItem("image");
}
```

Ta có thể làm tương tự với session storage.

```js
function populateStorage() {
  sessionStorage.setItem("bgcolor", "red");
  sessionStorage.setItem("font", "Helvetica");
  sessionStorage.setItem("image", "myCat.png");

  sessionStorage.removeItem("image");
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
