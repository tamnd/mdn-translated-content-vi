---
title: "Clipboard: phương thức writeText()"
short-title: writeText()
slug: Web/API/Clipboard/writeText
page-type: web-api-instance-method
browser-compat: api.Clipboard.writeText
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`writeText()`** của giao diện {{domxref("Clipboard")}} ghi văn bản đã chỉ định vào clipboard hệ thống, trả về một {{jsxref("Promise")}} được phân giải khi clipboard hệ thống được cập nhật.

## Cú pháp

```js-nolint
writeText(newClipText)
```

### Tham số

- `newClipText`
  - : Chuỗi sẽ được ghi vào clipboard.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải khi nội dung của clipboard đã được cập nhật.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu việc ghi vào clipboard không được cho phép.

## Consideration về bảo mật

Việc ghi vào clipboard chỉ có thể được thực hiện trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được đề cập trong phần [Consideration về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của chủ đề tổng quan API.

## Ví dụ

Ví dụ này đặt nội dung của clipboard thành chuỗi "\<empty clipboard>".

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

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ hình ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.write()")}}
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.readText()")}}
