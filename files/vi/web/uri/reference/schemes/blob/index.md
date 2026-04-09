---
title: "blob: URLs"
short-title: "blob:"
slug: Web/URI/Reference/Schemes/blob
page-type: uri-scheme
browser-compat: api.URL.createObjectURL_static
spec-urls: https://w3c.github.io/FileAPI/#url
sidebar: urlsidebar
---

**Blob URL** (hoặc object URL), tức các URL có tiền tố là scheme `blob:`, cho phép tích hợp {{domxref("Blob")}} và {{domxref("MediaSource")}} với các API khác vốn chỉ được thiết kế để dùng với URL, chẳng hạn phần tử {{HTMLElement("img")}}. Blob URL cũng có thể được dùng để điều hướng tới cũng như kích hoạt tải xuống dữ liệu được tạo cục bộ. Chúng được thiết kế như các định danh mờ đục (tức là bạn không nên tự viết tay chúng) và nên được quản lý bằng các hàm {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}} và {{domxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}}.

Blob URL tương tự như [data URL](/en-US/docs/Web/URI/Reference/Schemes/data), vì cả hai đều cho phép biểu diễn tài nguyên nằm trong bộ nhớ dưới dạng URL; điểm khác là data URL nhúng tài nguyên ngay trong chính nó và có giới hạn kích thước rất nghiêm ngặt, còn blob URL cần một `Blob` hoặc `MediaSource` làm nền và có thể biểu diễn tài nguyên lớn hơn.

## Cú pháp

```url
blob:<origin>/<uuid>
```

- `blob:`
  - : Scheme của URL.
- `<origin>`
  - : [Origin](/en-US/docs/Web/API/URL/origin) của thực thể đã tạo URL này. Nếu origin của tác giả là opaque, thì phần này phụ thuộc vào cách triển khai.
- `<uuid>`
  - : Một {{glossary("UUID")}}.

## Ghi chú sử dụng

### Quản lý bộ nhớ

Mỗi lần bạn gọi `createObjectURL()`, một object URL mới sẽ được tạo ra, ngay cả khi bạn đã tạo một URL cho cùng đối tượng đó trước đó. Mỗi URL trong số này phải được giải phóng bằng cách gọi {{domxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}} khi bạn không còn cần chúng nữa. Chừng nào còn một object URL hoạt động, đối tượng nền bên dưới không thể được garbage collection và có thể gây rò rỉ bộ nhớ.

Trình duyệt sẽ tự động giải phóng object URL khi tài liệu được unload; tuy nhiên, để đạt hiệu năng và mức dùng bộ nhớ tối ưu, nếu có thời điểm an toàn để bạn chủ động giải phóng chúng thì nên làm như vậy.

Tuy nhiên, tránh giải phóng object URL quá sớm. Một anti-pattern phổ biến là như sau:

```js example-bad
const url = URL.createObjectURL(blob);
img.src = url;
img.addEventListener("load", () => {
  URL.revokeObjectURL(url);
});
document.body.appendChild(img);
```

Việc revoke blob URL ngay sau khi ảnh được hiển thị sẽ khiến ảnh không còn dùng được cho các tương tác của người dùng, chẳng hạn nhấp chuột phải để lưu ảnh hoặc mở nó trong một tab mới. Với các ứng dụng tồn tại lâu, bạn chỉ nên revoke object URL khi tài nguyên không còn có thể truy cập được bởi người dùng, chẳng hạn khi ảnh đã bị xóa khỏi DOM.

### Phân vùng lưu trữ

Việc truy cập tài nguyên thông qua blob URL tuân theo cùng các hạn chế như mọi cơ chế lưu trữ khác, tức là [state partitioning](/en-US/docs/Web/Privacy/Guides/State_Partitioning). Blob URL có một origin tạo liên kết kèm theo (được lưu ngay trong URL) và chỉ có thể được fetch từ các môi trường có storage key khớp với môi trường tạo ra nó. Các _navigations_ bằng blob URL không chịu hạn chế này, mặc dù trình duyệt có thể áp đặt các biện pháp bảo mật như [`noopener`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) đối với điều hướng cross-site tới một blob URL.

### Dùng object URL cho luồng media

Trong các phiên bản cũ của đặc tả Media Source, việc gắn một stream vào phần tử {{HTMLElement("video")}} yêu cầu tạo một object URL cho {{domxref("MediaStream")}}. Điều này hiện không còn cần thiết nữa, và các trình duyệt đang loại bỏ hỗ trợ cho cách làm này.

> [!WARNING]
> Nếu bạn vẫn còn mã phụ thuộc vào `createObjectURL()` để gắn stream vào các phần tử media, bạn cần cập nhật mã của mình để đặt trực tiếp {{domxref("HTMLMediaElement.srcObject", "srcObject")}} thành `MediaStream`.

### Fetch với header Range

Blob URL hỗ trợ fetch với header [`Range`](/en-US/docs/Web/HTTP/Reference/Headers/Range) để yêu cầu nội dung một phần. Điều này đặc biệt hữu ích khi làm việc với các blob lớn, cho phép bạn chỉ lấy những phần cần thiết của blob thay vì toàn bộ nội dung. Để xem ví dụ, hãy xem [fetch một phạm vi từ blob URL](/en-US/docs/Web/HTTP/Reference/Headers/Range#fetching_a_range_from_a_blob_url).

## Ví dụ

### Blob URL hợp lệ

```url
blob:https://example.org/40a5fb5a-d56d-4a33-b4e2-0acf6a8e5f64
```

### Tạo blob URL

Trong ví dụ này, trước tiên chúng ta tạo một {{domxref("Blob")}} từ một {{HTMLElement("canvas")}}, tạo một blob URL cho nó, rồi cuối cùng gán URL đó cho một phần tử {{HTMLElement("img")}}.

```js
const canvas = document.querySelector("canvas");
canvas.toBlob((blob) => {
  const img = document.createElement("img");
  img.src = URL.createObjectURL(blob);
  document.body.appendChild(img);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [Sử dụng object URL để hiển thị hình ảnh](/en-US/docs/Web/API/File_API/Using_files_from_web_applications#example_using_object_urls_to_display_images)
- {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}
- {{domxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}}
- [Danh sách IANA các URI schemes](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml)
