---
title: "Storage: phương thức setItem()"
short-title: setItem()
slug: Web/API/Storage/setItem
page-type: web-api-instance-method
browser-compat: api.Storage.setItem
---

{{APIRef("Web Storage API")}}

Phương thức **`setItem()`** của giao diện {{domxref("Storage")}}, khi được truyền vào tên khóa và giá trị, sẽ thêm khóa đó vào đối tượng `Storage` đã cho, hoặc cập nhật giá trị của khóa nếu nó đã tồn tại.

## Cú pháp

```js-nolint
setItem(keyName, keyValue)
```

### Tham số

- `keyName`
  - : Một chuỗi chứa tên của khóa mà bạn muốn tạo hoặc cập nhật.
- `keyValue`
  - : Một chuỗi chứa giá trị mà bạn muốn gán cho khóa đang được tạo hoặc cập nhật.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu bộ lưu trữ hết hạn mức đĩa hoặc người dùng từ chối cấp thêm dung lượng.

## Ví dụ

Hàm sau tạo ba mục dữ liệu trong local storage.

```js
function populateStorage() {
  localStorage.setItem("bgcolor", "red");
  localStorage.setItem("font", "Helvetica");
  localStorage.setItem("image", "myCat.png");
}
```

> [!NOTE]
> Để xem ví dụ thực tế, hãy xem [Web Storage Demo](https://mdn.github.io/dom-examples/web-storage/).

`Storage` chỉ hỗ trợ lưu trữ và truy xuất chuỗi. Nếu bạn muốn lưu các kiểu dữ liệu khác, bạn phải chuyển chúng thành chuỗi. Với đối tượng thuần và mảng, bạn có thể dùng {{jsxref("JSON.stringify()")}}.

```js
const person = { name: "Alex" };
localStorage.setItem("user", person);
console.log(localStorage.getItem("user")); // "[object Object]"; không hữu ích!
localStorage.setItem("user", JSON.stringify(person));
console.log(JSON.parse(localStorage.getItem("user"))); // { name: "Alex" }
```

Tuy nhiên, không có cách chung nào để lưu các kiểu dữ liệu tùy ý. Hơn nữa, đối tượng được truy xuất là một [bản sao sâu](/en-US/docs/Glossary/Deep_copy) của đối tượng gốc và các thay đổi trên nó không ảnh hưởng đến đối tượng gốc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Storage.getItem()](/en-US/docs/Web/API/Storage/getItem)
- [Storage.removeItem()](/en-US/docs/Web/API/Storage/removeItem)
- [Sử dụng Web Storage API](/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
