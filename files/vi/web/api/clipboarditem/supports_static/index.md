---
title: "ClipboardItem: phương thức tĩnh supports()"
short-title: supports()
slug: Web/API/ClipboardItem/supports_static
page-type: web-api-static-method
browser-compat: api.ClipboardItem.supports_static
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức tĩnh **`supports()`** của giao diện {{domxref("ClipboardItem")}} trả về `true` nếu {{Glossary("MIME type")}} đã cho được clipboard hỗ trợ, và `false` nếu không.

Lưu ý rằng [Clipboard API](/en-US/docs/Web/API/Clipboard_API) bắt buộc phải hỗ trợ văn bản thuần, HTML và tệp PNG.
Phương thức `supports()` sẽ luôn trả về `true` cho các kiểu MIME này, nên không cần kiểm tra chúng.

## Cú pháp

```js-nolint
supports(type)
```

### Tham số

- `type`
  - : Một chuỗi cho biết {{Glossary("MIME type")}} cần kiểm tra.

    Các kiểu MIME này luôn được hỗ trợ:
    - `text/plain`
    - `text/html`
    - `image/png`

    Các kiểu MIME này có thể được hỗ trợ:
    - `image/svg+xml`
    - Các định dạng MIME type tùy chỉnh bắt đầu bằng `"web "`.
      Kiểu tùy chỉnh đó (không có tiền tố `"web "`) phải có định dạng đúng của một MIME type.

### Giá trị trả về

`true` nếu {{Glossary("MIME type")}} đã cho được clipboard hỗ trợ, ngược lại là `false`.

## Ví dụ

### Ghi một ảnh vào clipboard

Ví dụ sau lấy một ảnh SVG, biểu diễn nó dưới dạng {{domxref("Blob")}}, rồi ghi nó vào clipboard.

Chúng ta dùng `supports()` để kiểm tra xem kiểu MIME `"image/svg+xml"` có được clipboard hỗ trợ hay không trước khi lấy ảnh và ghi nó bằng {{domxref("clipboard.write()")}}.
Chúng ta cũng bao toàn bộ thân hàm trong câu lệnh [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để bắt các lỗi khác, chẳng hạn như chính `ClipboardItem` không được hỗ trợ.

```js
async function writeClipImg() {
  try {
    if (ClipboardItem.supports("image/svg+xml")) {
      const imgURL = "/my-image.svg";
      const data = await fetch(imgURL);
      const blob = await data.blob();
      await navigator.clipboard.write([
        new ClipboardItem({
          [blob.type]: blob,
        }),
      ]);
      console.log("Fetched image copied to clipboard.");
    } else {
      console.log("SVG image not supported by clipboard");
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
