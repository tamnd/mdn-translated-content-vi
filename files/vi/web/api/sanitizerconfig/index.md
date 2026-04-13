---
title: SanitizerConfig
slug: Web/API/SanitizerConfig
page-type: web-api-interface
browser-compat:
  - api.Sanitizer.get
  - api.Sanitizer.Sanitizer
---

{{APIRef("HTML Sanitizer API")}}

Từ điển **`SanitizerConfig`** của [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) chỉ định các phần tử, thuộc tính và bình luận nào được phép hoặc nên bị xóa khi chèn chuỗi HTML vào {{domxref("Element")}} hay {{domxref("ShadowRoot")}}, hoặc khi phân tích cú pháp chuỗi HTML thành {{domxref("Document")}}.

Lưu ý rằng thông thường các phiên bản {{domxref("Sanitizer")}} được sử dụng thay vì các đối tượng `SanitizerConfig`, vì chúng hiệu quả hơn để chia sẻ và sửa đổi.

## Thuộc tính phiên bản

- `elements`
  - : Mảng cho biết các phần tử cần cho phép khi làm sạch HTML, tùy chọn cũng chỉ định các thuộc tính được phép hoặc bị xóa.

    Mỗi phần tử có thể được chỉ định theo tên (chuỗi) hoặc dưới dạng đối tượng với các thuộc tính:
    - `name`
      - : Chuỗi chứa tên của phần tử.
    - `namespace` {{optional_inline}}
      - : Chuỗi chứa namespace của phần tử. Namespace mặc định là `"http://www.w3.org/1999/xhtml"`.
    - `attributes` {{optional_inline}}
      - : Mảng cho biết các thuộc tính cần cho phép trên phần tử (được phép) này khi làm sạch HTML.
    - `removeAttributes` {{optional_inline}}
      - : Mảng cho biết các thuộc tính cần xóa khỏi phần tử (được phép) này khi làm sạch HTML.

- `removeElements`
  - : Mảng cho biết các phần tử cần xóa khi làm sạch HTML.

    Mỗi phần tử có thể được chỉ định theo tên (chuỗi) hoặc dưới dạng đối tượng với `name` và `namespace` tùy chọn.

- `replaceWithChildrenElements`
  - : Mảng cho biết các phần tử cần thay thế bằng nội dung của chúng khi làm sạch HTML. Chủ yếu được dùng để xóa kiểu dáng khỏi văn bản (ví dụ: bạn có thể sử dụng điều này để chuyển `<b>một số văn bản</b>` thành `một số văn bản`).

- `attributes`
  - : Mảng cho biết các thuộc tính cần cho phép khi làm sạch HTML.

    Mỗi thuộc tính có thể được chỉ định theo tên (chuỗi) hoặc dưới dạng đối tượng với `name` và `namespace` tùy chọn.

- `removeAttributes`
  - : Mảng cho biết các thuộc tính cần xóa khỏi các phần tử khi làm sạch HTML.

- `comments`
  - : `true` nếu các bình luận được phép, và `false` nếu chúng cần bị xóa.

- `dataAttributes`
  - : `true` nếu tất cả các thuộc tính `data-*` sẽ được phép (trong trường hợp này, các thuộc tính `data-*` không được liệt kê trong mảng `attributes`).
    Nếu `false`, bất kỳ thuộc tính `data-*` nào cần được phép phải được liệt kê trong mảng `attributes`.

## Mô tả

**`SanitizerConfig`** chỉ định các phần tử, thuộc tính và bình luận nào được phép hoặc nên bị xóa khi chèn chuỗi HTML vào {{domxref("Element")}} hay {{domxref("ShadowRoot")}}, hoặc khi phân tích cú pháp chuỗi HTML thành {{domxref("Document")}}.

