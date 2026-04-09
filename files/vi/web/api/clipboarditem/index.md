---
title: ClipboardItem
slug: Web/API/ClipboardItem
page-type: web-api-interface
browser-compat: api.ClipboardItem
---

{{APIRef("Clipboard API")}}{{SecureContext_Header}}

Giao diện **`ClipboardItem`** của [Clipboard API](/en-US/docs/Web/API/Clipboard_API) biểu diễn định dạng của một mục đơn lẻ, được dùng tương ứng khi đọc hoặc ghi dữ liệu clipboard bằng {{domxref("Clipboard.read()")}} và {{domxref("Clipboard.write()")}}.

Giao diện **`ClipboardItem`** cho phép nhà phát triển dùng một kiểu duy nhất để biểu diễn nhiều định dạng dữ liệu khác nhau.

> [!NOTE]
> Các phương thức `read()` và `write()` có thể được dùng để làm việc với chuỗi văn bản và các mục dữ liệu tùy ý được biểu diễn bằng các thể hiện {{domxref("Blob")}}. Tuy nhiên, nếu bạn chỉ làm việc với văn bản, sẽ thuận tiện hơn khi dùng các phương thức {{domxref("Clipboard.readText()")}} và {{domxref("Clipboard.writeText()")}}.

## Hàm tạo

- {{domxref("ClipboardItem.ClipboardItem", "ClipboardItem()")}}
  - : Tạo một đối tượng **`ClipboardItem`** mới, với {{Glossary("MIME type")}} làm khóa và dữ liệu làm giá trị.

## Thuộc tính thể hiện

- {{domxref("ClipboardItem.types", "types")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Array")}} các kiểu MIME hiện có trong **`ClipboardItem`**.
- {{domxref("ClipboardItem.presentationStyle", "presentationStyle")}} {{ReadOnlyInline}}
  - : Trả về một trong các giá trị sau: `"unspecified"`, `"inline"` hoặc `"attachment"`.

## Phương thức tĩnh

- {{domxref("ClipboardItem.supports_static", "ClipboardItem.supports()")}}
  - : Kiểm tra xem một {{Glossary("MIME type")}} cho trước có được clipboard hỗ trợ hay không. Điều này cho phép website phát hiện liệu một kiểu MIME có được hỗ trợ trước khi thử ghi dữ liệu hay không.

## Phương thức thể hiện

- {{domxref("ClipboardItem.getType", "getType()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với một {{domxref("Blob")}} của {{Glossary("MIME type")}} được yêu cầu, hoặc lỗi nếu không tìm thấy kiểu MIME đó.

## Ví dụ

### Ghi văn bản vào clipboard

Trong ví dụ này, đầu tiên chúng ta định nghĩa hai hằng chứa tham chiếu đến một phần tử {{htmlelement("p")}} có chứa văn bản và một phần tử {{htmlelement("button")}}.

Tiếp theo, chúng ta định nghĩa một hàm tên là `copyToClipboard()`. Hàm này bắt đầu bằng cách lưu kiểu MIME `"text/plain"` vào một hằng, rồi tạo một đối tượng tên là `clipboardItemData` chứa một thuộc tính có khóa bằng kiểu MIME và giá trị là văn bản mà chúng ta muốn sao chép vào clipboard (trong trường hợp này là nội dung của phần tử `<p>`). Vì chúng ta đang làm việc với văn bản, có thể truyền trực tiếp thay vì phải tạo một {{domxref("Blob")}}.

Chúng ta tạo một đối tượng `ClipboardItem` mới bằng hàm tạo {{domxref("ClipboardItem.ClipboardItem", "ClipboardItem()")}}, rồi truyền nó vào phương thức {{domxref("Clipboard.write()")}} để sao chép văn bản vào clipboard.

Cuối cùng, chúng ta thêm một trình lắng nghe sự kiện cho `<button>` để chạy hàm khi nút được nhấn.

```js
const textSource = document.querySelector("p");
const copyBtn = document.querySelector("button");

async function copyToClipboard() {
  const type = "text/plain";
  const clipboardItemData = {
    [type]: textSource.textContent,
  };
  const clipboardItem = new ClipboardItem(clipboardItemData);
  await navigator.clipboard.write([clipboardItem]);
}

copyBtn.addEventListener("click", copyToClipboard);
```

### Ghi một ảnh vào clipboard

Ở đây, chúng ta dùng {{domxref("ClipboardItem.supports_static", "supports()")}} để kiểm tra xem kiểu dữ liệu MIME `image/svg+xml` có được hỗ trợ hay không.
Nếu có, chúng ta lấy một ảnh SVG bằng [Fetch API](/en-US/docs/Web/API/Fetch_API), rồi đọc nó vào một {{domxref("Blob")}}, sau đó dùng blob này để tạo một `ClipboardItem` được ghi vào clipboard.

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
      console.log("Fetched image copied.");
    } else {
      console.log("SVG images are not supported by the clipboard.");
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

### Đọc từ clipboard

Ở đây, chúng ta trả về tất cả các mục trong clipboard thông qua phương thức {{domxref("clipboard.read()")}}.
Sau đó dùng thuộc tính {{domxref("ClipboardItem.types")}} để đặt đối số cho {{domxref("ClipboardItem.getType", "getType()")}} và trả về đối tượng blob tương ứng.

```js
async function getClipboardContents() {
  try {
    const clipboardItems = await navigator.clipboard.read();

    for (const clipboardItem of clipboardItems) {
      for (const type of clipboardItem.types) {
        const blob = await clipboardItem.getType(type);
        // we can now use blob here
      }
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

- {{domxref("ClipboardChangeEvent")}}
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
