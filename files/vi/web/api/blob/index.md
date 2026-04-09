---
title: Blob
slug: Web/API/Blob
page-type: web-api-interface
browser-compat: api.Blob
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Giao diện **`Blob`** biểu diễn một blob, tức là một đối tượng giống như tệp chứa dữ liệu thô, bất biến; có thể đọc blob dưới dạng văn bản hoặc dữ liệu nhị phân, hoặc chuyển đổi nó thành một {{DOMxRef("ReadableStream")}} để dùng các phương thức của stream xử lý dữ liệu.

Blob có thể biểu diễn dữ liệu không nhất thiết ở định dạng gốc của JavaScript. Giao diện {{DOMxRef("File")}} được xây dựng dựa trên `Blob`, kế thừa chức năng của blob và mở rộng để hỗ trợ các tệp trên hệ thống của người dùng.

## Sử dụng blob

Để tạo một `Blob` từ các đối tượng không phải blob và dữ liệu khác, dùng hàm tạo {{DOMxRef("Blob.Blob", "Blob()")}}. Để tạo một blob chứa một phần dữ liệu của blob khác, dùng phương thức {{DOMxRef("Blob.slice()", "slice()")}}. Để lấy đối tượng `Blob` cho một tệp trên hệ thống tệp của người dùng, xem tài liệu về {{DOMxRef("File")}}.

Các API chấp nhận đối tượng `Blob` cũng được liệt kê trong tài liệu {{DOMxRef("File")}}.

## Hàm tạo

- {{DOMxRef("Blob.Blob", "Blob()")}}
  - : Trả về một đối tượng `Blob` mới được tạo, chứa phần nối của toàn bộ dữ liệu trong mảng được truyền vào hàm tạo.

## Thuộc tính thể hiện

- {{DOMxRef("Blob.size")}} {{ReadOnlyInline}}
  - : Kích thước tính bằng byte của dữ liệu chứa trong đối tượng `Blob`.
- {{DOMxRef("Blob.type")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị kiểu MIME của dữ liệu chứa trong `Blob`. Nếu kiểu chưa biết, chuỗi này rỗng.

## Phương thức thể hiện

- {{DOMxRef("Blob.arrayBuffer()")}}
  - : Trả về một promise được resolve với một {{jsxref("ArrayBuffer")}} chứa toàn bộ nội dung của `Blob` dưới dạng dữ liệu nhị phân.
- {{DOMxRef("Blob.bytes()")}}
  - : Trả về một promise được resolve với một {{jsxref("Uint8Array")}} chứa nội dung của `Blob`.
- {{DOMxRef("Blob.slice()")}}
  - : Trả về một đối tượng `Blob` mới chứa dữ liệu trong phạm vi byte được chỉ định của blob mà phương thức được gọi trên đó.
- {{DOMxRef("Blob.stream()")}}
  - : Trả về một {{DOMxRef("ReadableStream")}} có thể dùng để đọc nội dung của `Blob`.
- {{DOMxRef("Blob.text()")}}
  - : Trả về một promise được resolve với một chuỗi chứa toàn bộ nội dung của `Blob`, được diễn giải là văn bản UTF-8.

## Ví dụ

### Tạo blob

Hàm tạo {{DOMxRef("Blob.Blob", "Blob()")}} có thể tạo blob từ các đối tượng khác. Ví dụ, để tạo blob từ một chuỗi JSON:

```js
const obj = { hello: "world" };
const blob = new Blob([JSON.stringify(obj, null, 2)], {
  type: "application/json",
});
```

### Tạo URL biểu diễn nội dung của một typed array

Ví dụ sau tạo một [typed array](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) JavaScript và tạo một `Blob` mới chứa dữ liệu của typed array đó. Sau đó, nó gọi {{DOMxRef("URL/createObjectURL_static", "URL.createObjectURL()")}} để chuyển blob thành một {{glossary("URL")}}.

```html live-sample___url-from-array
<p>
  Ví dụ này tạo một typed array chứa các mã ASCII từ ký tự khoảng trắng đến chữ
  Z, rồi chuyển nó thành một object URL. Một liên kết để mở object URL đó sẽ
  được tạo ra. Nhấp vào liên kết để xem object URL sau khi được giải mã.
</p>
```

Phần mã chính của ví dụ này là hàm `typedArrayToURL()`, hàm này tạo một `Blob` từ typed array được cung cấp và trả về một object URL cho nó. Sau khi dữ liệu được chuyển thành object URL, bạn có thể dùng nó theo nhiều cách, bao gồm làm giá trị cho thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) của phần tử {{HTMLElement("img")}} (dĩ nhiên là với giả định dữ liệu chứa một hình ảnh).

```js live-sample___url-from-array
function showViewLiveResultButton() {
  if (window.self !== window.top) {
    // Ensure that if our document is in a frame, we get the user
    // to first open it in its own tab or window. Otherwise, this
    // example won't work.
    const p = document.querySelector("p");
    p.textContent = "";
    const button = document.createElement("button");
    button.textContent = "Xem kết quả trực tiếp của đoạn mã ví dụ ở trên";
    p.append(button);
    button.addEventListener("click", () => window.open(location.href));
    return true;
  }
  return false;
}

if (!showViewLiveResultButton()) {
  function typedArrayToURL(typedArray, mimeType) {
    return URL.createObjectURL(
      new Blob([typedArray.buffer], { type: mimeType }),
    );
  }
  const bytes = new Uint8Array(59);

  for (let i = 0; i < 59; i++) {
    bytes[i] = 32 + i;
  }

  const url = typedArrayToURL(bytes, "text/plain");
  const link = document.createElement("a");

  link.href = url;
  link.innerText = "Mở URL của mảng";
  document.body.appendChild(link);
}
```

{{EmbedLiveSample('url-from-array', , , , , , , 'allow-popups')}}

### Trích xuất dữ liệu từ blob

Một cách để đọc nội dung từ `Blob` là dùng {{DOMxRef("FileReader")}}. Đoạn mã sau đọc nội dung của một `Blob` dưới dạng typed array:

```js
const reader = new FileReader();
reader.addEventListener("loadend", () => {
  // reader.result chứa nội dung của blob dưới dạng typed array
});
reader.readAsArrayBuffer(blob);
```

Một cách khác để đọc nội dung từ `Blob` là dùng {{domxref("Response")}}. Đoạn mã sau đọc nội dung của một `Blob` dưới dạng văn bản:

```js
const text = await new Response(blob).text();
```

Hoặc bằng cách dùng {{DOMxRef("Blob.text()")}}:

```js
const text = await blob.text();
```

Bằng cách dùng các phương thức khác của `FileReader`, bạn có thể đọc nội dung của Blob dưới dạng chuỗi hoặc data URL.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("FileReader")}}
- {{DOMxRef("File")}}
- {{DOMxRef("URL/createObjectURL_static", "URL.createObjectURL()")}}
- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