Một phiên bản của loại này có thể được truyền vào hàm tạo {{domxref("Sanitizer.Sanitizer", "Sanitizer()")}} để cấu hình {{domxref("Sanitizer")}}, và được trả về bởi {{domxref('Sanitizer.get()')}}.
Nó cũng có thể được truyền làm tham số `option.sanitizer` khi gọi các [phương thức làm sạch](/en-US/docs/Web/API/HTML_Sanitizer_API#sanitization_methods).

### Cấu hình hợp lệ

Cấu trúc đối tượng cấu hình cho phép khai báo các tùy chọn bộ lọc mâu thuẫn hoặc dư thừa.
Để tránh bất kỳ sự mơ hồ nào, các phương thức nhận phiên bản `SanitizerConfig` yêu cầu đối tượng cấu hình _hợp lệ_ được truyền vào, và sẽ ném {{jsxref("TypeError")}} nếu cấu hình không hợp lệ.

Trong cấu hình sanitizer hợp lệ:

- Có thể định nghĩa mảng `elements` hoặc `removeElements`, nhưng không phải cả hai.
- Có thể định nghĩa mảng `attributes` hoặc `removeAttributes` toàn cục, nhưng không phải cả hai.
- Mảng `replaceWithChildrenElements`, nếu được định nghĩa, không được có phần tử nào chung với `elements` hoặc `removeElements`.
- Không có mảng nào được chứa các phần tử hoặc thuộc tính trùng lặp.

Đối tượng rỗng `{}` là cấu hình hợp lệ.

### Cấu hình cho phép và xóa

Một cấu hình có mảng `elements` và/hoặc `attributes` được gọi là [allow configuration](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations), vì nó xác định hành vi làm sạch theo các giá trị được phép có trong đầu ra.
[remove configuration](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations) là cấu hình có `removeElements` và/hoặc `removeAttributes`, xác định hành vi theo các giá trị sẽ bị xóa khỏi đầu ra.

## Ví dụ

### Tạo cấu hình "allow"

Ví dụ này cho thấy cách tạo cấu hình sanitizer "allow" cho phép các phần tử và thuộc tính cụ thể, thay thế các phần tử {{htmlelement("b")}} bằng phần tử con của chúng, cho phép bình luận được bao gồm trong đầu ra và yêu cầu các thuộc tính `data-*` phải được liệt kê rõ ràng.

```js
const sanitizer = new Sanitizer({
  elements: ["div", "p", "script"],
  attributes: ["id"],
  replaceWithChildrenElements: ["b"],
  comments: true,
  dataAttributes: false,
});
```

### Tạo cấu hình "remove"

Ví dụ này cho thấy cách tạo cấu hình sanitizer "remove" xóa cả phần tử lẫn thuộc tính.

```js
const sanitizer = new Sanitizer({
  removeElements: ["span", "script"],
  removeAttributes: ["lang", "id"],
  comments: false,
});
```

### Cấu hình cho phép phần tử và xóa thuộc tính

Ví dụ này cho thấy cách tạo cấu hình sanitizer "kết hợp" cho phép một số phần tử và xóa một số thuộc tính nhất định.

```js
const sanitizer = new Sanitizer({
  elements: ["span", "script"],
  removeAttributes: ["lang", "id"],
});
```

### Các cấu hình không hợp lệ

Phần này hiển thị một số cấu hình không hợp lệ. Các cấu hình này sẽ ném `TypeError`.

Không hợp lệ vì cả `elements` và `removeElements` đều được định nghĩa:

```js
const sanitizer1 = new Sanitizer({
  elements: ["span", "script"],
  removeElements: ["div", "b"],
});
```

Không hợp lệ vì {{htmlelement("span")}} có trong cả `elements` và `replaceWithChildrenElements`:

```js
const sanitizer2 = new Sanitizer({
  elements: ["span", "div"],
  replaceWithChildrenElements: ["span"],
});
```

Không hợp lệ vì thuộc tính dư thừa `"data-test"` được định nghĩa khi `dataAttributes` là true:

```js
const sanitizer3 = new Sanitizer({
  attributes: ["lang", "id", "data-test"],
  dataAttributes: true,
});
```

Không hợp lệ vì có cả `removeAttributes` và `dataAttributes` được định nghĩa:

```js
const sanitizer4 = new Sanitizer({
  removeAttributes: ["lang", "id"],
  dataAttributes: true,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
