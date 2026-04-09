---
title: "ClipboardItem: hàm tạo ClipboardItem()"
short-title: ClipboardItem()
slug: Web/API/ClipboardItem/ClipboardItem
page-type: web-api-constructor
browser-compat: api.ClipboardItem.ClipboardItem
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Hàm tạo **`ClipboardItem()`** tạo một đối tượng {{domxref("ClipboardItem")}} mới, biểu diễn dữ liệu sẽ được lưu trữ hoặc truy xuất tương ứng thông qua các phương thức {{domxref("clipboard.write()")}} và {{domxref("clipboard.read()")}} của [Clipboard API](/en-US/docs/Web/API/Clipboard_API).

> [!NOTE]
> Các phương thức `read()` và `write()` có thể được dùng để làm việc với chuỗi văn bản và các mục dữ liệu tùy ý được biểu diễn bằng các thể hiện {{domxref("Blob")}}. Tuy nhiên, nếu bạn chỉ làm việc với văn bản, sẽ thuận tiện hơn khi dùng các phương thức {{domxref("Clipboard.readText()")}} và {{domxref("Clipboard.writeText()")}}.

> [!NOTE]
> Khả năng hỗ trợ định dạng ảnh khác nhau giữa các trình duyệt. Xem [bảng tương thích trình duyệt](/en-US/docs/Web/API/Clipboard#browser_compatibility) cho giao diện `Clipboard`.

## Cú pháp

```js-nolint
new ClipboardItem(data)
new ClipboardItem(data, options)
```

### Tham số

- `data`
  - : Một {{jsxref("Object")}} với {{Glossary("MIME type")}} làm khóa và dữ liệu làm giá trị.
    Dữ liệu có thể được biểu diễn dưới một trong các dạng sau:
    - một {{domxref("Blob")}}
    - một chuỗi
    - một {{jsxref("Promise")}} được giải quyết thành `Blob` hoặc chuỗi.
- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `presentationStyle` {{optional_inline}}
      - : Một trong ba chuỗi: `unspecified`, `inline` hoặc `attachment`.
        Mặc định là `unspecified`.

        `inline` báo cho ứng dụng nhận nội dung dán rằng `ClipboardItem` nên được chèn nội tuyến tại vị trí dán. `attachment` báo rằng `ClipboardItem` nên được thêm như một tệp đính kèm. `unspecified` không truyền đạt thông tin nào cho ứng dụng nhận nội dung dán.

## Ví dụ

Ví dụ dưới đây yêu cầu một ảnh PNG bằng {{domxref("Window/fetch", "fetch()")}}, sau đó dùng phương thức {{domxref("Response.blob()")}} để tạo một {{domxref("ClipboardItem")}} mới.
Mục này sau đó được ghi vào clipboard bằng phương thức {{domxref("Clipboard.write()")}}.

> [!NOTE]
> Bạn chỉ có thể truyền vào một mục clipboard tại một thời điểm.

```js
async function writeClipImg() {
  try {
    if (ClipboardItem.supports("image/png")) {
      const imgURL = "/my-image.png";
      const data = await fetch(imgURL);
      const blob = await data.blob();
      await navigator.clipboard.write([
        new ClipboardItem({
          [blob.type]: blob,
        }),
      ]);
      console.log("Fetched image copied.");
    } else {
      console.log("image png is not supported");
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
