---
title: "FormData: phương thức set()"
short-title: set()
slug: Web/API/FormData/set
page-type: web-api-instance-method
browser-compat: api.FormData.set
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`set()`** của giao diện {{domxref("FormData")}} đặt một giá trị mới cho một khóa hiện có bên trong đối tượng `FormData`, hoặc thêm cặp khóa/giá trị nếu nó chưa tồn tại.

Sự khác biệt giữa `set()` và {{domxref("FormData.append", "append()")}} là nếu khóa được chỉ định đã tồn tại, `set()` sẽ ghi đè tất cả các giá trị hiện có bằng giá trị mới, trong khi `append()` sẽ thêm giá trị mới vào cuối tập giá trị hiện có.

## Cú pháp

```js-nolint
set(name, value)
set(name, value, filename)
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
formData.set("username", "Chris");
```

Khi giá trị là một {{domxref("Blob")}} (hoặc {{domxref("File")}}), bạn có thể chỉ định tên của nó bằng tham số `filename`:

```js
formData.set("user-pic", myFileInput.files[0], "chris.jpg");
```

Nếu giá trị không phải là chuỗi hoặc `Blob`, `set()` sẽ tự động chuyển nó thành chuỗi:

```js
formData.set("name", 72);
formData.get("name"); // "72"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
