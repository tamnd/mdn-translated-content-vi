---
title: "Clipboard: phương thức writeText()"
short-title: writeText()
slug: Web/API/Clipboard/writeText
page-type: web-api-instance-method
browser-compat: api.Clipboard.writeText
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`writeText()`** của giao diện {{domxref("Clipboard")}} ghi văn bản được chỉ định vào bảng nhớ tạm hệ thống, trả về một {{jsxref("Promise")}} được giải quyết sau khi bảng nhớ tạm hệ thống đã được cập nhật.

## Cú pháp

```js-nolint
writeText(newClipText)
```

### Tham số

- `newClipText`
  - : Chuỗi sẽ được ghi vào bảng nhớ tạm.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết sau khi nội dung bảng nhớ tạm đã được cập nhật.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu không được phép ghi vào bảng nhớ tạm.

## Lưu ý về bảo mật

Việc ghi vào bảng nhớ tạm chỉ có thể được thực hiện trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được trình bày trong phần [Lưu ý về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của trang tổng quan API.

## Ví dụ

Ví dụ này đặt nội dung của bảng nhớ tạm thành chuỗi "\<empty clipboard>".

```js
button.addEventListener("click", () => writeClipboardText("<empty clipboard>"));

async function writeClipboardText(text) {
  try {
    await navigator.clipboard.writeText(text);
  } catch (error) {
    console.error(error.message);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Image support for Async Clipboard article](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.write()")}}
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.readText()")}}
