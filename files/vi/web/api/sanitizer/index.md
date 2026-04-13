---
title: Sanitizer
slug: Web/API/Sanitizer
page-type: web-api-interface
browser-compat: api.Sanitizer
---

{{APIRef("HTML Sanitizer API")}}

Giao diện **`Sanitizer`** của [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) định nghĩa một đối tượng cấu hình xác định những phần tử, thuộc tính và chú thích nào được phép hoặc cần bị xóa khi chèn các chuỗi HTML vào {{domxref("Element")}} hoặc {{domxref("ShadowRoot")}}, hoặc khi phân tích chuỗi HTML thành {{domxref("Document")}}.

## Hàm khởi tạo

- {{domxref("Sanitizer.Sanitizer", "Sanitizer()")}}
  - : Tạo và trả về một đối tượng `Sanitizer`, tùy chọn với hành vi làm sạch tùy chỉnh được định nghĩa trong {{domxref('SanitizerConfig')}}.

## Phương thức phiên bản

- {{domxref('Sanitizer.allowElement()')}}
  - : Đặt một phần tử là được phép bởi bộ làm sạch, tùy chọn với một mảng các thuộc tính được phép hoặc không được phép.
- {{domxref('Sanitizer.get()')}}
  - : Trả về cấu hình `Sanitizer` hiện tại dưới dạng một phiên bản từ điển {{domxref('SanitizerConfig')}}.
- {{domxref('Sanitizer.removeElement()')}}
  - : Đặt một phần tử để bị xóa bởi bộ làm sạch.
- {{domxref('Sanitizer.removeUnsafe()')}}
  - : Cập nhật cấu hình bộ làm sạch để nó sẽ xóa bất kỳ HTML không an toàn XSS nào.
- {{domxref('Sanitizer.replaceElementWithChildren()')}}
  - : Đặt một phần tử để được thay thế bởi các phần tử HTML con của nó.
- {{domxref('Sanitizer.allowAttribute()')}}
  - : Đặt một thuộc tính là được phép trên bất kỳ phần tử nào.
- {{domxref('Sanitizer.removeAttribute()')}}
  - : Đặt một thuộc tính để bị xóa khỏi bất kỳ phần tử nào.
- {{domxref('Sanitizer.setComments()')}}
  - : Đặt liệu các chú thích có được phép hay bị xóa bởi bộ làm sạch.
- {{domxref('Sanitizer.setDataAttributes()')}}
  - : Đặt liệu các thuộc tính dữ liệu trên các phần tử có được phép hay bị xóa bởi bộ làm sạch.

## Mô tả

