---
title: "Clipboard: phương thức readText()"
short-title: readText()
slug: Web/API/Clipboard/readText
page-type: web-api-instance-method
browser-compat: api.Clipboard.readText
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`readText()`** của giao diện {{domxref("Clipboard")}} trả về một {{jsxref("Promise")}} phân giải với bản sao nội dung văn bản của clipboard hệ thống.

> [!NOTE]
> Để đọc nội dung không phải văn bản từ clipboard, hãy sử dụng phương thức {{domxref("Clipboard.read", "read()")}} thay thế.
> Bạn có thể ghi văn bản vào clipboard bằng {{domxref("Clipboard.writeText", "writeText()")}}.

## Cú pháp

```js-nolint
readText()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với chuỗi chứa nội dung văn bản của clipboard.

Trả về chuỗi rỗng nếu clipboard trống, không chứa văn bản, hoặc không bao gồm biểu diễn văn bản trong số các đối tượng đại diện cho nội dung của clipboard.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu việc truy cập để đọc clipboard không được cho phép.
- `NotFoundError` {{domxref("DOMException")}}
  - : Ném ra khi clipboard cho biết nó chứa dữ liệu có thể được biểu diễn dưới dạng văn bản nhưng không thể cung cấp biểu diễn văn bản.

## Consideration về bảo mật

Việc đọc từ clipboard chỉ có thể được thực hiện trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được đề cập trong phần [Consideration về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của chủ đề tổng quan API.

## Ví dụ

Ví dụ này truy xuất nội dung văn bản của clipboard và chèn văn bản trả về vào nội dung của phần tử đã chọn.

```js
const destination = document.getElementById("outbox");
destinationImage.addEventListener("click", () => {
  navigator.clipboard
    .readText()
    .then((clipText) => (destination.innerText = clipText));
});
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ hình ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.write()")}}
