---
title: Storage
slug: Web/API/Storage
page-type: web-api-interface
browser-compat: api.Storage
---

{{APIRef("Web Storage API")}}

Giao diện **`Storage`** của [Web Storage API](/en-US/docs/Web/API/Web_Storage_API) cung cấp quyền truy cập vào session storage hoặc local storage của một miền cụ thể. Ví dụ, nó cho phép thêm, sửa đổi hoặc xóa các mục dữ liệu đã lưu.

Để thao tác session storage của một miền, bạn gọi {{domxref("Window.sessionStorage")}}; còn với local storage thì bạn gọi {{domxref("Window.localStorage")}}.

## Thuộc tính thể hiện

- {{domxref("Storage.length")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên biểu thị số mục dữ liệu được lưu trong đối tượng `Storage`.

## Phương thức thể hiện

- {{domxref("Storage.key()")}}
  - : Khi được truyền vào một số `n`, phương thức này sẽ trả về tên của khóa thứ `n` trong bộ lưu trữ.
- {{domxref("Storage.getItem()")}}
  - : Khi được truyền vào tên khóa, phương thức sẽ trả về giá trị của khóa đó.
- {{domxref("Storage.setItem()")}}
  - : Khi được truyền vào tên khóa và giá trị, phương thức sẽ thêm khóa đó vào bộ lưu trữ, hoặc cập nhật giá trị của khóa nếu nó đã tồn tại.
- {{domxref("Storage.removeItem()")}}
  - : Khi được truyền vào tên khóa, phương thức sẽ xóa khóa đó khỏi bộ lưu trữ.
- {{domxref("Storage.clear()")}}
  - : Khi được gọi, phương thức sẽ xóa sạch mọi khóa trong bộ lưu trữ.

## Ví dụ

Ở đây, chúng ta truy cập một đối tượng `Storage` bằng cách gọi `localStorage`. Trước tiên chúng ta kiểm tra xem local storage có chứa mục dữ liệu nào hay không bằng `!localStorage.getItem('bgcolor')`. Nếu có, chúng ta chạy một hàm tên là `setStyles()` để lấy các mục dữ liệu bằng {{domxref("Storage.getItem()")}} và dùng các giá trị đó để cập nhật kiểu hiển thị của trang. Nếu không có, chúng ta chạy một hàm khác là `populateStorage()`, hàm này dùng {{domxref("Storage.setItem()")}} để đặt giá trị cho các mục, rồi chạy `setStyles()`.

```js
if (!localStorage.getItem("bgcolor")) {
  populateStorage();
} else {
  setStyles();
}

function populateStorage() {
  localStorage.setItem("bgcolor", document.getElementById("bgcolor").value);
  localStorage.setItem("font", document.getElementById("font").value);
  localStorage.setItem("image", document.getElementById("image").value);

  setStyles();
}

function setStyles() {
  const currentColor = localStorage.getItem("bgcolor");
  const currentFont = localStorage.getItem("font");
  const currentImage = localStorage.getItem("image");

  document.getElementById("bgcolor").value = currentColor;
  document.getElementById("font").value = currentFont;
  document.getElementById("image").value = currentImage;

  htmlElem.style.backgroundColor = `#${currentColor}`;
  pElem.style.fontFamily = currentFont;
  imgElem.setAttribute("src", currentImage);
}
```

> [!NOTE]
> Để xem ví dụ này chạy đầy đủ, hãy xem [Web Storage Demo](https://mdn.github.io/dom-examples/web-storage/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
- {{domxref("Window.localStorage")}}
- {{domxref("Window.sessionStorage")}}
- {{domxref("CacheStorage")}}
