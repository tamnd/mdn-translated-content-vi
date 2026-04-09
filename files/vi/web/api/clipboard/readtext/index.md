---
title: "Clipboard: phương thức readText()"
short-title: readText()
slug: Web/API/Clipboard/readText
page-type: web-api-instance-method
browser-compat: api.Clipboard.readText
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`readText()`** của giao diện {{domxref("Clipboard")}} trả về một {{jsxref("Promise")}} được hoàn thành với một bản sao của nội dung văn bản trong bảng nhớ tạm hệ thống.

> [!NOTE]
> Để đọc nội dung không phải văn bản từ bảng nhớ tạm, hãy dùng phương thức {{domxref("Clipboard.read", "read()")}}.
> Bạn có thể ghi văn bản vào bảng nhớ tạm bằng {{domxref("Clipboard.writeText", "writeText()")}}.

## Cú pháp

```js-nolint
readText()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một chuỗi chứa nội dung văn bản của bảng nhớ tạm.

Trả về chuỗi rỗng nếu bảng nhớ tạm đang trống, không chứa văn bản hoặc không bao gồm biểu diễn văn bản trong số các đối tượng đại diện cho nội dung của bảng nhớ tạm.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu không được phép truy cập để đọc bảng nhớ tạm.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu bảng nhớ tạm cho biết nó chứa dữ liệu có thể biểu diễn dưới dạng văn bản nhưng lại không thể cung cấp biểu diễn văn bản.

## Lưu ý về bảo mật

Việc đọc từ bảng nhớ tạm chỉ có thể được thực hiện trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được trình bày trong phần [Lưu ý về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của trang tổng quan API.

## Ví dụ

Ví dụ này truy xuất nội dung văn bản của bảng nhớ tạm và chèn văn bản được trả về vào nội dung của phần tử đã chọn.

```js
const destination = document.getElementById("outbox");
destinationImage.addEventListener("click", () => {
  navigator.clipboard
    .readText()
    .then((clipText) => (destination.innerText = clipText));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Image support for Async Clipboard article](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.write()")}}
