---
title: "Storage: phương thức getItem()"
short-title: getItem()
slug: Web/API/Storage/getItem
page-type: web-api-instance-method
browser-compat: api.Storage.getItem
---

{{APIRef("Web Storage API")}}

Phương thức **`getItem()`** của giao diện {{domxref("Storage")}}, khi được truyền vào tên khóa, sẽ trả về giá trị của khóa đó, hoặc `null` nếu khóa không tồn tại, trong đối tượng `Storage` đã cho.

## Cú pháp

```js-nolint
getItem(keyName)
```

### Tham số

- `keyName`
  - : Một chuỗi chứa tên của khóa mà bạn muốn truy xuất giá trị.

### Giá trị trả về

Một chuỗi chứa giá trị của khóa. Nếu khóa không tồn tại, phương thức sẽ trả về `null`.

## Ví dụ

Hàm sau lấy ba mục dữ liệu từ local storage, rồi dùng chúng để đặt kiểu tùy chỉnh cho trang.

```js
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
> Để xem cách dùng trong ví dụ thực tế, hãy xem [Web Storage Demo](https://mdn.github.io/dom-examples/web-storage/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Storage.setItem()](/en-US/docs/Web/API/Storage/setItem)
- [Sử dụng Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
