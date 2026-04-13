---
title: "Storage: phương thức key()"
short-title: key()
slug: Web/API/Storage/key
page-type: web-api-instance-method
browser-compat: api.Storage.key
---

{{APIRef("Web Storage API")}}

Phương thức **`key()`** của giao diện {{domxref("Storage")}}, khi được truyền vào một số `n`, sẽ trả về tên của khóa thứ `n` trong một đối tượng `Storage` nhất định. Thứ tự của các khóa do user-agent định nghĩa, vì vậy bạn không nên dựa vào nó.

## Cú pháp

```js-nolint
key(index)
```

### Tham số

- `index`
  - : Một số nguyên biểu thị số thứ tự của khóa mà bạn muốn lấy tên. Đây là chỉ số bắt đầu từ 0.

### Giá trị trả về

Một chuỗi chứa tên của khóa. Nếu chỉ số không tồn tại, phương thức sẽ trả về `null`.

## Ví dụ

Hàm sau lặp qua các khóa trong local storage:

```js
function forEachKey(callback) {
  for (let i = 0; i < localStorage.length; i++) {
    callback(localStorage.key(i));
  }
}
```

Hàm sau lặp qua các khóa trong local storage và lấy giá trị đã đặt cho từng khóa:

```js
for (let i = 0; i < localStorage.length; i++) {
  console.log(localStorage.getItem(localStorage.key(i)));
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