`Sanitizer` là một đối tượng cấu hình có thể tái sử dụng xác định những phần tử, thuộc tính và chú thích nào được phép hoặc cần bị xóa khi chèn các chuỗi HTML vào {{domxref("Element")}} hoặc {{domxref("ShadowRoot")}}, hoặc khi phân tích chuỗi HTML thành {{domxref("Document")}}.
Nó có thể được dùng với các [phương thức làm sạch](/en-US/docs/Web/API/HTML_Sanitizer_API#sanitization_methods) sau:

- Phương thức an toàn: {{domxref("Element.setHTML()")}}, {{domxref("ShadowRoot.setHTML()")}}, và [`Document.parseHTML()`](/en-US/docs/Web/API/Document/parseHTML_static).
- Phương thức không an toàn: {{domxref("Element.setHTMLUnsafe()")}}, {{domxref("ShadowRoot.setHTMLUnsafe()")}}, và [`Document.parseHTMLUnsafe()`](/en-US/docs/Web/API/Document/parseHTMLUnsafe_static).

Một phiên bản `Sanitizer` có thể được xây dựng từ {{domxref("SanitizerConfig")}}, và thực chất là một trình bao bọc xung quanh đối tượng đó. Một `Sanitizer` và một `SanitizerConfig` có thể được dùng với các phương thức giống nhau, nhưng nếu bạn sử dụng cùng một cấu hình nhiều lần, dự kiến sẽ hiệu quả hơn khi dùng `Sanitizer` và sửa đổi nó khi cần.
Nếu không có `SanitizerConfig` nào được truyền vào hàm khởi tạo, bộ làm sạch được tạo với [cấu hình bộ làm sạch mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration), loại bỏ các phần tử và thuộc tính không an toàn XSS, cùng với các phần tử và thuộc tính khác có thể được dùng trong các cuộc tấn công khác như clickjacking và giả mạo.

Lưu ý rằng bất kỳ `Sanitizer` nào cũng có thể được làm an toàn XSS bằng cách gọi {{domxref("Sanitizer.removeUnsafe()")}}, nhưng các phần tử và thuộc tính có thể nguy hiểm khác — bị xóa bởi cấu hình mặc định — vẫn có thể có mặt.

### Dùng `Sanitizer` với các phương thức làm sạch

Cấu hình `Sanitizer` mặc định được tự động sử dụng nếu không có `Sanitizer` nào được truyền vào {{domxref("Element.setHTML")}} hoặc các phương thức làm sạch an toàn khác.
Đây là mặc định hợp lý vì nó hạn chế bề mặt tấn công trong khi vẫn cho phép phần lớn các trường hợp sử dụng.

Nếu một bộ làm sạch tùy chỉnh được truyền vào các phương thức này, bất kỳ phần tử và thuộc tính không an toàn XSS nào được phép bởi bộ làm sạch cũng sẽ bị xóa.
Lưu ý rằng mặc dù điều này xóa các phần tử giống như {{domxref("Sanitizer.removeUnsafe()")}}, `Sanitizer` được truyền vào không thực sự bị thay đổi bởi thao tác: nó sẽ "không an toàn" nếu được dùng trong phương thức không an toàn.

Các phương thức làm sạch không an toàn mặc định không thực hiện làm sạch.
Tuy nhiên, như đã lưu ý, bạn có thể gọi {{domxref("Sanitizer.removeUnsafe()")}} để xóa bất kỳ phần tử không an toàn XSS nào (nếu bạn muốn dùng cấu hình mặc định, hãy dùng phương thức an toàn).

## Ví dụ

Để biết thêm ví dụ, xem [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) và các phương thức riêng lẻ.
Dưới đây chúng tôi trình bày một số ví dụ về cách bạn có thể tạo các cấu hình bộ làm sạch khác nhau.

### Tạo bộ làm sạch mặc định

Bộ làm sạch mặc định được tạo như sau.

```js
const sanitizer = new Sanitizer();
```

Các [phương thức làm sạch](/en-US/docs/Web/API/HTML_Sanitizer_API#sanitization_methods) an toàn XSS tạo cùng bộ làm sạch tự động nếu không có tùy chọn nào được truyền vào.

### Tạo bộ làm sạch rỗng

Để tạo bộ làm sạch rỗng, truyền một đối tượng rỗng vào hàm khởi tạo.
Cấu hình bộ làm sạch kết quả là một [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations) với các mảng rỗng.

```js
const sanitizer = new Sanitizer({});
console.log(sanitizer.get());
/*
{
  "comments": true,
  "removeAttributes": [],
  "removeElements": []
}
*/
```

### Tạo bộ làm sạch "cho phép"

Ví dụ này cho thấy cách bạn có thể tạo "bộ làm sạch cho phép": một bộ làm sạch chỉ cho phép một tập hợp con các thuộc tính và phần tử.

Mã trước tiên dùng hàm khởi tạo {{domxref("Sanitizer.Sanitizer", "Sanitizer()")}} để tạo `Sanitizer`, chỉ định {{domxref("SanitizerConfig")}} cho phép các phần tử `<div>`, `<p>` và `<script>`.

Ví dụ sau đó dùng `allowElement()` để thêm cho phép các phần tử `<span>`, `allowAttribute()` để cho phép thuộc tính `id` trên bất kỳ phần tử nào, và phương thức `replaceElementWithChildren()` để đặt rằng bất kỳ phần tử `<b>` nào sẽ được thay thế bởi nội dung bên trong của chúng (đây là một loại "cho phép" vì bạn đang chỉ định rõ ràng một số thực thể để giữ lại).
Cuối cùng chúng tôi chỉ định rằng các chú thích phải được giữ lại.

```js
const sanitizer = new Sanitizer({ elements: ["div", "p", "script"] });
sanitizer.allowElement("span");
sanitizer.allowAttribute("id");
sanitizer.replaceElementWithChildren("b");
sanitizer.setComments(true);
```

### Tạo bộ làm sạch "xóa"

Ví dụ này cho thấy cách bạn có thể tạo "bộ làm sạch xóa", chỉ định các mục cần xóa khỏi đầu vào.

Mã trước tiên dùng hàm khởi tạo {{domxref("Sanitizer.Sanitizer", "Sanitizer()")}} để tạo `Sanitizer`, chỉ định {{domxref("SanitizerConfig")}} xóa các phần tử `<span>` và `<script>`.
Sau đó chúng tôi dùng `removeElement()` để thêm `<h6>` vào mảng các phần tử cần xóa, và `removeAttribute()` để xóa `lang` khỏi danh sách thuộc tính. Chúng tôi cũng xóa các chú thích.

```js
const sanitizer = new Sanitizer({ removeElements: ["span", "script"] });
sanitizer.removeElement("h6");
sanitizer.removeAttribute("lang");
sanitizer.setComments(false);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
