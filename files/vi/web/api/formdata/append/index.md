---
title: "FormData: phương thức append()"
short-title: append()
slug: Web/API/FormData/append
page-type: web-api-instance-method
browser-compat: api.FormData.append
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`append()`** của giao diện {{domxref("FormData")}} thêm một giá trị mới vào sau một khóa hiện có bên trong đối tượng `FormData`, hoặc thêm khóa đó nếu nó chưa tồn tại.

Sự khác biệt giữa {{domxref("FormData.set", "set()")}} và `append()` là nếu khóa được chỉ định đã tồn tại, `set()` sẽ ghi đè tất cả các giá trị hiện có bằng giá trị mới, còn `append()` sẽ thêm giá trị mới vào cuối tập giá trị hiện có.

## Cú pháp

```js-nolint
append(name, value)
append(name, value, filename)
```

### Tham số

- `name`
  - : Tên của trường có dữ liệu nằm trong `value`.
- `value`
  - : Giá trị của trường. Giá trị này có thể là một chuỗi hoặc {{domxref("Blob")}} (bao gồm các lớp con như {{domxref("File")}}). Nếu không chỉ định các kiểu này, giá trị sẽ được chuyển thành chuỗi.
- `filename` {{optional_inline}}
  - : Tên tệp được báo cáo cho máy chủ (một chuỗi), khi một {{domxref("Blob")}} hoặc {{domxref("File")}} được truyền làm tham số thứ hai. Tên tệp mặc định cho các đối tượng {{domxref("Blob")}} là "blob". Tên tệp mặc định cho các đối tượng {{domxref("File")}} là tên tệp của chính file đó.

> [!NOTE]
> Nếu bạn chỉ định một {{domxref("Blob")}} làm dữ liệu để thêm vào đối tượng `FormData`, tên tệp được báo cáo cho máy chủ trong header "Content-Disposition" sẽ khác nhau giữa các trình duyệt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
formData.append("username", "Chris");
```

Khi giá trị là một {{domxref("Blob")}} (hoặc {{domxref("File")}}), bạn có thể chỉ định tên của nó bằng tham số `filename`:

```js
formData.append("user-pic", myFileInput.files[0], "chris.jpg");
```

Cũng như dữ liệu biểu mẫu thông thường, bạn có thể thêm nhiều giá trị với cùng một tên:

```js
formData.append("user-pic", myFileInput.files[0], "chris1.jpg");
formData.append("user-pic", myFileInput.files[1], "chris2.jpg");
```

Nếu giá trị không phải là chuỗi hoặc `Blob`, `append()` sẽ tự động chuyển nó thành chuỗi:

```js
formData.append("name", true);
formData.append("name", 72);
formData.getAll("name"); // ["true", "72"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
